---
name: chirak:status
description: Show overall course progress, rank, lesson ratings, and completion
---

Read `.chirak/progress.json` and `course.yaml`. Display a clean progress summary.

If `.chirak/progress.json` doesn't exist, the course hasn't been initialized — suggest running the init script.

---

## Format

**Header** using unicode box-drawing:
```
┌─── чирак ────────────────────────────────────┐
│  /status · Your First Ship                   │
└──────────────────────────────────────────────┘
```

**Course and rank line:**
```
Course: Your First Ship
Rank:   чирак / chirak (apprentice)
```

**Progress bar** — show filled blocks for completed lessons:
```
Progress: ████████░░ 4/5 lessons
```
Use █ for completed, ░ for remaining. Keep it to ~10 characters wide.

**Rating summary** — show how many of each rating earned across completed lessons:
```
Ratings:  ◆◆◇  (1 майстор, 2 калфа, 1 чирак)
```
Use ◆ for калфа or майстор, ◇ for чирак (or not yet rated). Show the breakdown in parentheses.

**Шевица divider:**
```
─── ◆ ─── ◆ ─── ◆ ─── ◆ ─── ◆ ───
```

**Lesson progress table** — include rating column for completed lessons:
```
  Lesson                      Status      Rating    Attempts  Hints
  ────────────────────────────────────────────────────────────────
  01 — What Are We Building?  ✓ passed    калфа     2         1
  02 — Get It Running         ✓ passed    чирак     1         0
  03 — Ship It                ✓ passed    майстор   3         2
  04 — Trust But Verify       ◉ current   —         1         1
  05 — Change Without Fear    ○ locked    —         —         —
```

Legend: ✓ passed, ◉ current, ○ not started

For the rating column: show the Bulgarian name (чирак / калфа / майстор), or — if not yet evaluated or not yet passed.

**Rank progression indicator** — mark current position:
- `chirak` course → `◉ чирак → калфа → майстор`
- `kalfa` course → `чирак → ◉ калфа → майстор`
- `maystor` course → `чирак → калфа → ◉ майстор`

**If the course is complete**, display a completion box:
```
╔══════════════════════════════╗
║  Rank earned: чирак ✓        ║
╚══════════════════════════════╝
```

Keep it tight. This is a quick check-in, not a full brief. No prose beyond what's needed.
