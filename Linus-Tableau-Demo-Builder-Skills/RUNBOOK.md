# One-Click Runbook

Use this runbook to execute an end-to-end demo workflow quickly and consistently.

## 1) Install the skill pack

### macOS/Linux
```bash
bash install.sh /path/to/your/project
```

### Windows PowerShell
```powershell
.\install.ps1 C:\path\to\your\project
```

## 2) Start a new build session

Prompt your agent with:

1. "Use `skills/end-to-end-demo-builder/SKILL.md` and begin discovery."
2. "Read and follow `memory/MEMORY.md`."
3. "After each milestone, append new learnings to `memory/MEMORY.md`."

## 3) Required workflow order

1. Discovery and industry story
2. Data generation design
3. Data Cloud ingest and SDM creation
4. Visualization/dashboard build (Next or Pulse)
5. Devils-advocate critique and fixes
6. Final summary + memory update

## 4) Memory protocol (required)

At minimum, append to `memory/MEMORY.md`:
- what was built,
- what failed and why,
- what was fixed,
- what should be reused next session.

## 5) Publish checklist

- [ ] Skills copied into target repo
- [ ] Memory template present at `memory/MEMORY.md`
- [ ] Build scripts and references validated
- [ ] Zip created for distribution
