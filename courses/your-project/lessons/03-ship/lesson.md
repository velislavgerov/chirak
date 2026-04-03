# Lesson 3 — Ship It

Running locally is not shipped.

Shipped means someone else can access it. Shipped means it exists outside your machine. Shipped means you've made the thing real in the world.

This lesson is about that transition.

---

## What "Shipped" Means for Your Project

- **Web app or site**: Live at a URL. Someone can visit it.
- **CLI tool**: Published to a package registry (npm, PyPI, crates.io, Homebrew). Someone can install it.
- **API or backend**: Running on a server. Someone can make requests to it.
- **Library**: Published to a registry, or at minimum a tagged GitHub release others can reference.
- **Script or automation**: Available for others to use — documented in a repo, runnable with clear instructions.

If none of these fit your project type exactly, describe what "accessible to others" means and the майстор will adapt.

---

## Objectives

1. **Push your code to a GitHub repository**
   - If you haven't already: create a repo, add your remote, push

2. **Deploy or publish your project**
   - Use whatever platform fits your project type
   - Connect it to your GitHub repo where possible (so future pushes deploy automatically)

3. **Verify it works in deployed form**
   - Visit the URL, install the package, make the request — actually verify it works
   - Don't assume the deployment succeeded just because no errors appeared

---

## What Success Looks Like

When you run `/check`, the майстор will ask you to demonstrate that your project is accessible. You'll also be asked to explain what happened when you deployed — not step-by-step instructions, but what actually occurs: where does the code go? Who runs it? How does a user get to it?

Understanding what happened is part of passing. You can look it up, ask, or `/dive` it — but you need to own the explanation.

---

## Platform Options

**For web apps:**
- Vercel, Netlify, Cloudflare Pages — connect to GitHub, auto-deploy on push
- GitHub Pages — good for static sites
- Railway, Fly.io, Render — good for apps that need a server

**For CLI tools:**
- npm: `npm publish` (needs an npm account)
- PyPI: `python -m build && twine upload dist/*`
- Homebrew: create a formula in a tap repo

**For APIs/backends:**
- Railway, Fly.io, Render — Docker-friendly, free tiers available
- Cloud providers (AWS, GCP, Azure) — more setup, more control

Ask the майстор which fits your project best if you're unsure.

---

## When You're Ready

Run `/check`. Have your deployed URL or package name ready. Be ready to explain what deployment means for your project.
