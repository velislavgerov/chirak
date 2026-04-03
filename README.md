# чирак / chirak

<img src="assets/chirak-logo.png" alt="Chirak logo — pixel art apprentice at a laptop with Bulgarian folk art border" width="400">

> *A set of Claude Code skills that turn Claude into a guided learning partner for developers.*

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

---

## What is this?

Chirak is a set of Claude Code skills and a course format that configures Claude to be a guided learning partner — the **майстор** (master craftsperson) guiding an apprentice through real work.

**There is no CLI to install.** No framework to run. No npm package. Just files that drop into your project and change how Claude behaves inside it.

Courses teach high-level development skills: how to define a project, scaffold it, ship it, verify it works, and evolve it safely. **Claude does the coding** — you learn the process, the decisions, and why things work the way they do.

The name comes from the Bulgarian craft guild tradition: **чирак** (chirak, apprentice) works under a **майстор** (maystor, master), progresses to **калфа** (kalfa, journeyman), and eventually earns the title of master through demonstrated skill — not time served.

---

## How It Works

```
┌─────────────────────────────────────────────────────────────────┐
│  Your Project                                                   │
│                                                                 │
│  CLAUDE.md ──────────────────── sets the майстор persona        │
│                                 tells Claude to guide, not solve│
│                                                                 │
│  .claude/skills/chirak/          custom slash commands          │
│    ├── brief.md  (/brief)        show lesson objectives         │
│    ├── check.md  (/check)        evaluate your work             │
│    ├── hint.md   (/hint)         tiered guidance                │
│    ├── next.md   (/next)         advance to next lesson         │
│    ├── status.md (/status)       show progress                  │
│    ├── dive.md   (/dive)         deep-dive on a concept         │
│    └── create-course.md          author a new course            │
│                                                                 │
│  courses/<course>/               the course you're taking       │
│    ├── course.yaml               lessons, objectives, evals     │
│    └── lessons/                                                 │
│        ├── 01-*/lesson.md                                       │
│        └── ...                                                  │
│                                                                 │
│  .chirak/progress.json           where you are, what you've tried│
└─────────────────────────────────────────────────────────────────┘
                              │
                              │  Claude Code reads all of this
                              ▼
                    ┌──────────────────┐
                    │   Claude Code    │
                    │   (the майстор)  │
                    └──────────────────┘
```

When you open Claude Code in a Chirak project, Claude reads `CLAUDE.md`, `course.yaml`, and `progress.json`. It knows what lesson you're on, what the objectives are, and how to guide you without solving it for you.

---

## Quick Start

### Option 1 — Demo course (pre-defined project)

Deploy a personal page in ~30 minutes. The project is pre-defined: you're building a personal page. You define the details — what it looks like, what it says, which tech stack.

```bash
# Create a new project directory
mkdir my-page && cd my-page

# Install the demo course
bash <(curl -s https://raw.githubusercontent.com/velislavgerov/chirak/main/scripts/init.sh) demo

# Open Claude Code and start
claude
# then type:
/brief
```

### Option 2 — Your own project

Start with a conversation. You decide what to build. Claude helps you scope it. The rest of the course adapts to whatever you chose.

```bash
mkdir my-project && cd my-project
bash <(curl -s https://raw.githubusercontent.com/velislavgerov/chirak/main/scripts/init.sh) your-project
claude
# then type:
/brief
```

### Or locally from this repo

```bash
# Clone the repo
git clone https://github.com/velislavgerov/chirak.git

# Install into a new project
./chirak/scripts/init.sh demo ./my-page
cd my-page && claude
```

---

## The Skills

Once installed, these slash commands are available inside Claude Code:

