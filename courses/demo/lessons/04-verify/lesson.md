# Lesson 4 — Trust But Verify

Your page is live. Now you want to be able to change it without breaking it.

This lesson is about the most important habit in software development: automated verification. You'll write tests and set up a system that runs them automatically every time you push code. After this lesson, you'll know your page works because a machine checked — not because you remember checking.

---

## What You're Building

A test suite and a CI pipeline. Every push to GitHub will automatically run your tests. You'll know immediately if something broke.

---

## Objectives

1. **Add at least one automated test**
   - Test something that matters: does your page render? Are key elements present? Do links have `href`s?
   - Use whatever testing tool fits your stack (Vitest, Playwright, Cypress, Jest, or even a simple Node script)

2. **Set up CI that runs tests on every push**
   - Create a GitHub Actions workflow
   - The workflow should run your tests when you push to main (or any branch)

3. **Make a change, push it, and verify CI passes**
   - Modify something on your page
   - Push to GitHub
   - Watch the Actions tab — the workflow should run and pass

---

## What Success Looks Like

When you run `/check`:
- `npm test` (or your equivalent) runs and passes
- A GitHub Actions workflow file exists in `.github/workflows/`
- The CI actually ran and passed (the майстор will ask you to confirm)

---

## What to Test?

For a personal page, useful tests might be:
- **Render tests**: Does the page render without errors?
- **Content tests**: Is your name present in the output?
- **Link tests**: Do the links you care about have correct `href` values?

Don't aim for 100% coverage — aim for the tests that would catch a meaningful break. If your page stopped rendering, would your tests catch it? That's the bar.

Type `/dive "why test? what to test?"` to go deeper.

---

## Setting Up GitHub Actions

GitHub Actions is a CI system built into GitHub. You define workflows as YAML files in `.github/workflows/`. When you push, GitHub runs them automatically on their servers.

A workflow that runs your tests needs three things: a trigger (when to run), an environment (what machine to run on), and steps (what to do). Type `/dive "what is CI/CD?"` for a full explanation, or use `/hint` if you're stuck on the syntax.

---

## When You're Ready

Run `/check`. Push your code first so CI has a chance to run.
