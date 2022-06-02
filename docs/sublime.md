# Sublime

### Personal Config
```json
{
    "color_scheme": "Packages/Bubububububad and Boneyfied Color Schemes/Boneyfied.tmTheme",
    "font_size": 10,
    "ignored_packages":
    [
        "Vintage"
    ],
    "default_line_ending": "unix",
    "soda_classic_tabs": false,
    "soda_folder_icons": true,
    "soda_rect_scrollbars": true,
    "theme": "SoDaReloaded Dark.sublime-theme",
    "translate_tabs_to_spaces": true
}
```

### Keybindings (Chain of Command)
* Use `ctrl+s` to overwrite save
* Also possible: "unix", "windows", "cr"
```json
{
    "keys": ["alt+s"],
    "command": "chain",
    "args": {
        "commands": [
            ["set_line_ending", {"type": "unix"}],
            ["save"]
        ]
    },
}
```
