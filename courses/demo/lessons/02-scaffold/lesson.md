# Lesson 2 — Get It Running

You've defined what you're building. Now make it real.

By the end of this lesson, your page will be running on your machine. You'll be able to change something and see the result immediately. That feedback loop — edit, save, see — is the core of how software gets built.

---

## What You're Building

A local development environment for your personal page. Running. In a browser. With your name on it.

---

## Objectives

1. **Initialize the project with your chosen stack**
   - Set up the project structure your stack needs
   - Install dependencies if needed
   - Commit the initial setup

2. **See your page running locally in the browser**
   - Start the dev server
   - Open it in a browser
   - See something — even if it's just "Hello World" with your name

3. **Make one visible change to confirm the dev loop works**
   - Change something on the page
   - Save the file
   - Confirm you see the change in the browser without reloading manually

---

## What Success Looks Like

When you run `/check`:
- A dev server command exists and runs without errors
- An entry point file exists with content that's yours (not just unchanged boilerplate)

The second check is the key one: did you actually start building *your* page, or did you just run `npm create`? The майстор will look at the file and judge.

---

## The Dev Loop

The thing you're confirming in objective 3 is called the inner dev loop: the cycle of making a change and seeing the result. Most modern dev servers (Vite, webpack, parcel) do this automatically via Hot Module Replacement (HMR) — you save a file and the browser updates instantly.

If you're working with plain HTML/CSS, you might need a simple live server. VS Code has one built in, or you can use `npx live-server`.

Type `/dive "what is a dev server?"` if you want to understand what's actually happening.

---

## Getting Unstuck

If your chosen stack feels complex to set up, that's useful information. It might mean:
- The stack is appropriate but you need to learn the setup (use `/hint`)
- The stack might be more than you need for this project (worth reconsidering)

Ask the майстор. That's what they're here for.

---

## When You're Ready

Run `/check`. Show what you've got running.
