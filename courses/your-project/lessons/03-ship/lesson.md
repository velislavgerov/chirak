# Lesson 3 — Ship It

Running locally is not shipped. Shipped means someone else can access it. This lesson is about making that transition.

Claude will handle the deployment configuration. Your job is to choose a platform, review what Claude sets up, and execute the steps that require your credentials or clicks.

---

## What "Shipped" Means for Your Project

- **Web app or site**: Live at a URL. Someone can visit it.
- **CLI tool**: Published to a package registry (npm, PyPI, crates.io). Someone can install it.
- **API or backend**: Running on a server. Someone can make requests to it.
- **Library**: Published to a registry, or at minimum a tagged GitHub release others can reference.
- **Script or automation**: In a GitHub repo with clear instructions for others to run it.

Not sure what "shipped" means for your project type? Ask Claude.

---

## Objectives

1. **Push your code to GitHub** — Claude will help you set up the repository and write a clear commit. Claude will explain what each git operation does.

2. **Choose a deployment target** — tell Claude what platform you want (or ask for a recommendation for your project type). Claude will create the configuration files.

3. **Verify it works in deployed form** — actually visit the URL, install the package, or make the request. Don't assume the deployment succeeded — check it.

---

## What Success Looks Like

When you run `/chirak:check`, the майстор will ask you to demonstrate that your project is accessible:
- For web apps: share the URL
- For CLI tools: share the install command
- For APIs: share the endpoint URL and a sample request

You'll also be asked to briefly explain what happened when you deployed — where did the code go, who runs it, how does a user get to it. Claude will help you understand this as part of setting it up.

A deployment configuration file should exist in your repo.

---

## How to Start

Tell Claude what platform you want:

> "I want to deploy my Express API to Railway. Help me set it up. I have a Railway account. Create any config files needed."

Or ask for a recommendation:

> "I'm building a Python CLI tool. What's the best way to publish it so people can install it with pip? Walk me through the setup."

Claude will create the necessary files, tell you the steps that require your action (credentials, clicking buttons, connecting accounts), and explain what each step does.

Type `/chirak:dive "what does deployment mean for your project type?"` for a deeper explanation of how deployment works.

---

## When You're Ready

Run `/chirak:check`. Have your deployed URL or package name ready.
