# Dune Buggy Seat Toggle (AHK v2)

Tiny AutoHotkey v2 script that:

* **Ctrl + F** – toggles between **turret** (move cursor → right) and **driver** (move cursor ↑ up) seats.
* **Ctrl + D** – jumps the cursor to the buggy **inventory** wedge.

Outside the game the hotkeys are passed through unchanged and a 3 s tooltip appears at the cursor.

| Variables               | Default value\*                                                     |
| ----------------------- | ------------------------------------------------------------------- |
| Hold time for **F**     | `600` ms (`holdDuration`)                                           |
| Turret / driver offsets | Right `500 px` • Up `500 px`                                        |
| Inventory offset        | `-500 px , -100 px`                                                 |
| Hotkeys                 | `^f`  (`userHotkey`) • `^d` (`userHotkeyInv`)                       |
| Game-window lock        | `ahk_class UnrealWindow` / `ahk_exe DuneSandbox-Win64-Shipping.exe` |

\*Those offsets line up on my display; tweak only if your wheel highlight lands off-target.

---

## Usage

1. **Get the script** – pick one:

   * **Clone**

     ```bash
     git clone https://github.com/dragnmastr85/Dune-Awakening-Buggy-Seat-Toggle.git
     ```
   * **Download** → [Dune Buggy Toggle.ahk](https://github.com/dragnmastr85/Dune-Awakening-Buggy-Seat-Toggle/blob/main/dune%20buggy%20toggle.ahk?raw=true)
   * **Download EXE** → [Dune Buggy Toggle.exe](https://github.com/dragnmastr85/Dune-Awakening-Buggy-Seat-Toggle/raw/main/dune%20buggy%20toggle.exe)

2. **Best practice** – install [AutoHotkey v2](https://www.autohotkey.com) and run the `.ahk`. Reading the script is the safest way to know  
   what it does. The compiled .exe here is clean, but you should always be cautious about running unknown executables.

3. *(Optional)* open the script and tweak anything in the **USER SETTINGS** block.

4. Double-click the `.ahk` (or the `.exe` if you insist). An **“H” icon** appears in the Windows system tray—script is running.

5. **Exit** – right-click that tray icon ➜ **Exit**. Don’t leave automation scripts running longer than needed.

---

## License

MIT – free to use, modify, and share; keep the header credit intact.
