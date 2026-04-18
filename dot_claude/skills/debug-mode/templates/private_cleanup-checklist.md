# Cleanup Checklist

## Before Cleanup

- [ ] Bug is verified as fixed
- [ ] User confirmed fix works

## Cleanup Steps

1. **Check for markers:**
   ```bash
   python ~/.claude/skills/debug-mode/scripts/rdm_cleanup.py --check --root .
   ```
   Expected: Exit code 1 (markers found)

2. **Remove block markers:**
   ```bash
   python ~/.claude/skills/debug-mode/scripts/rdm_cleanup.py --apply --root .
   ```

3. **Verify clean:**
   ```bash
   python ~/.claude/skills/debug-mode/scripts/rdm_cleanup.py --check --root .
   ```
   Expected: Exit code 0 (no markers)

4. **Review diff:**
   ```bash
   git diff
   ```
   - Only fix-related changes should remain
   - No `RDM@debug-mode` markers (inline markers are invalid and must be removed manually)

## Final Checks

- [ ] `--check` returns exit code 0
- [ ] No debug imports remain
- [ ] No debug helper functions remain
- [ ] Git diff shows only the fix, no instrumentation
