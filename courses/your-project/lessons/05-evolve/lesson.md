# Lesson 5 — Change Without Fear

You have a project. You have tests. You have CI. Now use all of it.

Make a real improvement to what you built, ship it through the full pipeline, and write down what you learned. That's the whole lesson.

---

## What You're Building

Claude will help you add a meaningful improvement to your project — a new feature, a significant enhancement, or better error handling. You'll ship it through CI and confirm it's live. Then you'll write an honest reflection on the project.

---

## Objectives

1. **Choose an improvement** — something that adds real value to what you defined in Lesson 1. A new feature, a significant improvement to an existing one, better error handling, a usability fix. Tell Claude what you want, and Claude will build it.

2. **Review the changes** — this is your project. Make sure the implementation matches your intent. Ask Claude to explain any choices you don't understand.

3. **Verify tests still pass** — after the change, run the test suite. Ask Claude to update or add tests as needed for the new behavior.

4. **Ship it** — push to GitHub. Watch CI pass. Confirm the change is live.

5. **Write a `LEARNINGS.md`** — ask Claude to help you reflect: what did you understand by the end of this project that you didn't at the start? What would you do differently? What surprised you? What does the project still need?

---

## What Success Looks Like

When you run `/chirak:check`, the майстор will check:

- Does the live/published version show the new feature?
- Does the test suite pass?
- Does `LEARNINGS.md` exist with genuine reflection?

The reflection should contain at least one thing that actually surprised you, one thing you understand now that you didn't before, and an honest answer to "what would you do differently." Not a task list — an account of what you learned.

---

## How to Start

Decide what to add, then tell Claude:

> "Add error handling to my CLI — if the user passes an invalid hex color, it should print a clear error message and exit with code 1. Add tests for the error cases."

Or:

> "I want to add a --batch flag to my CLI that reads from a file of hex colors and converts them all at once. Implement it and add tests."

After it's built and shipped:

> "Help me write LEARNINGS.md. Ask me questions to help me think through what I actually learned — I don't want it to be generic."

---

## Completing This Course

After this lesson, you've done the full development cycle on a project you chose yourself:

- Scoped and defined it
- Scaffolded and ran it locally
- Shipped it so others can access it
- Added automated confidence
- Made a safe change and shipped an update
- Reflected honestly on what you learned

That's the chirak rank. The same cycle — define, scaffold, ship, verify, evolve — is what experienced developers repeat on everything they build. You've done it once. Now do it again.

---

## When You're Ready

Run `/chirak:check`. Have your deployed URL or package link ready, and have LEARNINGS.md written.
