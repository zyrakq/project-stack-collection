# project-stack-collection

Collection of application projects (stacks). Each subproject is an independent
git repository cloned into its own folder and tracked in the `projects.csv`
manifest (`path;url` format).

## Structure

- `stacks/apps/` — applications (argiago, velora, open-coreui — closed frontend with open backend)
- `stacks/ui/` — UI libraries (open-velaui — an alternative implementation of the closed frontend)
- `stacks/auth/` — authentication / SSO (kanidm-admin, nostr-oidc-bridge, wcauth-tb-component)
- `stacks/certs/` — PKI (certivore, step-ca-companion)
- `stacks/archive/` — archive (argiago-react)
- `projects.csv` — manifest of subprojects
- `plugins.csv` — manifest of plugins (empty for now)
- `.githooks/` — `project-sync.sh` / `plugin-sync.sh` + `post-merge` / `post-checkout`:
  missing repos are cloned automatically

## Hook setup

```sh
git config core.hooksPath .githooks
```

## Adding a subproject

Add a `path;url` line to `projects.csv` and run
`.githooks/project-sync.sh`.
