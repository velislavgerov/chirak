# Lesson 3 — Ship It

Running on your laptop is good. Running on the internet is better. This lesson is about getting your page to a live URL that anyone can visit.

Claude will handle the deployment configuration. Your job is to choose a platform, review what Claude sets up, and push the code.

---

## What You're Building

Claude will help you push your code to GitHub and deploy it to a hosting platform of your choice. By the end of this lesson, your personal page will be live at a real URL.

---

## Objectives

1. **Push your code to GitHub** — if you don't have a GitHub repo yet, tell Claude to help you set one up. Claude will explain what each step does.

2. **Choose a hosting platform** — Vercel, Cloudflare Pages, GitHub Pages, or similar. Tell Claude which one you want (or ask for a recommendation), and Claude will create the deployment configuration.

3. **Get a live URL** — connect your repo to the platform and trigger a deployment. Paste the URL and confirm the page loads.

---

## What Success Looks Like

When you run `/chirak:check`, the майстор will ask for your deployed URL and check:

- Does the page load at the URL you provide?
- Does a deployment configuration file exist in your repo (e.g. `vercel.json`, a GitHub Actions workflow, or `wrangler.toml`)?

You'll also be asked to briefly explain what happened when you deployed — not in technical detail, but at the level of: "I pushed to GitHub, Vercel detected the push, built the site, and served it at this URL." That understanding is the objective.

---

## How to Start

Tell Claude which platform you want to use:

> "I want to deploy to Vercel. Help me set up the deployment. I already have a GitHub account."

Or if you want a recommendation:

> "I'm not sure which hosting platform to use for a static HTML/CSS page. What do you recommend and why? Then help me set it up."

Claude will create the necessary config files, tell you exactly what steps to take (the ones that require your credentials or clicks), and explain what's happening.

Type `/chirak:dive "what does deployment actually mean?"` if you want to understand what's happening under the hood before you start.

---

## When You're Ready

Run `/chirak:check` and share your deployed URL. The майстор will verify it's live.
