# Dune Buggy Seat Toggle (AHK v2)

Small AutoHotkey v2 script that lets you swap between the **turret** and
**driver** seats in *Dune: Awakening* with one hotkey  
(**default&nbsp;Ctrl + F**).

| Feature | Default value |
|---------|---------------|
| Hold time for **F** | `1000` ms (see `holdDuration`) |
| Mouse offset | Right `200 px` / Up `200 px` |
| Hotkey | `^f` (see `userHotkey`) |
| Game-window lock | `ahk_class UnrealWindow`<br>`ahk_exe DuneSandbox-Win64-Shipping.exe` |

Outside the game, the hotkey is passed through unchanged and a 3-second
tooltip appears at the cursor.

---

## Usage

1. **Get the script** – any of these works:  
   * Clone the repo: `git clone https://github.com/yourname/dune-buggy-seat-toggle.git`  
   * Or download **DuneSeatToggle.ahk** from the repo.  
   * Or grab the compiled **DuneSeatToggle.exe** from the *Releases* tab.

2. **Best practice** – install [AutoHotkey v2](https://www.autohotkey.com) and run
   the plain `.ahk` yourself. Reading the script is the safest way to know
   what it does. While the bundled `.exe` here is clean, you should always be
   cautious about running unknown executables.

3. (Optional) tweak the **User Settings** block at the top of the script to
   change the hotkey or hold duration.

4. Double-click the `.ahk` (or the `.exe` if you insist) and look for the “H”
   tray icon. Press your hotkey in-game to toggle seats.

---

## License

MIT – free to use, modify, and share; just keep the header credit intact.
