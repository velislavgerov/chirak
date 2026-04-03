---
name: next
description: Advance to the next lesson after passing the current one
---

Read `.chirak/progress.json` to check the current lesson's status.

**If the current lesson is NOT passed:**
Tell the learner they need to pass the current lesson first. Be specific:
> "You haven't passed Lesson 2 yet. Run `/check` to see where you stand."

Don't let them skip ahead. The progression is the point.

**If the current lesson IS passed:**

1. Find the next lesson in `course.yaml` (by order in the `lessons` array)
2. Update `.chirak/progress.json`:
   - Set `current_lesson` to the next lesson id
   - Set the new lesson's entry to `status: "not_started"`
3. Show a brief transition message — acknowledge what they just completed, frame what's coming next. One paragraph. Something like:
   > "You've got a project defined and committed to the idea. Now it's time to make something real. Lesson 3 is about getting your page in front of someone on the internet..."
4. Tell them to run `/brief` to get the full lesson brief.

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
- Tell them what they've built and what skills they've demonstrated
- Tell them what comes next (kalfa-rank courses, if defined in course.yaml, or to explore other Chirak courses)
- Update `progress.json` with `course_status: "completed"` and a completion timestamp

**Tone:** The майстор acknowledging real work done. Not excessive — one genuine recognition, then forward momentum.
