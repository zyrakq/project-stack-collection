# project-stack-collection

Коллекция прикладных проектов (стеков). Каждый подпроект — независимый
git-репозиторий, который клонируется в свою папку и трекается в манифесте
`projects.csv` (формат `path;url`).

## Структура

- `stacks/apps/` — приложения (argiago, velora)
- `stacks/ui/` — UI-библиотеки (open-coreui, open-velaui)
- `stacks/auth/` — аутентификация / SSO (kanidm-admin, nostr-oidc-bridge, wcauth-tb-component)
- `stacks/certs/` — PKI (certivore, step-ca-companion)
- `stacks/archive/` — архив (argiago-react)
- `projects.csv` — манифест подпроектов
- `plugins.csv` — манифест плагинов (пока пуст)
- `.githooks/` — `project-sync.sh` / `plugin-sync.sh` + `post-merge` / `post-checkout`:
  недостающие репо клонируются автоматически

## Подключение хуков

```sh
git config core.hooksPath .githooks
```

## Добавление подпроекта

Добавить строку `path;url` в `projects.csv` и выполнить
`.githooks/project-sync.sh`.
