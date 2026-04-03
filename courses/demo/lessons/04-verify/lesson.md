# Lesson 4 — Trust But Verify

You have a live page. Now let's make sure it stays working as you change it.

This lesson is about adding automated tests and CI — a system that checks your work every time you push. Claude will write the tests and set up the workflow. Your job is to understand what they're checking and why.

---

## What You're Building

Claude will add an automated test suite to your project and set up a GitHub Actions CI workflow that runs the tests on every push. By the end of this lesson, you'll have a safety net: push a change, CI runs, you know within a minute whether anything broke.

---

## Objectives

1. **Ask Claude to add tests** — describe what you want verified (e.g. "make sure my name appears on the page" or "check that all my nav links exist"). Claude will write tests and explain what each one checks.

2. **Run the tests locally** — confirm they pass. Claude will tell you the command.

3. **Ask Claude to set up CI** — a GitHub Actions workflow that runs the tests on every push. Claude will create the workflow file and explain how it works.

4. **Make a change, push, and watch CI run** — edit something in your page, push to GitHub, and confirm CI passes. This is the loop you'll use for the rest of the course.

---

## What Success Looks Like

When you run `/chirak:check`, the майстор will:

- Run your test suite locally and confirm it passes
- Check that a CI workflow file exists in `.github/workflows/`

You should be able to explain (briefly) what your tests are checking. Not the code — the intent. "This test verifies my name is on the page. If I accidentally delete the header, this test catches it."

---

## How to Start

Tell Claude what you want to verify about your page:

> "Add tests for my personal page. I want to verify that my name 'Velislav Gerov' appears in the header, and that the nav links exist. Use Vitest and Testing Library."

Or if you're not sure what to test:

> "Add a basic test suite to my personal page project. What should I be testing at this stage? Explain your choices, then write the tests."

Then, once tests are passing locally:

> "Set up a GitHub Actions CI workflow that runs my tests on every push to main. Use Node 20."

Type `/chirak:dive "what is CI/CD?"` to understand what's happening before you set it up.

---

## When You're Ready

Run `/chirak:check` and the майстор will verify your test suite and CI configuration.
