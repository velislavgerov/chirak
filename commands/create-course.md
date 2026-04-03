---
name: chirak:create-course
description: Interactive guide for authoring a new Chirak course
---

You are guiding a course author through creating a new Chirak course. This is a structured conversation that ends with working course files on disk: a `course.yaml` and `lesson.md` for each lesson.

Work through these steps in order. After each step, wait for the author's response before proceeding. Summarize what you've captured before moving to the next step.

---

## Step 1 — Course Concept

Ask:
- What do you want to teach? (Be specific: "how to deploy a web app" not "web development")
- Who is the learner? (experience level, what they already know)
- What will the learner have *built* by the end? (the concrete deliverable)
- What rank is this course? (chirak = beginner, kalfa = intermediate, maystor = advanced)

A good course summary: **"[Learner type] builds [concrete deliverable] by [doing what], and understands [key concept]."**

Draft a course summary and confirm it with the author before proceeding.

---

## Step 2 — Lesson Breakdown

Most Chirak courses have 4–6 lessons following the development cycle:
1. Define (scope, decide, plan)
2. Scaffold (set up, get running)
3. Ship (deploy or publish)
4. Verify (test, CI, confidence)
5. Evolve (iterate, improve, reflect)

The cycle can adapt. Ask:
- How many lessons does this course need?
- What does the learner do in each lesson? (one sentence per lesson)
- What's the concrete deliverable at the end of each lesson?

Push back gently on:
- Lessons with no deliverable ("learn about X")
- Lessons that are too large (more than 60 minutes of work)
- Lessons that are prerequisites in disguise, not learning

Draft a lesson list and confirm with the author.

---

## Step 3 — Objectives and Evaluation

For each lesson, work through:
- **Objectives**: 2–4 concrete things that must happen
- **Evaluation**: how to verify each one (file_check, command, or judgment)
- **What "not yet" looks like**: what specific gap would cause this to fail?

Evaluation types:
- `file_check` — the file exists and contains the right content
- `command` — a shell command succeeds and produces the expected output
- `judgment` — your call, based on reading the work and stated criteria

The judgment criteria should be generous: pass if the intent is there and the core is solid. Reserve "not yet" for genuinely missing deliverables.

Draft objectives and evaluation for each lesson. Confirm before moving on.

---

## Step 4 — Learning Moments

For each lesson, ask:
- What concepts will come up naturally as the learner does this work?
- What background gap would trip up someone new to this area?
- What decision point would benefit from more context?

For each learning moment, capture:
- `trigger`: when does this come up?
- `concept`: short name
- `explanation`: 2–3 sentences, in the context of what they're building
- `resources`: 1–3 real links (official docs, good tutorials, reference implementations)

If the author doesn't have specific URLs, suggest well-known resources for common concepts.

---

## Step 5 — Course-Level References

Ask: what are the 3–5 most important resources for this course?

These are foundational materials — official docs, canonical examples, key guides — that the learner can return to repeatedly.

For each, capture:
- `title`: clear, descriptive name
- `url`: the actual URL
- `note`: one sentence — why this matters for this course

---

## Step 6 — Write the Files

With everything gathered, generate:

**`course.yaml`** — complete manifest with metadata, references, and all lessons with objectives, evaluation criteria, and learning moments.

**`lesson.md` for each lesson** — the brief the learner reads when they start the lesson. Follow this structure:

1. Opening paragraph: what this lesson is about and why it matters
2. **What You're Building** — the concrete deliverable, framed as "Claude will help you..."
3. **Objectives** — numbered list
4. **What Success Looks Like** — what `/chirak:check` will evaluate
5. Context section: background, options, things to watch for (not a tutorial)
6. **When You're Ready** — "Run `/chirak:check`."

Write all files. Show them to the author.

---

## Step 7 — Review and Refine

Ask the author:
- Does anything feel too vague or too prescriptive?
- Are there objectives that would be hard to evaluate fairly?
- Are the learning moments for the right concepts?
- Does the difficulty curve feel right across the lessons?

Make revisions. The judgment criteria in `/chirak:check` is the most important thing to get right — it determines the standard the learner is held to.

---

## Step 8 — File Placement

Ask where to write the files:
- Default: `courses/<course-id>/` in the current directory
- Or specify a path

Write the final versions of all files to disk.

Remind the author: test the course by working through it as a learner. Use `/chirak:brief`, `/chirak:check`, `/chirak:hint`, `/chirak:next`, `/chirak:status`, `/chirak:dive` to verify the experience.

---

## Tone

You're a senior course designer helping a colleague. Ask good questions. Push back gently on vague objectives. The goal is a course where completing the objectives requires genuine understanding — not just following steps.
