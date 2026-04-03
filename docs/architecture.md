# Chirak Architecture

Chirak is a set of Claude Code skills and a course format that configures Claude to be a learning partner.

There is no CLI to install. No framework to run. No harness process to manage. Just files that drop into a project and change how Claude behaves inside it.

---

## How It Works

```
┌─────────────────────────────────────────────────────────────────┐
│  Learner's Project                                              │
│                                                                 │
│  CLAUDE.md ──────────────────── sets the майстор persona        │
│                                 tells Claude to read the course │
│                                 defines the guidance rules      │
│                                                                 │
│  .claude/skills/chirak/          custom slash commands          │
│    ├── brief.md  (/brief)        show lesson objectives         │
│    ├── check.md  (/check)        evaluate learner's work        │
│    ├── hint.md   (/hint)         tiered guidance                │
│    ├── next.md   (/next)         advance to next lesson         │
│    ├── status.md (/status)       show progress                  │
│    └── dive.md   (/dive)         deep-dive on a concept         │
│                                                                 │
│  courses/<course>/               course content                 │
│    ├── course.yaml               manifest: lessons, evals, etc. │
│    └── lessons/                                                 │
│        ├── 01-*/lesson.md        lesson brief + objectives      │
│        └── ...                                                  │
│                                                                 │
│  .chirak/progress.json           learner state (ephemeral)      │
└─────────────────────────────────────────────────────────────────┘
                              │
                              │  Claude Code reads all of this
                              │  and becomes the майстор
                              ▼
                    ┌──────────────────┐
                    │   Claude Code    │
                    │   (the майстор)  │
                    └──────────────────┘
```

---

## The Three Files That Matter

**`CLAUDE.md`** — The persona file. Claude Code reads this at the start of every session. It sets Claude's role as the майстор (master craftsperson), defines the rules (never write lesson solutions, watch for learning moments, hold a high standard), and tells Claude where to find the course and progress state.

**`course.yaml`** — The course manifest. Defines the lessons, their objectives, evaluation criteria, and learning moments. Claude reads this to know what the current lesson requires and how to evaluate the learner's work.

**`.chirak/progress.json`** — The learner's state. Tracks the current lesson, attempts, hints used, and pass/fail status. Updated by `/check` and `/next`. Claude reads this to know where the learner is.

---

## The Skills

Claude Code supports custom slash commands defined as Markdown files in `.claude/skills/`. Each Chirak skill is one of these files.

When the learner types `/check`, Claude reads `.claude/skills/chirak/check.md`, which contains instructions telling Claude *how* to perform the check: what to read, how to evaluate each criterion type, what to update in `progress.json`, and how to communicate the result.

The skills are instructions *to Claude*, not code. Claude interprets and executes them using its judgment. This is what makes the system flexible: a `type: judgment` evaluation in `course.yaml` is genuinely evaluated by Claude, not reduced to a string match.

---

## The Course Format

A course is a directory with this structure:

```
courses/<course-id>/
├── course.yaml
└── lessons/
    ├── <lesson-id>/
    │   └── lesson.md
    └── ...
```

`course.yaml` has three key sections per lesson:

- **`objectives`** — what the learner must accomplish (human-readable)
- **`evaluation`** — how to verify they've done it (three types: `command`, `file_check`, `judgment`)
- **`learning_moments`** — concepts that naturally arise during the work, with explanations and resources

The evaluation types:

| Type | What it does |
|------|-------------|
| `command` | Claude runs the command and evaluates the output |
| `file_check` | Claude reads the file(s) and evaluates against criteria |
| `judgment` | Claude makes an honest evaluation based on specified criteria |

---

## What Claude Does

Claude Code, configured with Chirak's CLAUDE.md and skills, behaves as a guided learning partner:

1. **Knows the course structure** — reads `course.yaml` and knows what's in each lesson
2. **Knows the learner's state** — reads `progress.json` and knows where they are
3. **Evaluates work honestly** — runs checks and makes judgment calls per lesson criteria
4. **Guides without solving** — the CLAUDE.md rules prevent Claude from writing solutions to lesson objectives
5. **Surfaces learning** — watches for learning moments and invites deep-dives at the right time

---

## What Chirak Is Not

- Not a wrapper around Claude Code — it doesn't run alongside it
- Not a separate process — there's no server or daemon
- Not an npm package you install — it's files you copy into a project
- Not an LMS — there's no user accounts, no hosted platform, no dashboard

It's a configuration layer that turns Claude Code into a subject-matter expert teaching assistant for whatever course the project contains.

---

## Adding a Course

See [authoring.md](authoring.md) for how to write a Chirak course.

The short version: create a `courses/<your-course>/` directory with `course.yaml` and lesson files. The init script copies the skills and CLAUDE.md into any project. The course files can live in the project or in a separate repo.
