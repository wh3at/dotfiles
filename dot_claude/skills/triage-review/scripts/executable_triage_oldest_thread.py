#!/usr/bin/env python3
"""Fetch and resolve the oldest unresolved review thread for the current-branch PR."""

from __future__ import annotations

import argparse
import datetime as dt
import json
import subprocess
import sys
from typing import Any, Dict, Optional

QUERY_THREADS = """
query($owner:String!, $name:String!, $number:Int!, $cursor:String) {
  repository(owner:$owner, name:$name) {
    pullRequest(number:$number) {
      reviewThreads(first:100, after:$cursor) {
        pageInfo { hasNextPage endCursor }
        nodes {
          id
          isResolved
          isOutdated
          path
          line
          firstComment: comments(first:1) { nodes { body author { login } createdAt } }
          lastComment: comments(last:1) { nodes { body author { login } createdAt } }
        }
      }
    }
  }
}
""".strip()

MUTATE_RESOLVE = """
mutation($threadId:ID!) {
  resolveReviewThread(input:{threadId:$threadId}) {
    thread { id isResolved }
  }
}
""".strip()


class GhError(RuntimeError):
    pass


def run(cmd: list[str]) -> str:
    proc = subprocess.run(cmd, text=True, capture_output=True)
    if proc.returncode != 0:
        raise GhError(proc.stderr.strip() or proc.stdout.strip())
    return proc.stdout


def gh_json(args: list[str]) -> Any:
    return json.loads(run(["gh", *args]))


def parse_time(value: str) -> dt.datetime:
    if value.endswith("Z"):
        value = value[:-1] + "+00:00"
    return dt.datetime.fromisoformat(value)


def pick_oldest_unresolved(nodes: list[Dict[str, Any]]) -> Optional[Dict[str, Any]]:
    oldest_node = None
    oldest_time: Optional[dt.datetime] = None
    for node in nodes:
        if node.get("isResolved"):
            continue
        created_at_value = thread_created_at(node)
        if not created_at_value:
            continue
        created_at = parse_time(created_at_value)
        if oldest_time is None or created_at < oldest_time:
            oldest_time = created_at
            oldest_node = node
    return oldest_node


def thread_created_at(thread: Dict[str, Any]) -> str:
    for key in ("firstComment", "lastComment"):
        block = thread.get(key) or {}
        nodes = block.get("nodes") or []
        if nodes:
            created_at = nodes[0].get("createdAt", "")
            if created_at:
                return created_at
    return ""


def unresolved_threads_sorted(nodes: list[Dict[str, Any]]) -> list[Dict[str, Any]]:
    candidates: list[tuple[dt.datetime, Dict[str, Any]]] = []
    for node in nodes:
        if node.get("isResolved"):
            continue
        created_at_value = thread_created_at(node)
        if not created_at_value:
            continue
        candidates.append((parse_time(created_at_value), node))
    candidates.sort(key=lambda item: item[0])
    return [item[1] for item in candidates]


def summarize_comment(comment_block: Dict[str, Any]) -> Dict[str, str]:
    nodes = comment_block.get("nodes") or []
    if not nodes:
        return {"author": "", "body": "", "createdAt": ""}
    node = nodes[0]
    return {
        "author": (node.get("author") or {}).get("login", ""),
        "body": node.get("body", ""),
        "createdAt": node.get("createdAt", ""),
    }


def fetch_all_threads(owner: str, name: str, number: int) -> list[Dict[str, Any]]:
    threads: list[Dict[str, Any]] = []
    cursor: Optional[str] = None
    while True:
        payload = gh_json(
            [
                "api",
                "graphql",
                "-F",
                f"owner={owner}",
                "-F",
                f"name={name}",
                "-F",
                f"number={number}",
                "-F",
                f"cursor={cursor}" if cursor else "cursor=",
                "-f",
                f"query={QUERY_THREADS}",
            ]
        )
        pr = payload["data"]["repository"]["pullRequest"]
        block = pr["reviewThreads"]
        threads.extend(block["nodes"])
        page_info = block["pageInfo"]
        if not page_info["hasNextPage"]:
            break
        cursor = page_info["endCursor"]
    return threads


def resolve_thread(thread_id: str) -> Dict[str, Any]:
    payload = gh_json([
        "api",
        "graphql",
        "-f",
        f"query={MUTATE_RESOLVE}",
        "-f",
        f"threadId={thread_id}",
    ])
    return payload["data"]["resolveReviewThread"]["thread"]


