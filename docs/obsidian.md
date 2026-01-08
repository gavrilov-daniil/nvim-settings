# Obsidian.nvim

Источник конфигурации: `lua/plugins/obsidian.lua`.

## Workspace и структура
- Workspace: `~/vault`
- Заметки: `notes/`
- Daily notes: `daily/` (формат даты `%Y-%m-%d`, шаблон `daily.md`)
- Шаблоны: `templates/` (дата `%Y-%m-%d`, время `%H:%M`)
- Вложения: `attachments/`
- Стиль ссылок: `wiki`

## Генерация ID заметки
- Если есть заголовок — превращается в slug: пробелы `-`, символы кроме `\w` и `-` удаляются, нижний регистр.
- Если заголовка нет — используется `os.time()`.

## UI
- Встроенный UI включен (`ui.enable = true`).
