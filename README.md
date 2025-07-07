# Dune Buggy Seat Toggle (AHK v2)

Tiny AutoHotkey v2 script that swaps between the **turret** and **driver** seats in *Dune: Awakening* with one hotkey  
(**default Ctrl + F**).

| Feature | Default value |
|---------|---------------|
| Hold time for **F** | `1000` ms (see `holdDuration`) |
| Mouse offset | Right `200 px` / Up `200 px` |
| Hotkey | `^f` (see `userHotkey`) |
| Game-window lock | `ahk_class UnrealWindow`<br>`ahk_exe DuneSandbox-Win64-Shipping.exe` |

Outside the game the hotkey is passed through unchanged and a 3 s tooltip appears at the cursor.

---

## Usage

1. **Get the script** – any of these works:  
   * Clone the repo  
     ```bash
     git clone https://github.com/dragnmastr85/Dune-Awakening-Buggy-Seat-Toggle.git
     ```  
   * Or download [**Dune Buggy Toggle.ahk**](https://github.com/dragnmastr85/Dune-Awakening-Buggy-Seat-Toggle/blob/main/dune%20buggy%20toggle.ahk?raw=true) (direct download).  
   * Or grab the compiled [**Dune Buggy Toggle.exe**](https://github.com/dragnmastr85/Dune-Awakening-Buggy-Seat-Toggle/raw/main/dune%20buggy%20toggle.exe).

2. **Best practice** – install [AutoHotkey v2](https://www.autohotkey.com) and run  
   the plain `.ahk` yourself. Reading the script is the safest way to know  
   what it does. The compiled `.exe` here is clean, but you should always be  
   cautious about running unknown executables.

3. *(Optional)* tweak the **User Settings** block at the top of the script to  
   change the hotkey or hold duration.

4. Double-click the `.ahk` (or the `.exe` if you insist). An **“H” icon** appears in
   the Windows system tray – that shows the script is running.

5. **When you’re done** – right-click that tray icon and choose **Exit** to close the
   script. Best practice is not to leave automation scripts running
   unnecessarily.

---

## License

MIT – free to use, modify, and share; just keep the header credit intact.
