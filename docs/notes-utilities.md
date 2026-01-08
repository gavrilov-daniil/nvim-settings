# Локальные утилиты для заметок

Источник: `lua/notes/*`.

## Автовставка frontmatter
Файл: `lua/notes/frontmatter.lua`
- Триггер: `BufNewFile` для `~/vault/**/*.md`.
- Если файл пустой и без frontmatter, вставляется шаблон:
  - `title` = имя файла (дефисы заменяются на пробелы)
  - `created` = текущая дата/время
  - `tags` и `aliases` пустые
  - H1 заголовок с тем же title

## Capture в inbox
Файл: `lua/notes/capture.lua`
- Команда: `:VaultInbox`
- Создает файл в `~/vault/inbox` с именем `YYYY-MM-DD_HHMM_slug.md`.
- Если файл новый и пустой — вставляет frontmatter + H1 + список.

## Toggle checkbox
Файл: `lua/notes/checkbox.lua`
- Команда: `:ToggleCheckbox`
- Меняет состояние чекбокса на текущей строке:
  - `- [ ]` -> `- [x]`
  - `- [x]` -> `- [ ]`
  - иначе префиксит строку `- [ ] `

## Поиск по vault через Telescope
Файл: `lua/notes/telescope_vault.lua`
- Команда: `:VaultFind` — `telescope.find_files` в `~/vault`.
- Команда: `:VaultGrep` — `telescope.live_grep` в `~/vault`.
