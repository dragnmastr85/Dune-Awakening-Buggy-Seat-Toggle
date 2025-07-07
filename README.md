# Dune Buggy Seat Toggle (AHK v2)

Small AutoHotkey v2 script that lets you swap between the turret and driver
seats in *Dune: Awakening* with a single hotkey **(default Ctrl + F)**.

| Feature | Default |
|---------|---------|
| Hold time for **F** | 1000 ms (change `holdDuration`) |
| Mouse move offsets | Right 200 px / Up 200 px |
| Hotkey            | `^f` (change `userHotkey`) |
| Game window lock  | `ahk_class UnrealWindow` / `ahk_exe DuneSandbox-Win64-Shipping.exe` |

Outside the game the hotkey is passed through and a 3-second tooltip shows  
that the script is active.

## Usage
1. Install [AutoHotkey v2](https://autohotkey.com).
2. Clone this repo or download `DuneSeatToggle.ahk`.
3. Edit the **User Settings** block if you want a different hotkey/hold time.
4. Double-click the script (or compile to `.exe` via `Ahk2Exe`).

## License
MIT – do what you like, just keep the header credit intact.

