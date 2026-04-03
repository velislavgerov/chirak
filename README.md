# чирак / chirak

<!-- Logo: pixel art, Bulgarian folk art border, pixel apprentice at a laptop -->
<!-- assets/chirak-logo.png — drop it here once exported -->

> *An open-source framework that turns Claude Code into a guided, objective-driven learning environment for developers.*

```
╔══════════════════════════════════════════════╗
║   ч и р а к   —   the apprentice framework  ║
║                                              ║
║   чирак  →  калфа  →  майстор               ║
║   chirak →  kalfa  →  maystor               ║
║  apprentice → journeyman → master           ║
╚══════════════════════════════════════════════╝
```

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![pnpm](https://img.shields.io/badge/maintained%20with-pnpm-cc00ff.svg)](https://pnpm.io/)

---

## What is this?

Chirak is a course framework built on top of Claude Code. Instead of watching videos or reading docs and hoping you understood them, you work directly in your editor with an AI pair — and your progress is verified by **evals**, not self-assessment.

You complete objectives. The framework checks them. You advance.

The name comes from the Bulgarian craft guild tradition: **чирак** (chirak, apprentice) works under a **майстор** (maystor, master), progresses to **калфа** (kalfa, journeyman), and eventually earns the title of master through demonstrated skill — not time served.

---

## The Concept

Most developer education has an honesty problem: you can finish a course without understanding anything, because nothing checks your actual work.

Chirak fixes this with eval-verified objectives:

- Each lesson defines **concrete objectives** — things you must actually build, fix, or explain.
- A **harness** (currently Claude Code) runs alongside you as a guide and collaborator.
- When you're ready, you run `chirak check` — the eval suite verifies your work objectively.
- Pass the evals, advance to the next lesson. That's it.

No fill-in-the-blank exercises. No multiple choice. Real code, real evals, real progression.

---

## How It Works

```
1. npx chirak init <course>
   └── Downloads course, sets up workspace, injects harness config

2. chirak start
   └── Opens your first lesson, brief reads in, objectives appear

3. You work — with Claude Code as your apprentice master
   └── Ask questions, get hints, explore the codebase, write code

4. chirak check
   └── Eval suite runs against your work
   └── Pass → lesson complete, next unlocks
   └── Fail → specific feedback, try again

5. Complete all lessons → earn your rank badge
```

The harness (Claude Code adapter) injects context via `CLAUDE.md`, custom slash commands, and hooks — so your AI assistant always knows which lesson you're on, what the objectives are, and how to guide you without just doing it for you.

---

## The Progression System

Chirak borrows its rank structure from Bulgarian craft guilds, where rank was earned through demonstrated mastery — not seniority.

| Rank | Bulgarian | Meaning | What it means here |
|------|-----------|---------|-------------------|
| **Apprentice** | чирак / chirak | A beginner who is learning under a master | Foundational courses. You're learning the craft. |
| **Journeyman** | калфа / kalfa | A skilled worker, no longer a student | Intermediate courses. You can work independently. |
| **Master** | майстор / maystor | A fully qualified craftsperson | Advanced courses. You can teach others. |

Courses are tagged with a required rank. Completing chirak-rank courses unlocks kalfa-rank courses. Each rank has its own visual identity (badges incoming).

---

## Architecture

Chirak is designed as a layered system with a harness-agnostic core:

```
┌─────────────────────────────────────────────────┐
│               Course Authoring                  │
│         (Markdown + YAML + eval specs)          │
├─────────────────────────────────────────────────┤
│              @chirak/core                       │
│   Course loading · eval execution · progress   │
│              tracking · state management        │
├─────────────────────────────────────────────────┤
│         chirak (CLI)   │   future: desktop app  │
│    init·start·check    │   (Tauri, Phase 2)     │
├─────────────────────────────────────────────────┤
│           Harness Adapters                      │
│  @chirak/harness-claude  │  future: others      │
│  CLAUDE.md · skills ·    │  (Cursor, Windsurf,  │
│  hooks · slash commands  │   etc.)              │
└─────────────────────────────────────────────────┘
```

**Key design decisions:**

- **`@chirak/core`** has no knowledge of Claude Code — it's a pure library for course mechanics.
- **Harness adapters** translate core concepts into the target AI environment's native primitives.
- **Courses** are plain files — Markdown lessons, YAML manifests, TypeScript/shell eval scripts. No magic.
- The CLI is the primary interface for Phase 1. A desktop app (Phase 2) will wrap it.

---

## Course Format

Courses live in the `courses/` directory of any project (or published as npm packages). A minimal course looks like this:

```
my-course/
├── course.yaml          # Manifest: title, rank, lessons
├── lessons/
│   ├── 01-hello/
│   │   ├── lesson.md    # The lesson brief — what to learn, what to build
│   │   ├── eval.ts      # Eval script — verifies objectives programmatically
│   │   └── starter/     # (optional) starter files for the student
│   └── 02-next/
│       └── ...
└── package.json         # @chirak-courses/my-course
```

**`course.yaml`** declares lessons and metadata:

```yaml
title: My Course
rank: chirak
description: Learn X by building Y

lessons:
  - id: 01-hello
    title: Hello, World
    description: Your first objective
    objectives:
      - Write a function that returns "hello"
      - The function must be tested
```

**`eval.ts`** runs programmatic checks:

```typescript
import { defineEval } from "@chirak/core";

export default defineEval({
  async check(ctx) {
    // ctx gives you: file system access, test runner, shell exec
    const result = await ctx.runTests("src/hello.test.ts");
    return result.passed;
  },
});
```

**`lesson.md`** is what the student reads — and what the harness injects into Claude Code's context. Write it like a craftsperson explaining a technique, not like a textbook.

---

## Quick Start

```bash
# Start a course (installs into current directory)
npx chirak init first-steps

# Open your current lesson
chirak start

# Check your work against the eval suite
chirak check

# See your progress
chirak status

# Advance to the next lesson (after passing evals)
chirak next
```

---

## Packages

| Package | Name | Description |
|---------|------|-------------|
| `packages/core` | `@chirak/core` | Course loading, eval execution, progress tracking |
| `packages/cli` | `chirak` | Terminal commands: `init`, `start`, `check`, `next`, `status` |
| `packages/harness-claude` | `@chirak/harness-claude` | Claude Code adapter: `CLAUDE.md`, skills, hooks |

---

## Roadmap

### Phase 1 — Core + CLI
- [ ] `@chirak/core`: course manifest parsing, lesson state machine, eval runner
- [ ] `chirak` CLI: `init`, `start`, `check`, `next`, `status`
- [ ] `@chirak/harness-claude`: CLAUDE.md injection, slash commands, hook integration
- [ ] `first-steps` course: end-to-end example
- [ ] Course authoring guide

### Phase 2 — Desktop App
- [ ] Tauri-based desktop app wrapping the CLI
- [ ] Visual progress tracker with rank badges
- [ ] Course marketplace / registry
- [ ] Per-lesson hint system with configurable reveal levels

### Phase 3 — Ecosystem
- [ ] More harness adapters (Cursor, Windsurf, Zed)
- [ ] Course authoring SDK with eval helpers
- [ ] Public course registry
- [ ] Community rank verification (peer review for maystor rank)
- [ ] API for integrating chirak into coding bootcamps / workshops

---

## Contributing

### Writing Courses

The highest-leverage contribution right now is authoring courses. A good chirak course:

- Teaches by doing — every lesson ends with something built
- Has evals that actually verify the objective, not just "did the file change"
- Reads like a craftsperson explaining their art, not like documentation
- Respects the student's intelligence — give context, not hand-holding

See `courses/first-steps/` for a reference example.

### Contributing Code

Standard GitHub flow: fork, branch, PR. Run `pnpm test` before submitting.

The project is in early scaffolding — see the [roadmap](#roadmap) for where help is most needed.

---

## License

MIT — see [LICENSE](LICENSE).

---

```
майстор казва: "Покажи, не разказвай."
maystor says: "Show, don't tell."
```