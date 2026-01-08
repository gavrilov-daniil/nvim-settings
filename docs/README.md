# Документация по настройке заметок (Obsidian-подобно)

Кратко: это набор конфигов Neovim для работы с markdown‑заметками в папке `~/vault` с плагином `obsidian.nvim`, локальными командами и сниппетами.

## Содержание
- `docs/obsidian.md` — настройки `obsidian.nvim` и структура vault.
- `docs/notes-utilities.md` — локальные команды и автодействия для заметок.
- `docs/hotkeys.md` — все хоткеи из `lua/keys/maps.lua`.
- `docs/markdown-shortcuts.md` — шорткаты (сниппеты) для Markdown и как ими пользоваться.

## Архитектура (как это работает сейчас)
- Точка входа: `init.lua` загружает базовые опции, плагины, хоткеи и модули заметок.
- Плагины подключаются через `lazy.nvim` (`lua/plugins/init.lua`).
- Для markdown используется:
  - `obsidian.nvim` (workspace `~/vault`)
  - `LuaSnip` + `nvim-cmp` (сниппеты)
  - `telescope.nvim` (поиск по vault)
- Локальные команды заметок живут в `lua/notes/*` и регистрируются при старте.
