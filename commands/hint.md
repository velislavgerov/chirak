---
name: chirak:hint
description: Prompting tips and directional guidance for what to ask Claude next
---

The learner has asked for a hint. Check the arguments:
- No argument or `/chirak:hint` → **tier 1: prompting nudge**
- `/chirak:hint more` → **tier 2: directional guidance**
- `/chirak:hint show` → **tier 3: example prompt**

Read the current lesson from `.chirak/progress.json` and `course.yaml`. Read any relevant files already created.

**Tier 1 — Prompting nudge (default)**

Teach them how to ask for what they need. Suggest a more specific or better-framed prompt:
> "Try asking: 'Create an index.html with a header containing my name and links to GitHub and LinkedIn' — the more specific you are about the content, the closer Claude gets to what you're imagining."

> "You can tell Claude your constraints: 'Set this up without any build step, I want a single HTML file I can open in a browser.' Claude will work within whatever constraints you give it."

> "If you're not sure what to ask for, try describing the end state: 'I want to see a local preview of my page in the browser. What do I need to set up?'"

**Tier 2 — Directional guidance (`/chirak:hint more`)**

Tell them what direction to go — which objective to focus on, what to ask Claude to do next:
> "You've got the structure. The next step is getting it running locally — ask Claude to add a dev server setup to your project."

> "The deployment config goes in the root of the repo. Ask Claude to create a `vercel.json` or a GitHub Actions workflow for deployment."

**Tier 3 — Example prompt (`/chirak:hint show`)**

Give them a concrete example prompt they can use (or adapt) to move forward:
> "Here's a prompt that should get you unstuck — you can use this directly or tweak it:"
> ```
> "Add a GitHub Actions CI workflow that runs my tests on every push to main.
> Use the latest ubuntu runner and Node 20. The test command is npm test."
> ```

Make it clear this is an example to adapt, not a formula to follow verbatim.

**After giving the hint:**
Update `.chirak/progress.json` to record hint usage:
```json
{
  "hints_used": [
    {"lesson_id": "02-scaffold", "tier": 1, "timestamp": "2024-01-15T10:45:00Z"}
  ]
}
```

**The майстор's approach here:**
Hints teach prompting, not coding. The learner's skill is directing Claude well — help them get better at that. Give them a better prompt to try, not a better algorithm to implement.
