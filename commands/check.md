---
name: chirak:check
description: Evaluate the learner's work against the current lesson objectives, with a three-tier rating
---

Read `.chirak/progress.json` to find the current lesson. Read `course.yaml` to get the evaluation criteria.

**Format the header using unicode box-drawing characters:**
```
┌─── чирак ───────────────────────────────────┐
│  /check · Lesson 2 — Get It Running         │
└─────────────────────────────────────────────┘
```
Use the actual lesson number and title.

---

## Evaluation

For each evaluation criterion:

**`type: command`** — Run the specified command. Report whether it succeeded and what the relevant output was.

**`type: file_check`** — Check if the specified file(s) exist, read them, and evaluate whether the criteria is met.

**`type: judgment`** — Your call. Read the relevant files and any needed context, then evaluate honestly against the stated criteria.

Show each check result on its own line using ✓ for passed and ✗ for failed, with a brief note:
```
  ✓ README.md exists with problem statement
  ✓ 3–5 features listed
  ✗ Tech stack missing rationale — you listed the tools but not why
```

After all checks, output a шевица divider:
```
─── ◆ ─── ◆ ─── ◆ ─── ◆ ─── ◆ ───
```

---

## Rating

After evaluating all criteria, assign an **overall rating** based on the quality of the work — not just whether it technically passes:

**чирак** — Met the requirements. Did what was asked. Relied on Claude's defaults or suggestions without meaningfully pushing back or customizing. This is a pass, and it's what matters right now.

**калфа** — Showed independent thinking. Customized beyond defaults, made decisions that reflect genuine understanding, challenged or refined Claude's suggestions in ways that improved the result.

**майстор** — Went beyond the objectives. Anticipated edge cases, added value Claude didn't suggest, demonstrated deep understanding of tradeoffs, made the deliverable genuinely excellent rather than just sufficient.

**Display the rating as a badge:**

For чирак:
```
╔═══════════════════════════════╗
║  ◆ ЧИРАК · Apprentice         ║
╚═══════════════════════════════╝
```

For калфа:
```
╔═══════════════════════════════╗
║  ◆ КАЛФА · Journeyman         ║
╚═══════════════════════════════╝
```

For майстор:
```
╔═══════════════════════════════╗
║  ◆ МАЙСТОР · Master           ║
╚═══════════════════════════════╝
```

**After the badge**, give specific feedback in two parts:
1. What earned this rating — one concrete observation about what they actually did.
2. What would push it to the next level — a specific, actionable suggestion.

Example:
> "You earned калфа on this one. You pushed back on the default file structure and organized it in a way that makes more sense for your project — that's real judgment. What would push it to майстор: you could have documented *why* you made that choice in the README. When you come back to this in three months, that reasoning will matter."

**Tone at every level:**
- чирак: encouraging without inflation. "You're moving, and that's what counts. Here's what to reach for next."
- калфа: specific recognition of the independent thinking you spotted.
- майстор: genuine acknowledgment of craft. Don't overdo it — a майстор earns this rarely.

---

## Verdicts (combine with the rating)

A check can still result in "not yet" even with a high-quality rating on completed work:

**Passed** — Everything's there. The work meets the bar.
- Update `.chirak/progress.json`: set `status: "passed"`, increment `attempts`, record timestamp, store `"rating": "<chirak|kalfa|maystor>"`.
- Suggest running `/chirak:next` to advance.

**Passed with notes** — Core is solid, some things to tighten.
- Mark as passed. Note what to improve, but don't block.
- Update `.chirak/progress.json` as passed with rating.

**Not yet** — Something fundamental is missing.
- Be specific about what's missing and why it matters.
- Be on their side: point at what to focus on, frame it as close.
- Update `.chirak/progress.json`: increment `attempts`, record which checks passed/failed. No rating stored until passed.

---

## Tracking

Update `.chirak/progress.json` after every check:
```json
{
  "lesson_id": "01-define",
  "status": "passed",
  "attempts": 2,
  "rating": "kalfa",
  "checks": {
    "file_check_0": "passed",
    "judgment_0": "passed"
  },
  "last_checked": "2024-01-15T10:30:00Z"
}
```

**Tone:** Direct and honest. The майстор doesn't inflate praise or soften failures — they tell you what's true. But they're genuinely on your side. Celebrate real work, flag real gaps.
