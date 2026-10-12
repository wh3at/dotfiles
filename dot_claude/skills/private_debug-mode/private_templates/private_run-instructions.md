# Run Instructions

## 1. Reproduce the Issue

<!-- Specific steps for this bug -->

## 2. Collect Logs

Logs are output to stderr. Capture with:

```bash
your-command 2> debug.log
# or
your-command 2>&1 | tee debug.log
```

## 3. Share Logs

Copy the JSONL output and paste it in the chat.

**If logs are too long:**
- Share the first 50 and last 50 lines
- Include any lines containing "error" or "warn"
- Look for BEGIN/END markers to isolate relevant sections

## Expected Log Format

Each line should be valid JSON:
```json
{"event": "...", "hid": "H1", "data": {...}}
```
