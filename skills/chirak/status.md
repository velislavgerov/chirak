---
name: status
description: Show overall course progress, rank, and lesson completion
---

Read `.chirak/progress.json` and `course.yaml`. Display a clean progress summary.

Show the following:

**Header:**
```
Course: Your First Ship
Rank:   чирак / chirak (apprentice)
```

**Lesson progress table:**
```
  Lesson                      Status      Attempts  Hints
  ──────────────────────────────────────────────────────
  01 — What Are We Building?  ✓ passed    2         1
  02 — Get It Running         ✓ passed    1         0
  03 — Ship It                ◉ current   1         2
  04 — Trust But Verify       ○ locked    —         —
  05 — Change Without Fear    ○ locked    —         —
```

Legend: ✓ passed, ◉ current, ○ not started, ✗ not passed yet

**Summary line:**
```
Progress: 2/5 lessons complete
```

**Rank indicator** — based on the course's `rank` field:
- `chirak` → show `чирак → калфа → майстор` with current position highlighted
- `kalfa` → show `чирак → ◉ калфа → майстор`
- `maystor` → show `чирак → калфа → ◉ майстор`

**If the course is complete:**
```
╔══════════════════════════════╗
║  Rank earned: чирак ✓        ║
╚══════════════════════════════╝
```

If `.chirak/progress.json` doesn't exist, tell the learner the course hasn't been initialized and suggest running the init script.

Keep it tight — this is a quick status check, not a full brief. No prose beyond what's needed to explain the numbers.
