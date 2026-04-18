# Instrumentation Plan

## Log Points (2-8 points)

| #   | Location | Event Name | HID | Data Fields |
| --- | -------- | ---------- | --- | ----------- |
| 1   |          |            |     |             |
| 2   |          |            |     |             |
| 3   |          |            |     |             |

## JSONL Output Example

```json
{"event": "...", "hid": "H1", "data": {...}}
```

## Checklist

- [ ] All instrumentation is enclosed by `BEGIN` / `END` markers (even single-line)
- [ ] No inline `RDM@debug-mode` markers are used
- [ ] No secrets or PII in logged data
- [ ] Output goes to stderr (not stdout)
