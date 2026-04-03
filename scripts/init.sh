#!/usr/bin/env bash
set -euo pipefail

# chirak init — installs Chirak skills and course into a project
#
# Usage:
#   bash <(curl -s https://raw.githubusercontent.com/velislavgerov/chirak/main/scripts/init.sh) demo
#   bash <(curl -s https://raw.githubusercontent.com/velislavgerov/chirak/main/scripts/init.sh) your-project
#   ./scripts/init.sh demo ./my-project
#   ./scripts/init.sh your-project ./my-project

CHIRAK_REPO="https://raw.githubusercontent.com/velislavgerov/chirak/main"
COURSE="${1:-demo}"
TARGET="${2:-.}"

# ─── helpers ────────────────────────────────────────────────────────────────

green()  { printf "\033[0;32m%s\033[0m\n" "$*"; }
bold()   { printf "\033[1m%s\033[0m\n" "$*"; }
dim()    { printf "\033[2m%s\033[0m\n" "$*"; }

# Detect whether we're running from a local clone or via curl
if [[ -f "${BASH_SOURCE[0]%/*}/../skills/chirak/brief.md" ]]; then
  CHIRAK_LOCAL_ROOT="$(cd "${BASH_SOURCE[0]%/*}/.." && pwd)"
  LOCAL=true
else
  LOCAL=false
fi

# ─── validation ──────────────────────────────────────────────────────────────

validate_course() {
  local course="$1"
  case "$course" in
    demo|your-project) return 0 ;;
    *) echo "Unknown course: '$course'. Available courses: demo, your-project" >&2; exit 1 ;;
  esac
}

validate_course "$COURSE"

# Create target directory if it doesn't exist
if [[ "$TARGET" != "." && ! -d "$TARGET" ]]; then
  mkdir -p "$TARGET"
fi

TARGET="$(cd "$TARGET" && pwd)"

# ─── banner ──────────────────────────────────────────────────────────────────

echo ""
bold "╔══════════════════════════════════════════════╗"
bold "║   ч и р а к   —   the apprentice framework  ║"
bold "║                                              ║"
bold "║   чирак  →  калфа  →  майстор               ║"
bold "╚══════════════════════════════════════════════╝"
echo ""
dim "Installing course: $COURSE"
dim "Target: $TARGET"
echo ""

# ─── copy skills ─────────────────────────────────────────────────────────────

SKILLS_DIR="$TARGET/.claude/skills/chirak"
mkdir -p "$SKILLS_DIR"

SKILLS=(brief check hint next status dive)

for skill in "${SKILLS[@]}"; do
  if [[ "$LOCAL" == true ]]; then
    cp "$CHIRAK_LOCAL_ROOT/skills/chirak/${skill}.md" "$SKILLS_DIR/${skill}.md"
  else
    curl -fsSL "$CHIRAK_REPO/skills/chirak/${skill}.md" -o "$SKILLS_DIR/${skill}.md"
  fi
done

green "✓ Skills installed → .claude/skills/chirak/"

# ─── copy course ─────────────────────────────────────────────────────────────

COURSE_DIR="$TARGET/courses/$COURSE"
mkdir -p "$COURSE_DIR/lessons"

if [[ "$LOCAL" == true ]]; then
  cp -r "$CHIRAK_LOCAL_ROOT/courses/$COURSE/." "$COURSE_DIR/"
else
  # Download course.yaml
  mkdir -p "$COURSE_DIR"
  curl -fsSL "$CHIRAK_REPO/courses/$COURSE/course.yaml" -o "$COURSE_DIR/course.yaml"

  # Parse lesson ids from course.yaml and download lesson files
  # (simple grep-based parse — no yq/jq required)
  while IFS= read -r line; do
    if [[ "$line" =~ ^[[:space:]]*-[[:space:]]+id:[[:space:]]+(.*) ]]; then
      lesson_id="${BASH_REMATCH[1]}"
      mkdir -p "$COURSE_DIR/lessons/$lesson_id"
      curl -fsSL "$CHIRAK_REPO/courses/$COURSE/lessons/$lesson_id/lesson.md" \
        -o "$COURSE_DIR/lessons/$lesson_id/lesson.md" 2>/dev/null || true
    fi
  done < "$COURSE_DIR/course.yaml"
fi

green "✓ Course installed → courses/$COURSE/"

# ─── copy CLAUDE.md ──────────────────────────────────────────────────────────

if [[ ! -f "$TARGET/CLAUDE.md" ]]; then
  if [[ "$LOCAL" == true ]]; then
    cp "$CHIRAK_LOCAL_ROOT/templates/CLAUDE.md" "$TARGET/CLAUDE.md"
  else
    curl -fsSL "$CHIRAK_REPO/templates/CLAUDE.md" -o "$TARGET/CLAUDE.md"
  fi
  green "✓ CLAUDE.md installed"
else
  # CLAUDE.md exists — append Chirak block if not already present
  if ! grep -q "майстор — Chirak Learning Guide" "$TARGET/CLAUDE.md" 2>/dev/null; then
    echo "" >> "$TARGET/CLAUDE.md"
    if [[ "$LOCAL" == true ]]; then
      cat "$CHIRAK_LOCAL_ROOT/templates/CLAUDE.md" >> "$TARGET/CLAUDE.md"
    else
      curl -fsSL "$CHIRAK_REPO/templates/CLAUDE.md" >> "$TARGET/CLAUDE.md"
    fi
    green "✓ CLAUDE.md updated (Chirak block appended)"
  else
    dim "  CLAUDE.md already has Chirak config — skipped"
  fi
fi

# ─── create progress.json ────────────────────────────────────────────────────

PROGRESS_DIR="$TARGET/.chirak"
mkdir -p "$PROGRESS_DIR"

# Get the first lesson id from course.yaml
FIRST_LESSON=$(grep -A1 "^lessons:" "$COURSE_DIR/course.yaml" | grep -m1 "id:" | sed 's/.*id:[[:space:]]*//')

if [[ -z "$FIRST_LESSON" ]]; then
  FIRST_LESSON="01-define"
fi

TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

cat > "$PROGRESS_DIR/progress.json" <<EOF
{
  "course": "$COURSE",
  "course_status": "in_progress",
  "current_lesson": "$FIRST_LESSON",
  "started_at": "$TIMESTAMP",
  "lessons": {},
  "hints_used": []
}
EOF

green "✓ Progress initialized → .chirak/progress.json"

# ─── .gitignore hint ─────────────────────────────────────────────────────────

# Don't auto-modify .gitignore, but suggest if it doesn't mention .chirak
if [[ -f "$TARGET/.gitignore" ]] && ! grep -q "\.chirak" "$TARGET/.gitignore" 2>/dev/null; then
  dim ""
  dim "  Tip: add .chirak/ to .gitignore if you don't want to commit progress tracking"
fi

# ─── done ────────────────────────────────────────────────────────────────────

echo ""
bold "╔══════════════════════════════════════════════╗"
bold "║   Ready. The apprentice can begin.           ║"
bold "╚══════════════════════════════════════════════╝"
echo ""
echo "Next steps:"
echo ""
echo "  1. cd $TARGET"
echo "  2. claude"
echo "  3. /brief"
echo ""
dim "The майстор is waiting."
echo ""
