# Lesson 3 — Ship It

Running locally is not shipped. Shipped means someone else can access it.

This lesson has one real objective: get your page live on the internet at a URL you can share. Everything else — the platform, the exact deployment method — is up to you.

---

## What You're Building

Your personal page, live. A real URL. Accessible by anyone.

---

## Objectives

1. **Push your code to a GitHub repository**
   - Create a GitHub repo for your project
   - Push your current code

2. **Deploy to a hosting platform**
   - Choose one: GitHub Pages, Vercel, Cloudflare Pages, Netlify, or similar
   - Connect your repo to the platform
   - Trigger a deployment

3. **Access your page at a live URL**
   - Visit the URL the platform gives you
   - Confirm your page loads

---

## What Success Looks Like

When you run `/check`:
- The майстор will ask for your deployed URL
- You should be able to explain what happened when you deployed — not just "I clicked deploy", but what the platform actually did
- A deployment configuration file should exist in your repo (a GitHub Actions workflow, `vercel.json`, `wrangler.toml`, or similar)

Understanding what happened is part of passing. You can look it up, you can ask, you can `/dive "what does deployment mean?"` — but you need to own the explanation.

---

## Choosing a Platform

All of these work well for personal pages and have free tiers:

- **GitHub Pages** — simplest if you're already on GitHub. Static files only (no server-side code).
- **Vercel** — excellent for React/Next.js/Vite projects. One-click deploy from GitHub.
- **Cloudflare Pages** — fast globally, generous free tier, works with any static framework.
- **Netlify** — similar to Vercel. Good drag-and-drop deploy if you want to start simple.

Pick one. You can always change later.

---

## The Git Step

If you haven't used Git before (or haven't used it much), this is the moment where it becomes real. Git isn't just a backup system — it's a record of every intentional change to your project, and the connection between your local work and the deployed site.

Type `/dive "what is Git and why version control?"` if you want the full picture.

---

## When You're Ready

Run `/check`. Have your deployed URL ready.
