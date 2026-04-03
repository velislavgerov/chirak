---
name: chirak:next
description: Advance to the next lesson after passing the current one
---

Read `.chirak/progress.json` to check the current lesson's status.

**If the current lesson is NOT passed:**

Format a header and tell the learner they need to pass first:
```
┌─── чирак ────────────────────────────────────┐
│  /next · Lesson 2 — Get It Running           │
└──────────────────────────────────────────────┘
```
> "You haven't passed Lesson 2 yet. Run `/chirak:check` to see where you stand."

---

**If the current lesson IS passed:**

1. Find the next lesson in `course.yaml` (by order in the `lessons` array).
2. Update `.chirak/progress.json`:
   - Set `current_lesson` to the next lesson id
   - Set the new lesson's entry to `status: "not_started"`

3. **Show a celebration moment.** Format it using the rating earned:

```
┌─── чирак ────────────────────────────────────┐
│  Lesson 2 complete  ◆ калфа                  │
└──────────────────────────────────────────────┘
```
Use the actual lesson number and the rating from `progress.json` (чирак / калфа / майстор).

Then a brief acknowledgment — one sentence about what they built, genuine and specific. Not generic praise.

**Шевица divider:**
```
─── ◆ ─── ◆ ─── ◆ ─── ◆ ─── ◆ ───
```

Then a transition line — what's coming next, framed as forward momentum:
> "Now it's time to make something real — something running. Lesson 3 is about getting your dev environment working and seeing your page in a browser for the first time."

End with:
> "Run `/chirak:brief` to get the full lesson brief."

---

**If this WAS the last lesson:**

Check the course's `rank` field in `course.yaml`. Generate a completion message using a full-width box:

```
╔══════════════════════════════════════════════╗
║   COURSE COMPLETE                            ║
║                                              ║
║   Your First Ship                            ║
║   Rank earned: чирак / chirak                ║
║                                              ║
║   ◉ чирак → калфа → майстор                 ║
╚══════════════════════════════════════════════╝
```
Use the actual course name and rank from `course.yaml`. Show the rank progression with ◉ marking what was just earned.

Then:
- Tell them what they built and what they demonstrated: the full development cycle, end to end.
- Tell them what comes next (kalfa-rank courses if defined in course.yaml, or to explore other Chirak courses).
- Update `progress.json` with `course_status: "completed"` and a completion timestamp.

---

**Tone:** The майстор acknowledging real work done. Not excessive — one genuine recognition, then forward momentum. The celebration should feel earned, not automatic.
