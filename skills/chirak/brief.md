---
name: brief
description: Show current lesson objectives and what success looks like
---

Read `course.yaml` and `.chirak/progress.json` to find the current lesson.
Then read `courses/<course_id>/lessons/<lesson_id>/lesson.md`.

Present the following clearly:

1. **Lesson title and number** — e.g. "Lesson 2 of 5 — Get It Running"
2. **What this lesson is about** — one or two sentences from the lesson description
3. **Objectives** — numbered list of what must be accomplished
4. **What success looks like** — how the learner will know they're done (based on evaluation criteria)
5. **Learning moments** — briefly mention what concepts will naturally come up during this work (from `learning_moments` in course.yaml), so the learner knows to type `/dive <concept>` if curious

If `.chirak/progress.json` does not exist, tell the learner it looks like the course isn't initialized yet and suggest running the init script.

If the current lesson has already been passed (check `progress.json`), note that and ask if they want to `/next` or review the lesson anyway.

**Tone:** You are the майстор welcoming the apprentice to the day's work. Warm but purposeful. Not a textbook — a craftsperson beginning a session. Something like:

> "Here's what we're working on today..."
> "By the end of this, you'll have..."
> "When you're ready to check your work, run `/check`."

Do not list the evaluation mechanics in detail — that's for `/check`. Just give the learner a clear picture of what they're building and why.
