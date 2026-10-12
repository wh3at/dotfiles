#!/usr/bin/env python3
"""
RDM Cleanup Script - Remove debug-mode instrumentation blocks.

Usage:
    python rdm_cleanup.py --check --root .   # Check for markers (exit 1 if found)
    python rdm_cleanup.py --apply --root .   # Remove block markers and their blocks
    python rdm_cleanup.py --root .           # Dry-run (show what would be removed)

Note: Inline `RDM@debug-mode` markers are invalid and are reported but not removed.
"""

import argparse
import os
import re
import sys
from pathlib import Path
from typing import List, Tuple

MARKER = "RDM@debug-mode"
MARKER_BEGIN = f"{MARKER} BEGIN"
MARKER_END = f"{MARKER} END"

# Supported file extensions
EXTENSIONS = {
    # Python
    ".py",
    # JavaScript/TypeScript
    ".js", ".jsx", ".ts", ".tsx", ".mjs", ".cjs",
    # Go
    ".go",
    # Rust
    ".rs",
    # Java/Kotlin
    ".java", ".kt", ".kts",
    # Swift
    ".swift",
    # Ruby
    ".rb",
    # PHP
    ".php",
    # C/C++
    ".c", ".cpp", ".cc", ".cxx", ".h", ".hpp",
    # C#
    ".cs",
    # Scala
    ".scala",
    # Elixir
    ".ex", ".exs",
}

# Directories to skip
SKIP_DIRS = {
    ".git",
    "node_modules",
    "dist",
    "build",
    ".venv",
    "venv",
    "__pycache__",
    ".cache",
    "vendor",
    "target",
    ".next",
    ".nuxt",
    "out",
    "coverage",
}


def find_source_files(root: Path) -> List[Path]:
    """Find all source files with supported extensions."""
    files = []
    for dirpath, dirnames, filenames in os.walk(root):
        # Skip excluded directories
        dirnames[:] = [d for d in dirnames if d not in SKIP_DIRS]

        for filename in filenames:
            if any(filename.endswith(ext) for ext in EXTENSIONS):
                files.append(Path(dirpath) / filename)
    return files


def process_file(filepath: Path, apply: bool = False) -> Tuple[int, int, List[str]]:
    """
    Process a file to find/remove markers.

    Returns:
        (lines_removed, markers_found, details)
    """
    try:
        with open(filepath, "r", encoding="utf-8", errors="replace") as f:
            lines = f.readlines()
    except Exception as e:
        return 0, 0, [f"  Error reading: {e}"]

    new_lines = []
    lines_removed = 0
    markers_found = 0
    inline_markers_found = 0
    details = []
    in_block = False
    block_start_line = 0

    for i, line in enumerate(lines, 1):
        has_marker = MARKER in line
        is_begin = MARKER_BEGIN in line
        is_end = MARKER_END in line

        if is_begin:
            in_block = True
            block_start_line = i
            markers_found += 1
            lines_removed += 1
            details.append(f"  Line {i}: Block BEGIN")
            continue

        if is_end:
            if in_block:
                in_block = False
                lines_removed += 1
                details.append(f"  Line {i}: Block END (started at {block_start_line})")
            else:
                # Orphaned END marker
                markers_found += 1
                lines_removed += 1
            details.append(f"  Line {i}: Orphaned END marker")
            continue

        if in_block:
            lines_removed += 1
            continue

        if has_marker:
            # Inline markers are no longer allowed; flag but don't remove by default
            markers_found += 1
            inline_markers_found += 1
            details.append(f"  Line {i}: Inline marker (not removed)")
            new_lines.append(line)
            continue

        new_lines.append(line)

    # Check for unclosed block
    if in_block:
        details.append(f"  WARNING: Unclosed block starting at line {block_start_line}")

    if apply and lines_removed > 0:
        try:
            with open(filepath, "w", encoding="utf-8") as f:
                f.writelines(new_lines)
        except Exception as e:
            details.append(f"  Error writing: {e}")

    return lines_removed, markers_found, details


def main():
    parser = argparse.ArgumentParser(
        description="Remove RDM@debug-mode instrumentation blocks"
    )
    parser.add_argument(
        "--root",
        type=str,
        default=".",
        help="Root directory to scan (default: current directory)"
    )
    parser.add_argument(
        "--check",
        action="store_true",
        help="Check mode: exit 1 if markers found, 0 if clean"
    )
    parser.add_argument(
        "--apply",
        action="store_true",
        help="Apply mode: actually remove block markers (default is dry-run)"
    )
    parser.add_argument(
        "--verbose", "-v",
        action="store_true",
        help="Show detailed output"
    )

    args = parser.parse_args()
    root = Path(args.root).resolve()

    if not root.exists():
        print(f"Error: Root directory does not exist: {root}", file=sys.stderr)
        sys.exit(1)

    files = find_source_files(root)

    total_lines_removed = 0
    total_markers_found = 0
    total_inline_markers_found = 0
    files_with_markers = []

    for filepath in files:
        lines_removed, markers_found, details = process_file(filepath, apply=args.apply)

        if markers_found > 0:
            total_lines_removed += lines_removed
            total_markers_found += markers_found
            inline_in_file = sum(1 for d in details if "Inline marker" in d)
            total_inline_markers_found += inline_in_file
            files_with_markers.append((filepath, lines_removed, markers_found, details))

    # Output results
    if args.check:
        if total_markers_found == 0:
            print("Clean: No RDM markers found.")
            sys.exit(0)
        else:
            print(f"Found {total_markers_found} markers in {len(files_with_markers)} files:")
            for filepath, lines, markers, details in files_with_markers:
                rel_path = filepath.relative_to(root) if filepath.is_relative_to(root) else filepath
                print(f"  {rel_path}: {markers} markers, {lines} lines")
                if args.verbose:
                    for detail in details:
                        print(detail)
            if total_inline_markers_found > 0:
                print("Note: Inline markers are invalid and are not removed by --apply.")
            sys.exit(1)
    else:
        mode = "Removed" if args.apply else "Would remove"

        if total_markers_found == 0:
            print("No RDM markers found.")
        else:
            print(f"{mode} {total_lines_removed} lines ({total_markers_found} markers) from {len(files_with_markers)} files:")
            for filepath, lines, markers, details in files_with_markers:
                rel_path = filepath.relative_to(root) if filepath.is_relative_to(root) else filepath
                print(f"  {rel_path}: {lines} lines")
                if args.verbose:
                    for detail in details:
                        print(detail)

            if total_inline_markers_found > 0:
                print("Note: Inline markers are invalid and are not removed by --apply.")
            if not args.apply:
                print("\nRun with --apply to actually remove block markers.")


if __name__ == "__main__":
    main()
