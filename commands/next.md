---
name: chirak:next
description: Advance to the next lesson after passing the current one
---

Read `.chirak/progress.json` to check the current lesson's status.

**If the current lesson is NOT passed:**
Tell the learner they need to pass the current lesson first:
> "You haven't passed Lesson 2 yet. Run `/chirak:check` to see where you stand."

**If the current lesson IS passed:**

1. Find the next lesson in `course.yaml` (by order in the `lessons` array)
2. Update `.chirak/progress.json`:
   - Set `current_lesson` to the next lesson id
   - Set the new lesson's entry to `status: "not_started"`
3. Show a brief transition message — acknowledge what they just built, frame what's coming next. One paragraph. Something like:
   > "You've got a project defined and a clear idea of what you're building. Now it's time to make something real — something running. Lesson 2 is about getting your dev environment working and seeing your page in a browser for the first time..."
4. Tell them to run `/chirak:brief` to get the full lesson brief.

**If this WAS the last lesson:**

Check the course's `rank` field in `course.yaml`. Generate a completion message:

```
╔══════════════════════════════════════════════╗
║   COURSE COMPLETE                            ║
║                                              ║
║   Your First Ship                            ║
║   Rank earned: чирак / chirak                ║
║                                              ║
║   чирак → [калфа] → майстор                 ║
╚══════════════════════════════════════════════╝
```

Then:
- Tell them what they built and what they demonstrated: the full development cycle, end to end.
- Tell them what comes next (kalfa-rank courses, if defined in course.yaml, or to explore other Chirak courses)
- Update `progress.json` with `course_status: "completed"` and a completion timestamp

**Tone:** The майстор acknowledging real work done. Not excessive — one genuine recognition, then forward momentum.