| Command | What it does |
|---------|-------------|
| `/brief` | Show the current lesson's objectives and what success looks like |
| `/check` | Evaluate your work against the lesson criteria |
| `/hint` | Conceptual nudge — type `/hint more` for direction, `/hint show` for a scaffold |
| `/next` | Advance to the next lesson (only after passing `/check`) |
| `/status` | Show overall progress, lessons completed, hints used |
| `/dive [concept]` | Deep-dive on a concept, or list available learning moments and references |
| `/create-course` | Interactive guide for writing a new Chirak course |

---

## The Courses

### `demo` — Your First Ship

**Rank: чирак / chirak**

Go from zero to a live personal page. The project is pre-defined — a personal page — but you choose the details: what to put on it, which tech stack, how to deploy it.

Five lessons:
1. **What Are We Building?** — Define the project in writing before touching code
2. **Get It Running** — Scaffold the project and confirm the dev loop works
3. **Ship It** — Push to GitHub, deploy to a live URL
4. **Trust But Verify** — Add a test suite and CI
5. **Change Without Fear** — Add a feature, run tests, ship the update, reflect

### `your-project` — Ship Something You Need

**Rank: чирак / chirak**

Same development cycle, but you choose what to build. Lesson 1 is a scoping conversation — Claude helps you find a project that's achievable, real, and worth building. The rest of the lessons adapt to whatever you chose: web app, CLI, API, library, script.

Five lessons:
1. **What Are You Going to Build?** — Scoping conversation + README
2. **Get It Running** — Scaffold for your specific project type
3. **Ship It** — Deploy or publish, in whatever form fits your project
4. **Trust But Verify** — Tests and CI adapted to your stack
5. **Change Without Fear** — Improve it, ship it, reflect

---

## The Progression System

Rank is earned through demonstrated work, not time served.

| Bulgarian | Pronunciation | Meaning | What it means here |
|-----------|--------------|---------|-------------------|
| **чирак** | chirak | apprentice | Foundational courses. You're learning the craft. |
| **калфа** | kalfa | journeyman | Intermediate courses. You can work independently. |
| **майстор** | maystor | master | Advanced courses. You can teach others. |

Completing чирак-rank courses unlocks калфа-rank courses (coming soon).

---

## Writing a Course

The `/create-course` skill lets you author a new course interactively inside Claude Code. Claude guides you through defining lessons, writing objectives, specifying evaluation criteria, and adding learning moments and references.

See [docs/authoring.md](docs/authoring.md) for the full guide.

---

## Repository Structure

```
chirak/
├── skills/                    # The Claude Code skills — this IS the product
│   └── chirak/
│       ├── brief.md           # /brief
│       ├── check.md           # /check
│       ├── hint.md            # /hint
│       ├── next.md            # /next
│       ├── status.md          # /status
│       ├── dive.md            # /dive
│       └── create-course.md   # /create-course
├── courses/
│   ├── demo/                  # "Your First Ship" — deploy a personal page
│   └── your-project/          # "Ship Something You Need" — open-ended
├── templates/
│   └── CLAUDE.md              # The майстор persona — copied into learner's project
├── scripts/
│   └── init.sh                # Installs skills + CLAUDE.md into a project
├── docs/
│   ├── architecture.md        # How it all fits together
│   └── authoring.md           # How to write a Chirak course
└── assets/
    └── chirak-logo.png
```

---

## Contributing

### Writing Courses

The highest-leverage contribution is authoring courses. A good Chirak course:

- Teaches by doing — every lesson ends with something built
- Has evaluation criteria that verify real understanding, not just task completion
- Reads like a craftsperson explaining their art, not like documentation
- Respects the learner's intelligence — give context, not hand-holding

Use `/create-course` to get started, or see [docs/authoring.md](docs/authoring.md).

### Improving the Skills

The skills (`.md` files in `skills/chirak/`) are instructions to Claude. Improving them means better guidance, better evaluation, better hints. Open a PR with your proposed changes and explain what behavior it improves.

---

## License

MIT — see [LICENSE](LICENSE).

---

```
майстор казва: "Покажи, не разказвай."
maystor says: "Show, don't tell."
```
