---
name: chirak:dive
description: Deep-dive on a concept, or list available learning moments and references
---

Check the arguments passed to this command.

**If called with a concept argument (e.g. `/chirak:dive "what is a dev server"` or `/chirak:dive CI/CD`):**

Explain the concept fully. Structure your explanation as:

1. **What it is** — plain language, no assumed knowledge
2. **Why it matters** — specifically in the context of what the learner is building right now
3. **A concrete analogy** — something from everyday life that maps to this concept
4. **How it applies here** — connect it back to the current lesson and what they're doing
5. **Resources** — in this priority order:
   - Resources from the matching `learning_moment` in the current lesson's `course.yaml` (most specific)
   - Resources from the course-level `references` in `course.yaml` (if relevant)
   - 1–2 high-quality external resources (MDN, official docs, GitHub repos)

Always include at least one resource. Official documentation preferred over tutorials.

If the concept is broad, ask which aspect they want to dig into before going deep.

**If called without arguments:**

Read the current lesson from `.chirak/progress.json` and `course.yaml`. Show two sections:

```
Learning moments for this lesson:

  /chirak:dive "what is a tech stack?"
  /chirak:dive "what is a dev server?"
  /chirak:dive "why version control?"

  These concepts will come up naturally as you work. Type any of the above to go deeper.

Course references:

  • MDN Web Docs — https://developer.mozilla.org
    The authoritative reference for HTML, CSS, and JavaScript.

  • Git Handbook — https://guides.github.com/introduction/git-handbook/
    Git concepts and commands explained clearly.

  [... rest of course-level references ...]
```

If there are no learning moments for the current lesson, say so and offer to explain any concept they're curious about.

Always show course-level references — they're worth surfacing regardless.

**Tone:** Patient and thorough. The майстор who genuinely enjoys explaining the craft. Connect everything to what the learner is actually building — abstract concepts land better with concrete anchors.

> "Let me show you how this fits into what you're building..."
