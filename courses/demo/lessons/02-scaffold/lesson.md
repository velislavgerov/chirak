# Lesson 2 — Get It Running

You've defined what you're building. Now let's make something real — something you can open in a browser and see.

This lesson is about getting your project set up and seeing it run locally. Claude will create the files; your job is to review them, request changes, and understand what was built and why.

---

## What You're Building

Claude will scaffold your personal page project — create the initial files, set up the development environment, and get a preview running in your browser.

By the end of this lesson, you'll have a working project structure with your own content (not just boilerplate) and a dev server you can use to see changes as you make them.

---

## Objectives

1. **Ask Claude to scaffold the project** — describe what you want, and Claude will create the files. Example: "Set up a personal page project using plain HTML and CSS. Create an index.html with a header with my name and some placeholder content."

2. **See it running in your browser** — Claude will tell you the command to run. Run it, and confirm the page loads.

3. **Make one visible change** — tell Claude to change something (the headline, a color, add a section) and watch it update. This confirms the dev loop works.

4. **Review what was created** — ask Claude to explain the project structure. You should understand what each file does, at least at a high level.

---

## What Success Looks Like

When you run `/chirak:check`, the майстор will check:

- Does a dev server command exist and run without errors?
- Does the entry point file (index.html or equivalent) contain your content, not just unmodified boilerplate?

Your name should be in there. Something that's yours.

---

## How to Start

Tell Claude what stack you chose (from Lesson 1) and ask it to scaffold the project:

> "Set up my personal page project. I'm using plain HTML and CSS — no build step. Create an index.html and styles.css. The page should have a header with my name 'Velislav Gerov', a nav section, and a placeholder for project cards."

Or for a framework:

> "Scaffold a Vite + React project for my personal page. Get the dev server running. Replace the default App component with a simple layout: header with my name, main content area, footer."

Claude will create the files. Review them. Ask for changes. That iteration is the work.

Type `/chirak:dive "what is a dev server?"` if you want to understand what's happening when you run the dev server.

---

## When You're Ready

Run `/chirak:check` and the майстор will evaluate your setup.
