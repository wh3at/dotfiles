---
name: debug-mode
description: Only use it when explicitly specified by the user. Human-in-the-loop debugging workflow with JSONL instrumentation. Use when debugging bugs that require log analysis, when static code analysis is insufficient, when user reports "it works sometimes" or timing-dependent issues, or when you need to verify hypotheses about runtime behavior through actual execution logs.
---

# Debug Mode

Structured debugging workflow: hypothesize → instrument → reproduce → diagnose → fix → verify → cleanup by script.

**Do NOT propose fixes before collecting evidence.**

## Protocol

This workflow is iterative. Repeat Phases 3–7 until Phase 7 succeeds.
- If Phase 7 verification fails, return to Phase 2 (update hypotheses) and continue.
- Run Phase 8 cleanup by script only after Phase 7 is confirmed successful by the user.

### Phase 1: Intake

Collect from user bug details.

### Phase 2: Hypotheses

Generate **minimum 3 hypotheses** with predictions:

| HID | Hypothesis                      | If True, Log Shows       |
| --- | ------------------------------- | ------------------------ |
| H1  | Token expired before validation | `token.exp < now`        |
| H2  | Race condition in state update  | Events out of order      |
| H3  | Null reference from cache miss  | `cache.get` returns null |

### Phase 3: Instrumentation

Add **2-8 log points** to discriminate hypotheses. Use [templates/instrumentation-plan.md](templates/instrumentation-plan.md).

**Requirements:**
- All instrumentation MUST be enclosed by block markers: `RDM@debug-mode BEGIN` / `RDM@debug-mode END` (even single-line)
- Inline markers (`RDM@debug-mode` on a log line) are not allowed
- Output JSONL format

**JSONL Schema (required fields):**
```json
{"event": "auth.validate", "hid": "H1", "data": {"tokenExp": 1234567890}}
````

Optional: `ts` (ISO8601), `lvl` (debug/info/warn/error)

**Example instrumentation (Python):**

```python
# RDM@debug-mode BEGIN
import json, sys
def _rdm_log(event, hid, data):
    print(json.dumps({"event": event, "hid": hid, "data": data}), file=sys.stderr)
# RDM@debug-mode END

def validate_token(token):
    # RDM@debug-mode BEGIN
    _rdm_log("auth.validate.enter", "H1", {"token_len": len(token)})
    # RDM@debug-mode END
    # ... existing code ...
```

### Phase 4: Reproduce

Provide user with [templates/run-instructions.md](templates/run-instructions.md):

1. Exact reproduction steps
2. How to collect logs
3. Request: paste JSONL output to chat

### Phase 5: Diagnose

Analyze logs against hypotheses:

* Which hypothesis matches observed behavior?
* If inconclusive, add targeted instrumentation (Phase 3) and repeat Phase 4

### Phase 6: Fix

Implement **minimal fix** for confirmed root cause. Do not refactor unrelated code.

### Phase 7: Verify

User reproduces issue with fix applied. Confirm:

* Original bug is resolved
* No regressions introduced

If verification fails, return to Phase 2 and continue the loop.

### Phase 8: Cleanup by script

Run Phase 8 only after Phase 7 is confirmed successful by the user.

**CRITICAL: Remove all instrumentation before completion.**

#### Cleanup scripts

**Verify markers exist**
```bash
python ~/.claude/skills/debug-mode/scripts/rdm_cleanup.py --check --root .
```

**Remove all markers (block markers only)**
```bash
python ~/.claude/skills/debug-mode/scripts/rdm_cleanup.py --apply --root .
```

**Verify clean (exit 0)**
```bash
python ~/.claude/skills/debug-mode/scripts/rdm_cleanup.py --check --root .
```

If `--check` reports inline markers, delete them manually (inline markers are not allowed).

Use [templates/cleanup-checklist.md](templates/cleanup-checklist.md).

## Marker Specification

Fixed identifier for all instrumentation code:

| Pattern                | Usage                                   |
| ---------------------- | --------------------------------------- |
| `RDM@debug-mode BEGIN` | Block start (required for all logging)  |
| `RDM@debug-mode END`   | Block end                               |

**Rules:**

* Any temporary instrumentation code MUST be enclosed within a BEGIN/END block, even if it is a single line.
* Inline `RDM@debug-mode` markers are not allowed.
* Markers are for temporary debug code ONLY.
* Never add markers to actual fixes or production logic.
* **BEGIN/END lines must be standalone** (no code, no braces/terminators on the same line).
* Ensure that any marked block can be safely deleted without breaking code structure.

**Examples:**

```javascript
// ❌ BAD: Inline marker (not allowed)
_rdm_log("exit", "H1", {result});  // RDM@debug-mode

// ✅ GOOD: Single-line log wrapped in block markers
// RDM@debug-mode BEGIN
_rdm_log("exit", "H1", {result});
// RDM@debug-mode END
```

```python
# ❌ BAD: Inline marker (not allowed)
_rdm_log("return", "H1", {"result": result})  # RDM@debug-mode

# ✅ GOOD: Separate block markers around the log
# RDM@debug-mode BEGIN
_rdm_log("return", "H1", {"result": result})
# RDM@debug-mode END
return result
```

## Safety

* **Never log secrets**: passwords, tokens, API keys, PII
* **Minimize data exposure**: log IDs and metadata, not full payloads
* **Use stderr**: avoid polluting application output
