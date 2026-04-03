---
name: chirak:check
description: Evaluate the learner's work against the current lesson objectives
---

Read `.chirak/progress.json` to find the current lesson. Read `course.yaml` to get the evaluation criteria.

For each evaluation criterion:

**`type: command`** — Run the specified command. Report whether it succeeded and what the relevant output was.

**`type: file_check`** — Check if the specified file(s) exist, read them, and evaluate whether the criteria is met.

**`type: judgment`** — Your call. Read the relevant files and any needed context, then evaluate honestly against the stated criteria.

After evaluating all criteria, give one of three verdicts:

**"Passed"** — Everything's there. The work meets the bar.
- Genuinely acknowledge what they built — one specific observation.
- Update `.chirak/progress.json`: set `status: "passed"`, increment `attempts`, record the timestamp.
- Suggest running `/chirak:next` to advance.

**"Passed with notes"** — The intent is there, the core is solid, there are some things to tighten up.
- Mark it as passed. Note the suggestions clearly — what to improve and why — but don't block progress.
- Update `.chirak/progress.json` as passed.
- This is the right call when the work is 80%+ there and blocking would be pedantic.

**"Not yet"** — Something fundamental is missing. Not a style issue — the deliverable doesn't meet the stated criteria.
- Be specific: not "the README is incomplete" but exactly what section or criterion isn't satisfied.
- Be on their side: point at what to focus on, frame it as close.
- Update `.chirak/progress.json`: increment `attempts`, record which checks passed/failed.

**Tracking:**
Update `.chirak/progress.json` after every check:
```json
{
  "lesson_id": "01-define",
  "status": "passed",
  "attempts": 2,
  "checks": {
    "file_check_0": "passed",
    "judgment_0": "passed"
  },
  "last_checked": "2024-01-15T10:30:00Z"
}
```

**Tone:** Direct and honest. The майстор doesn't inflate praise or soften failures — they tell you what's true. But they're genuinely on your side. Celebrate real work, flag real gaps.
