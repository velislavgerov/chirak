# Lesson 4 — Trust But Verify

You have something shipped. Now you need confidence you can keep shipping without breaking it.

This lesson is about adding automated tests and CI — a system that verifies your project's core behavior on every push. Claude will write the tests and set up the workflow. Your job is to understand what they're checking and why.

---

## What You're Building

Claude will add a test suite that covers your project's core behavior and set up a GitHub Actions CI workflow that runs the tests automatically on every push.

---

## Objectives

1. **Tell Claude what to test** — describe the core behavior of your project. Claude will write tests that verify it. Claude will explain what each test checks and what would cause it to fail.

2. **Run the tests locally** — confirm they pass. Claude will give you the command.

3. **Ask Claude to set up CI** — a GitHub Actions workflow. Claude will create the workflow file and explain how it works.

4. **Push a change and watch CI run** — push anything to GitHub, go to the Actions tab, confirm the workflow ran and passed.

---

## What "Meaningful" Means

The test quality matters, not the test count. The question is: **if you broke the core behavior, would this test catch it?**

For a URL shortener: does the test verify a URL gets shortened and the short URL redirects correctly?

For a CLI formatter: does the test verify that specific input produces the expected formatted output?

For a web app: does the test verify key content renders and the main user action works?

A test that only imports your module and checks it's defined is not meaningful. A test that exercises real behavior is.

Not sure what to test? Tell Claude what your project does and ask what tests would actually catch bugs in the core logic.

---

## What Success Looks Like

When you run `/chirak:check`, the майстор will:
- Run your test command and confirm it passes
- Check that a GitHub Actions workflow exists in `.github/workflows/`
- Evaluate whether the tests actually test something meaningful

---

## How to Start

Describe your project's core behavior to Claude:

> "My project is a hex color converter CLI. The main function takes a hex string like '#ff5733' and returns the RGB equivalent. Add tests that verify the conversion is correct for several inputs, including edge cases like '#000000' and '#ffffff'."

Then, once tests pass:

> "Set up GitHub Actions CI that runs my tests on every push. I'm using Python with pytest."

Type `/chirak:dive "what is CI/CD?"` to understand what's happening before you set it up.

---

## When You're Ready

Run `/chirak:check`. Push to GitHub first so CI has a chance to run.