def render_output(
    pr: Dict[str, Any],
    thread: Dict[str, Any],
    resolved: Optional[Dict[str, Any]],
    status: str,
    skipped: Optional[list[Dict[str, Any]]] = None,
) -> str:
    output = {
        "status": status,
        "pr": pr,
        "thread": {
            "id": thread.get("id"),
            "createdAt": thread_created_at(thread),
            "path": thread.get("path"),
            "line": thread.get("line"),
            "isOutdated": thread.get("isOutdated"),
            "firstComment": summarize_comment(thread.get("firstComment") or {}),
            "lastComment": summarize_comment(thread.get("lastComment") or {}),
        },
        "resolved": resolved or {},
        "skipped": skipped or [],
    }
    return json.dumps(output, ensure_ascii=True, indent=2)


def run_self_test() -> int:
    fixture_nodes = [
        {
            "id": "THREAD_OLD",
            "isResolved": False,
            "isOutdated": True,
            "path": "src/example.ts",
            "line": 10,
            "firstComment": {"nodes": [{"body": "First", "author": {"login": "a"}, "createdAt": "2024-01-01T00:00:00Z"}]},
            "lastComment": {"nodes": [{"body": "Last", "author": {"login": "b"}, "createdAt": "2024-01-02T00:00:00Z"}]},
        },
        {
            "id": "THREAD_NEW",
            "isResolved": False,
            "isOutdated": False,
            "path": "src/example.ts",
            "line": 12,
            "firstComment": {"nodes": [{"body": "First2", "author": {"login": "c"}, "createdAt": "2024-01-03T00:00:00Z"}]},
            "lastComment": {"nodes": [{"body": "Last2", "author": {"login": "d"}, "createdAt": "2024-01-04T00:00:00Z"}]},
        },
    ]
    ordered = unresolved_threads_sorted(fixture_nodes)
    picked = None
    skipped = []
    for thread in ordered:
        if thread.get("isOutdated"):
            skipped.append(thread["id"])
            continue
        picked = thread
        break
    if not picked or picked["id"] != "THREAD_NEW" or skipped != ["THREAD_OLD"]:
        print("self-test failed: skip outdated selection", file=sys.stderr)
        return 1
    output = render_output(
        {"number": 123, "title": "Example", "url": "https://example/pr/123", "headRefName": "feature"},
        picked,
        {"id": picked["id"], "isResolved": True},
        "self_test",
        skipped=[{"id": "THREAD_OLD", "reason": "outdated"}],
    )
    print(output)
    return 0


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Fetch and resolve the oldest unresolved review thread for the current-branch PR."
    )
    parser.add_argument("--dry-run", action="store_true", help="Select thread but do not resolve it.")
    parser.add_argument("--self-test", action="store_true", help="Run a non-network self-test and exit.")
    args = parser.parse_args()

    if args.self_test:
        return run_self_test()

    try:
        pr = gh_json(["pr", "view", "--json", "number,title,url,headRefName"])
    except GhError as exc:
        print(f"error: no PR for current branch or gh auth missing: {exc}", file=sys.stderr)
        return 2

    try:
        repo = gh_json(["repo", "view", "--json", "name,owner"])
    except GhError as exc:
        print(f"error: failed to read repo info: {exc}", file=sys.stderr)
        return 2

    owner = repo["owner"]["login"]
    name = repo["name"]

    try:
        threads = fetch_all_threads(owner, name, int(pr["number"]))
    except GhError as exc:
        print(f"error: failed to fetch review threads: {exc}", file=sys.stderr)
        return 2

    skipped: list[Dict[str, Any]] = []
    selected = None
    for thread in unresolved_threads_sorted(threads):
        if thread.get("isOutdated"):
            skipped_entry = {
                "id": thread.get("id"),
                "createdAt": thread_created_at(thread),
                "path": thread.get("path"),
                "line": thread.get("line"),
                "reason": "outdated",
            }
            if args.dry_run:
                skipped_entry["resolved"] = {}
            else:
                try:
                    skipped_entry["resolved"] = resolve_thread(thread["id"])
                except GhError as exc:
                    print(f"error: failed to resolve outdated thread: {exc}", file=sys.stderr)
                    return 2
            skipped.append(skipped_entry)
            continue
        selected = thread
        break

    if not selected:
        if skipped and not args.dry_run:
            print("no unresolved review threads (all outdated threads resolved)", file=sys.stderr)
        else:
            print("no unresolved review threads", file=sys.stderr)
        return 3

    resolved = None
    status = "resolved"
    if args.dry_run:
        status = "dry_run"
    else:
        try:
            resolved = resolve_thread(selected["id"])
        except GhError as exc:
            print(f"error: failed to resolve thread: {exc}", file=sys.stderr)
            return 2

    print(render_output(pr, selected, resolved, status, skipped=skipped))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
