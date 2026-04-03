# Lesson 4 — Trust But Verify

You have something shipped. Now you need confidence you can keep shipping.

This lesson is about building the system that tells you when something breaks. Not you manually checking, not "I think it still works" — a machine that runs your tests every time you push code and tells you the truth.

---

## What You're Building

A test suite that verifies your project's core behavior. A CI pipeline that runs those tests automatically on every push.

---

## Objectives

1. **Add at least one meaningful automated test**
   - Test the core behavior your project is responsible for
   - Use whatever testing tool fits your language and stack
   - One good test beats ten shallow tests

2. **Set up CI that runs tests on every push**
   - Create a GitHub Actions workflow in `.github/workflows/`
   - It should run on push (and ideally on pull requests)
   - It should install dependencies, then run your tests

3. **Make a change, push it, and verify CI passes**
   - Push any change to GitHub
   - Go to the Actions tab
   - Confirm the workflow ran and passed (green check)

---

## What "Meaningful" Means

The test quality check is judgment-based. The question is: **if you broke the core behavior, would this test catch it?**

For a URL shortener: does the test verify that a URL gets shortened and the short URL redirects to the original?

For a CLI formatter: does the test verify that specific input produces the expected formatted output?

For a web app: does the test verify that key elements render? That the main user action works?

A test that just imports your module and checks it's defined is not meaningful. A test that exercises real behavior is.

Ask the майстор if you're unsure what to test for your specific project.

---

## What Success Looks Like

When you run `/check`:
- Your test command runs and passes
- A GitHub Actions workflow exists
- You can show the майстор a passing CI run (the green check in the GitHub Actions tab)

The майстор will evaluate whether the test actually tests something meaningful — not count tests, but judge their signal value.

---

## A Note on Test-Driven Development

Some people write tests before the code (TDD). You don't have to. But writing tests *immediately after* the code — while you still remember exactly what the code is supposed to do — is much easier than writing them later.

This lesson is your first time setting up testing for this project. Make it count. Tests written now will tell you whether future changes break things.

---

## When You're Ready

Run `/check`. Push first so CI has a chance to run.
