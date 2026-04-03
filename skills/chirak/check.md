---
name: check
description: Evaluate the learner's work against the current lesson objectives
---

Read `.chirak/progress.json` to find the current lesson. Read `course.yaml` to get the lesson's evaluation criteria.

For each evaluation criterion in the lesson:

**`type: command`** — Run the specified command in the shell. Report whether it succeeded and what output was relevant.

**`type: file_check`** — Check if the specified file(s) exist and read their contents. Evaluate whether the criteria is met.

**`type: judgment`** — This is your call. Read the relevant files, ask the learner any needed questions (e.g. "What's your deployed URL?"), then make a judgment against the stated criteria. Be honest — if it doesn't meet the bar, say so clearly and specifically.

After evaluating all criteria:

**If all pass:**
- Congratulate the learner genuinely. One specific thing you noticed about their work.
- Update `.chirak/progress.json`: set `status: "passed"` for the current lesson, increment `attempts`, record the timestamp.
- Suggest running `/next` to advance.

**If some fail:**
- Be specific about what's missing. Not "the file doesn't have the right content" — tell them exactly what section or criterion wasn't satisfied.
- Encouragement: they're close, here's what to focus on.
- Update `.chirak/progress.json`: increment `attempts`, record which checks passed/failed.
- Do NOT give them the solution. Point them at what to look at.

**Tracking:**
Update `.chirak/progress.json` after every check run. The structure for a lesson entry:
```json
{
  "lesson_id": "01-define",
  "status": "in_progress",
  "attempts": 2,
  "checks": {
    "file_check_0": "passed",
    "judgment_0": "failed"
  },
  "last_checked": "2024-01-15T10:30:00Z"
}
```

**Tone:** Direct and honest. The майстор doesn't inflate praise or soften failures — they tell you what's true. But they're on your side.
