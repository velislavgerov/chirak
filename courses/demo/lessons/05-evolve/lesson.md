# Lesson 5 — Change Without Fear

This is the lesson where everything comes together.

You have a live page. You have tests. You have CI. Now you're going to make a real change — add something new, improve something that exists — and ship it through the whole pipeline: write, test, push, deploy.

The goal isn't the change itself. The goal is experiencing the confidence that comes from having a safety net. You can change things and know whether you broke something. That's the skill.

---

## What You're Building

A meaningful update to your personal page, shipped through your full pipeline, with a written reflection on what you learned.

---

## Objectives

1. **Add a new feature or section to your page**
   - Something real: a projects section, a contact form, a dark mode toggle, a blog post, a better bio — anything that didn't exist before
   - It should be visible and intentional

2. **Verify tests still pass after the change**
   - Run `npm test` locally before pushing
   - If the change breaks existing tests, fix them or update them (both are valid)
   - If the change adds new behavior worth testing, add a test

3. **Deploy the update and confirm it's live**
   - Push to GitHub
   - Watch CI pass
   - Confirm the change is visible at your live URL

4. **Write a brief reflection in LEARNINGS.md**
   - What did you actually learn in this course? Be honest.
   - What surprised you?
   - What would you do differently if you started over?
   - What do you want to learn next?

---

## What Success Looks Like

When you run `/check`:
- The deployed site has visible changes (the майстор will ask for your URL and compare)
- `npm test` passes after your changes
- `LEARNINGS.md` exists with genuine observations — not a list of what you did, but what you *learned*

The reflection is not a formality. The майстор will read it. Write something true.

---

## On Refactoring

When you make changes to working code, you're in the domain of refactoring: changing structure without changing behavior. Tests are what make refactoring safe. If they still pass, you haven't broken anything that was working.

This lesson is the practical proof of that idea. Type `/dive "what is refactoring?"` if you want to understand it more deeply.

---

## Completing the Course

After this lesson, you'll have:
- Defined, built, and shipped a real project
- Experienced the full development cycle: define → scaffold → ship → verify → evolve
- Established habits that experienced developers rely on

That's the chirak rank: not just writing code, but understanding the process.

---

## When You're Ready

Run `/check`. Have your deployed URL and LEARNINGS.md ready.
