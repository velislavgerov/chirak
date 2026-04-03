---
name: chirak:start
description: Start a Chirak course — pick a course, initialize progress, and show the first lesson brief
---

This is the entry point for new learners. No npm install needed.

## Step 1 — List available courses

Read the `courses/` directory (relative to where this plugin is installed). Each subdirectory with a `course.yaml` is a course. Read each `course.yaml` to get its `title`, `rank`, and `description`.

Display them as a numbered menu:

```
┌─── чирак ────────────────────────────────────┐
│  /start · Choose a Course                    │
└──────────────────────────────────────────────┘

  Available courses:

  1. Your First Ship  [чирак]
     Go from zero to a live personal page in 30 minutes.

  2. Ship Something You Need  [чирак]
     Same development cycle, but you choose what to build.

  Which course do you want to take? (type 1, 2, or the course name)
```

Use the actual course titles, ranks, and descriptions from the `course.yaml` files. Show all courses found in `courses/`.

## Step 2 — Learner picks a course

Wait for the learner to choose by number or name.

## Step 3 — Initialize progress

Create `.chirak/progress.json` in the **current project directory** (not the plugin directory). Structure:

```json
{
  "course_id": "<chosen-course-dir-name>",
  "course_title": "<title from course.yaml>",
  "current_lesson": "<first lesson id from course.yaml>",
  "started_at": "<ISO timestamp>",
  "lessons": {
    "<first-lesson-id>": {
      "status": "not_started",
      "attempts": 0,
      "hints_used": 0
    }
  }
}
```

Set `current_lesson` to the `id` of the first lesson in the `lessons` array.

If `.chirak/progress.json` already exists, warn the learner:

```
┌─── чирак ────────────────────────────────────┐
│  /start · Progress Found                     │
└──────────────────────────────────────────────┘
```

> "You already have progress saved for [course name], currently on [lesson title]. Starting over will reset all progress. Type `yes` to confirm, or anything else to cancel."

If they confirm, overwrite. Otherwise, abort and tell them to run `/chirak:brief` to continue.

## Step 4 — Show the first lesson brief

Immediately show the full brief for the first lesson — same output as `/chirak:brief` would produce. Read the lesson data from the chosen course's `course.yaml` and `courses/<course_id>/lessons/<lesson_id>/lesson.md` and render:

- The header box with lesson number and title
- What this lesson is about (one or two sentences from the description)
- "By the end of this, you'll have..." (concrete deliverable)
- Numbered objectives list
- Шевица divider
- Learning moments callout (if any)
- End with an open invitation: "What do you want to start with?" or "Where would you like to begin?"

---

**Tone:** The майстор welcoming a new apprentice. Warm and purposeful — this is the start of real work.
