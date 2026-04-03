# Writing a Chirak Course

A Chirak course teaches developers by having them build something real. Every lesson ends with something that exists — code, a running project, a shipped feature — and the objectives are verified, not self-assessed.

This guide explains how to write one.

---

## Course Structure

```
courses/<course-id>/
├── course.yaml          # manifest: lessons, evals, learning moments, references
└── lessons/
    ├── 01-<name>/
    │   └── lesson.md    # the brief the learner reads
    ├── 02-<name>/
    │   └── lesson.md
    └── ...
```

Use the init script to bootstrap the structure:

```bash
# coming soon: ./scripts/new-course.sh my-course
```

Or use `/create-course` inside Claude Code to have the майстор guide you through authoring interactively.

---

## course.yaml

The manifest has three top-level sections: metadata, references, and lessons.

```yaml
title: "Your Course Title"
rank: chirak              # chirak | kalfa | maystor
description: |
  What the learner builds and what they learn.
  Keep this to 2-3 sentences.
author: Your Name
version: "0.1.0"

# Top-level references: foundational material for the whole course
references:
  - title: "Official docs title"
    url: "https://..."
    note: "Why this is worth reading"

lessons:
  - id: 01-first-lesson
    title: "Lesson Title"
    description: "One sentence: what they do in this lesson"
    objectives:
      - "Concrete thing they must produce"
      - "Another concrete thing"
    evaluation:
      - type: file_check
        path: README.md
        criteria: "What you're looking for in the file"
      - type: command
        run: "npm test"
        criteria: "What passing looks like"
      - type: judgment
        criteria: "What Claude should evaluate and how"
    learning_moments:
      - trigger: "when [specific situation arises]"
        concept: "Short concept name"
        depth: brief
        explanation: "1-3 sentence explanation in context"
        resources:
          - title: "Resource title"
            url: "https://..."
```

### Evaluation types

**`file_check`** — Claude reads the file and evaluates against `criteria`. The `path` can use `OR` for alternatives (`package.json OR pyproject.toml`). The criteria is a judgment call Claude makes about the content.

**`command`** — Claude runs the command and evaluates output against `criteria`. Write commands that are self-contained and don't require interactive input.

**`judgment`** — A pure judgment call. Claude reads relevant files, may ask the learner a question (like "what's your deployed URL?"), and evaluates against the criteria. Use this for things that can't be mechanically checked.

### Learning moments

Learning moments are concepts that naturally arise during the work of a lesson. They're not mandatory deep-dives — they're invitations.

Define them with a `trigger` (when does this concept come up?), `concept` (short name), `explanation` (brief, in-context), and optional `resources`.

Claude watches for these moments during conversation and invites the learner to `/dive` when the topic arises naturally.

---

## lesson.md

The lesson brief is what the learner reads. Write it like a craftsperson explaining a technique to an apprentice — not like a textbook.

Structure:

1. **Opening** — one paragraph: what this lesson is about and why it matters
2. **What You're Building** — concrete description of the deliverable
3. **Objectives** — numbered list, matching the objectives in `course.yaml` (same wording is fine)
4. **What Success Looks Like** — how they'll know they're done; connects to evaluation criteria
5. **Context** — relevant background, options, things to watch for. Not a tutorial — pointers.
6. **When You're Ready** — one line: "Run `/check`."

Keep it under 500 words. The learner should be able to read it in 2 minutes and start working.

---

## Writing Good Objectives

Good objectives are:

- **Concrete** — "Create a README.md with a problem statement and feature list", not "understand the project"
- **Verifiable** — Claude should be able to check whether it's done
- **Achievable** — completable in the time the lesson is scoped for
- **Educational** — the act of completing them teaches something

Avoid objectives that are really prerequisites ("have Node.js installed"). If setup is required, put it in the lesson brief, not the objectives.

---

## Writing Good Evaluation Criteria

For `file_check` and `judgment` criteria, be specific about what you're looking for:

```yaml
# Too vague:
criteria: "README exists"

# Good:
criteria: "README contains a problem statement section, a feature list with 3+ items, and a tech stack with written rationale"
```

For `judgment` evaluations, tell Claude what to look for and what should cause a failure:

```yaml
criteria: |
  Evaluate the learner's README.
  Pass if: problem statement is specific (names the user and their problem), features are buildable, tech stack rationale shows understanding of tradeoffs.
  Fail if: scope is too large, problem is vague ("a better app"), or rationale is missing.
```

---

## Principles for Good Courses

**Teach by doing.** Every lesson ends with something real. No "research and take notes" lessons.

**Verify outcomes, not process.** Don't check "did you follow these steps" — check "does this work and do you understand why?"

**Scope aggressively.** A learner should be able to complete each lesson in 30-60 minutes. If it's taking longer, the lesson is too big.

**Respect the learner's intelligence.** Give context and direction, not hand-holding. Trust that they can figure it out with good objectives and a good brief.

**Write learning moments for the things that trip people up.** Not comprehensive concept coverage — just the moments where a learner without background in that area will get confused or make a bad decision.

---

## Testing Your Course

Before publishing:

1. Run the init script on a fresh directory
2. Work through the course as a learner, using only `/brief`, `/check`, `/hint`, `/next`, `/status`, `/dive`
3. Check that `/check` correctly identifies passing and failing states
4. Check that `/hint` gives useful guidance without giving away the answers

The best courses are ones where the майстор's judgment calls in evaluations are consistent with what a reasonable senior developer would expect.
