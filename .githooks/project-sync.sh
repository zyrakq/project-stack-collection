#!/usr/bin/env bash
# Rewrite url to the transport (ssh/https) of the host repo's origin.
norm_url() {
  local u="$1" o
  o="$(git -C "${root:-.}" remote get-url origin 2>/dev/null)" || { printf '%s' "$u"; return 0; }
  if [[ "$o" == git@* || "$o" == ssh://* ]] && [[ "$u" =~ ^https?://([^/]+)/(.+)$ ]]; then
    printf 'git@%s:%s' "${BASH_REMATCH[1]}" "${BASH_REMATCH[2]}"
  elif [[ "$o" == http://* || "$o" == https://* ]] && [[ "$u" =~ ^git@([^:]+):(.+)$ ]]; then
    printf 'https://%s/%s' "${BASH_REMATCH[1]}" "${BASH_REMATCH[2]}"
  else
    printf '%s' "$u"
  fi
}
# Clone project repos listed in projects.csv (path;url) that are missing. Idempotent.
root="$(git rev-parse --show-toplevel)" || exit 0
[[ -f "$root/projects.csv" ]] || exit 0
tail -n +2 "$root/projects.csv" | while IFS=';' read -r path url; do
  [[ -z "$path" || "$url" == "-" || -d "$root/$path/.git" ]] && continue
  mkdir -p "$(dirname "$root/$path")"
  git clone "$(norm_url "$url")" "$root/$path"
done
