---
name: dive
description: Deep-dive explanation of a concept, or list available learning moments and references
---

Check the arguments passed to this command.

**If called with a concept argument (e.g. `/dive "what is a dev server"` or `/dive CI/CD`):**

Explain the concept in depth. Structure your explanation as:

1. **What it is** — plain language, no assumed knowledge
2. **Why it matters** — specifically in the context of what the learner is building right now
3. **A concrete analogy** — something from everyday life that maps to the concept
4. **How it applies here** — connect it back to the current lesson objectives
5. **Resources** — surface relevant links in this priority order:
   - Resources from the matching `learning_moment` in the current lesson's `course.yaml` (most specific)
   - Resources from the course-level `references` section in `course.yaml` (if relevant)
   - 1–2 high-quality external resources you know (MDN, official docs, GitHub repos)

Always include at least one resource. Official documentation is preferred over tutorials for reference material.

Be thorough but not exhausting. If the concept is broad, ask which aspect they want to dig into before going deep.

**If called without arguments during a lesson:**

Read the current lesson from `.chirak/progress.json` and `course.yaml`. Show two sections:

```
Learning moments for this lesson:

  /dive "what is a tech stack?"
  /dive "what is a dev server?"
  /dive "why version control?"

  These concepts will come up naturally as you work. Type any of the above to go deeper.

Course references:

  • MDN Web Docs — https://developer.mozilla.org
    The authoritative reference for HTML, CSS, and JavaScript.

  • Git Handbook — https://guides.github.com/introduction/git-handbook/
    Git concepts and commands explained clearly.

  [... rest of course-level references ...]
```

If there are no learning moments defined for the current lesson, say so and offer to explain any concept they're curious about.

Show the course-level references section even if there are no lesson-specific learning moments — these are always worth surfacing.

**Tone:** Patient and thorough. The майстор who genuinely enjoys explaining the craft. Connect everything to what the learner is actually building — abstract concepts land better with concrete anchors.

> "Let me show you how this fits into what you're building..."
