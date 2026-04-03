# Lesson 2 — Get It Running

You know what you're building. Now make it exist.

By the end of this lesson, your project will be running on your machine. You'll have a working development environment — whatever that means for your project type. And you'll have confirmed the most important thing: the feedback loop works.

---

## What "Running" Means

This depends on what you're building:

- **Web app or site**: A dev server you can visit in a browser, showing your content
- **CLI tool**: A command you can run that does something (even if basic)
- **API or backend**: A server running locally that responds to requests
- **Library**: The code imports without errors and basic usage works
- **Script or automation**: The script runs and produces the expected output

If you're not sure what "running" looks like for your project, that's the first thing to figure out. Ask the майстор.

---

## Objectives

1. **Initialize the project with your chosen stack**
   - Set up the structure your project needs
   - Install dependencies
   - Get it into a state where it can run

2. **See your project running locally**
   - Whatever "running" means for your project type
   - If it's a web app: it's in a browser
   - If it's a CLI: it outputs something
   - If it's a library: a usage example works

3. **Make one visible change to confirm the dev loop**
   - Modify something
   - Observe the effect without a full restart (ideally)
   - Confirm you can iterate quickly

---

## What Success Looks Like

When you run `/check`, the майстор will ask you to show your project running. Be ready to describe what you see or paste relevant output.

The check also looks for a project manifest — `package.json`, `pyproject.toml`, `Cargo.toml`, `go.mod`, or a `Makefile`. This confirms the project is properly initialized, not just a loose collection of files.

---

## The Setup Tax

Every project has a setup tax: the work required before you can do the real work. Some stacks have a high tax (complex configuration, many dependencies), some have a low tax.

If your setup is taking much longer than expected, that's signal. It might mean:
- You need a specific tool you don't have yet — ask for help, it's solvable
- The stack has a steeper learning curve than anticipated — worth knowing now
- You chose a stack that's more complex than your project needs — worth reconsidering

Don't push through frustrating setup without understanding why it's frustrating.

---

## When You're Ready

Run `/check`. Show the майстор something running.
