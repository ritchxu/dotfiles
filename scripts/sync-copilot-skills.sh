#!/usr/bin/env bash
set -euo pipefail

SKILLS_DIR="${COPILOT_SKILLS_DIR:-"$HOME/.copilot/skills"}"
MANIFEST_FILE="$SKILLS_DIR/.gist-skills"
TAG_PREFIX="Copilot skill:"

if [ -z "${GIST_SKILLS_TOKEN:-}" ] || ! command -v gh >/dev/null 2>&1; then
  exit 0
fi

export GH_TOKEN="$GIST_SKILLS_TOKEN"
mkdir -p "$SKILLS_DIR"

tmp_root="$(mktemp -d)"
trap 'rm -rf "$tmp_root"' EXIT

gh api --paginate /gists \
  --jq ".[] | select(.description // \"\" | startswith(\"$TAG_PREFIX\")) | [.id, .description] | @tsv" \
  > "$tmp_root/gists"

touch "$tmp_root/manifest"

while IFS=$'\t' read -r id description; do
  [ -n "$id" ] || continue

  name="${description#"$TAG_PREFIX"}"
  slug="$(printf '%s' "$name" |
    sed -E 's/^[[:space:]]+|[[:space:]]+$//g; s/[^[:alnum:]_-]+/-/g; s/^-+|-+$//g')"
  [ -n "$slug" ] || slug="$id"

  dest="$SKILLS_DIR/$slug"
  clone_dir="$tmp_root/$id"
  gh gist clone "$id" "$clone_dir" >/dev/null

  if [ ! -f "$clone_dir/SKILL.md" ]; then
    echo "Skipping '$description': gist does not contain SKILL.md." >&2
    continue
  fi

  rm -rf "$dest"
  mkdir -p "$dest"
  cp -R "$clone_dir/." "$dest/"
  printf '%s\n' "$slug" >> "$tmp_root/manifest"
  echo "Synced Copilot skill gist -> ${dest#"$HOME"/}"
done < "$tmp_root/gists"

if [ -f "$MANIFEST_FILE" ]; then
  while IFS= read -r old_slug; do
    [ -n "$old_slug" ] || continue
    if ! grep -Fqx "$old_slug" "$tmp_root/manifest"; then
      rm -rf "$SKILLS_DIR/$old_slug"
      echo "Removed stale Copilot skill gist -> ${SKILLS_DIR#"$HOME"/}/$old_slug"
    fi
  done < "$MANIFEST_FILE"
fi

mv "$tmp_root/manifest" "$MANIFEST_FILE"
