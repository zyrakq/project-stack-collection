#!/usr/bin/env bash
# Clone project repos listed in projects.csv (path;url) that are missing. Idempotent.
root="$(git rev-parse --show-toplevel)" || exit 0
[[ -f "$root/projects.csv" ]] || exit 0
tail -n +2 "$root/projects.csv" | while IFS=';' read -r path url; do
  [[ -z "$path" || "$url" == "-" || -d "$root/$path/.git" ]] && continue
  mkdir -p "$(dirname "$root/$path")"
  git clone "$url" "$root/$path"
done
