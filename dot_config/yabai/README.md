# yabai + skhd Keybindings

Quick reference for common window-management shortcuts. Bindings are defined in
[../skhd/skhdrc](../skhd/skhdrc) and act on the yabai config in
[executable_yabairc](executable_yabairc).

## Modifier legend

- `⌘` = cmd
- `⌥` = alt / option
- `⇧` = shift
- `⌃` = ctrl

## Apps

| Shortcut | Action |
| --- | --- |
| `⌘ ↩` | Open Ghostty |

## Window focus

| Shortcut | Action |
| --- | --- |
| `⌥ h` | Focus window west |
| `⌥ j` | Focus window south |
| `⌥ k` | Focus window north |
| `⌥ l` | Focus window east |

## Window movement

| Shortcut | Action |
| --- | --- |
| `⇧ ⌥ h` | Swap window west |
| `⇧ ⌥ j` | Swap window south |
| `⇧ ⌥ k` | Swap window north |
| `⇧ ⌥ l` | Swap window east |

## Window state

| Shortcut | Action |
| --- | --- |
| `⌥ f` | Toggle fullscreen zoom |
| `⇧ ⌥ t` | Toggle float (centered grid) |
| `⇧ ⌥ ↑` | Floating window fills screen |
| `⇧ ⌥ 0` | Balance window sizes |

## Spaces (desktops)

| Shortcut | Action |
| --- | --- |
| `⌘ ⌥ 1/2/3` | Focus space 1/2/3 |
| `⇧ ⌘ 1/2/3` | Send focused window to space 1/2/3 and follow |

## Tips

- Hold `fn` and left-drag to move a window, right-drag to resize
  (`mouse_modifier = fn`).
- Focus follows mouse (`autofocus` mode) — hover to focus without clicking.
- Edit bindings in [../skhd/skhdrc](../skhd/skhdrc); reload with
  `skhd --reload`. Reload yabai with `yabai --restart-service`.
