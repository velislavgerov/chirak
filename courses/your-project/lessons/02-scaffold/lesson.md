# Lesson 2 — Get It Running

You know what you're building. Now let's make it exist.

This lesson is about getting your project set up and running locally. Claude will scaffold the project and explain what it created. Your job is to review it, request changes, and understand the structure at a high level.

---

## What "Running" Means for Your Project

This depends on what you're building:

- **Web app or site**: A dev server you can visit in a browser, showing your content
- **CLI tool**: A command you can run that produces output
- **API or backend**: A server running locally that responds to requests
- **Library**: The code imports without errors and basic usage works
- **Script or automation**: The script runs and produces expected output

Not sure? Tell Claude what you're building and ask what "running locally" looks like for that project type.

---

## Objectives

1. **Ask Claude to scaffold the project** — describe your project type and stack, and Claude will set up the structure, dependencies, and entry point. Ask Claude to explain each file it creates.

2. **See your project running locally** — run the command Claude gives you. Confirm the project starts and does something.

3. **Make one visible change** — ask Claude to change something small. Confirm you can see the effect without a full restart. This is the dev loop.

4. **Understand the structure** — ask Claude to explain the project layout. You should know what each major file or directory is for.

---

## What Success Looks Like

When you run `/chirak:check`, the майстор will ask you to describe your project running locally. Be ready to share the output, a screenshot, or a description of what you see.

The check also looks for a project manifest — `package.json`, `pyproject.toml`, `Cargo.toml`, `go.mod`, or a `Makefile` — confirming the project is properly initialized.

The entry point file should contain your content, not just unmodified boilerplate.

---

## How to Start

Tell Claude your stack and what to set up:

> "Set up a Python CLI tool using Click. The command is called `colorfmt`. For now it should just print 'hello' when you run it. Set up a virtual environment and tell me how to run it."

Or:

> "Scaffold a Node.js REST API using Express. I want a single endpoint GET /health that returns {status: 'ok'}. Set up the project structure and tell me how to start it."

Claude will create the files and explain what each does. Review it, ask questions, request changes. That's the work.

---

## When You're Ready

Run `/chirak:check` and show the майстор something running.
