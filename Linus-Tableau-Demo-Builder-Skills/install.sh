#!/usr/bin/env bash
set -euo pipefail

TARGET_DIR="${1:-$PWD}"
PACK_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing Linus Tableau Demo Builder Skills into: $TARGET_DIR"

mkdir -p "$TARGET_DIR/skills"
cp -R "$PACK_DIR/skills/." "$TARGET_DIR/skills/"

mkdir -p "$TARGET_DIR/memory"
if [[ ! -f "$TARGET_DIR/memory/MEMORY.md" ]]; then
  cp "$PACK_DIR/memory/MEMORY.md" "$TARGET_DIR/memory/MEMORY.md"
  echo "Created memory/MEMORY.md from template."
else
  echo "memory/MEMORY.md already exists; left unchanged."
fi

echo "Install complete."
echo "Next step: read skills/end-to-end-demo-builder/SKILL.md"
