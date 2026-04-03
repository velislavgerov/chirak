# Lesson 5 — Change Without Fear

You have a working page, deployed, with tests and CI. Now use it.

This lesson is about making a real improvement and shipping it safely through the pipeline you built. Then writing down what you learned.

---

## What You're Building

Claude will help you add a meaningful feature or improvement to your personal page — something you actually want on it. You'll push it, watch CI pass, and confirm it's live. Then you'll write a brief reflection: what did you learn doing this project?

---

## Objectives

1. **Choose a feature to add** — something real: a projects section, a contact form, a dark mode toggle, a blog post, an about section. Tell Claude what you want, and Claude will build it.

2. **Review the changes and request adjustments** — this is your page. Make it look and say what you want.

3. **Verify tests still pass** — after the feature is added, run the test suite. If something needs updating, ask Claude to update the tests too.

4. **Ship it** — push to GitHub. Watch CI pass. Confirm the change is live at your URL.

5. **Write a `LEARNINGS.md`** — ask Claude to help you reflect: what did you understand by the end of this project that you didn't at the start? What would you do differently? What was harder or easier than you expected? Write it honestly — this is for you, not for a grade.

---

## What Success Looks Like

When you run `/chirak:check`, the майстор will check:

- Is there a visible change on your deployed page compared to Lesson 4?
- Does the test suite still pass?
- Does `LEARNINGS.md` exist with honest reflections — not a task list, but something that shows you actually processed what happened?

The reflection is the most important part of this lesson. What you articulate, you own.

---

## How to Start

Decide what to add, then tell Claude:

> "Add a projects section to my personal page. It should show 3 project cards with a title, short description, and a link. Use placeholder data for now — I'll fill in real projects later."

Or:

> "I want to add a dark mode toggle to my page. It should remember the preference between visits. Add it and update the tests."

After the feature is working and shipped, write the reflection:

> "Help me write a LEARNINGS.md for this project. Ask me some questions first to help me think through what I actually learned."

---

## When You're Ready

Run `/chirak:check`. Share your deployed URL with the changes visible. The майстор will evaluate the feature, the tests, and the reflection.
