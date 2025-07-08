#Requires AutoHotkey v2.0
#SingleInstance Force
#Warn
; #RequireAdmin   ; ← uncomment if you really need BlockInput to fully freeze the mouse

; AutoHotkey Script: Buggy Seat Toggle – Dune: Awakening
; Author: dragnmastr85 (Adam)
;
; • Ctrl + F holds “F” and moves the cursor right → turret seat  
;   next press moves it up → driver seat (toggles each time).  
; • Ctrl + D holds “F” and moves the cursor up-left onto the three-box
;   “inventory” wedge.  
; • A solo tap of Ctrl still crouches (requires crouch to be bound to **Right-Ctrl**
;   in game; the script listens to **Left-Ctrl** by default).  
; • Holding F longer than `holdDuration` is fine—the script always waits for that
;   sleep to finish.  
; • Offsets below work on my 1080 p / default-UI setup, but are exposed if you ever
;   need to tweak them (you probably won’t).
;
; Version 3.4 · 2025-07-07 · Requires AutoHotkey v2



; USER SETTINGS -----------------------------------------------------------------
userHotkey      := "^f"          ; seat-toggle  (uses Left-Ctrl + F)
userHotkeyInv   := "^d"          ; inventory    (uses Left-Ctrl + D)

holdDuration    :=  600          ; ms to hold “F”   – 600-800 ms works for most PCs
settleDelay     :=   60          ; ms cursor sits on wedge – increase if wheel mis-registers

; Seat-toggle offsets (pixels, relative to wheel centre)
; ── turret (right)         driver (up)
turretX :=  500   , turretY :=   0
driverX :=    0   , driverY := -500

; Inventory offsets
invX := -500                   ; left  = negative
invY := -100                   ; up    = negative



; INITIALISE ---------------------------------------------------------------------
toggle    := false             ; false → next move = turret, true → driver
targetWin := "ahk_class UnrealWindow ahk_exe DuneSandbox-Win64-Shipping.exe"



; HOTKEYS ------------------------------------------------------------------------
SetupHotkeys() {
    global userHotkey, userHotkeyInv, targetWin
    HotIfWinActive targetWin
    Hotkey userHotkey,    InGame_Toggle
    Hotkey userHotkeyInv, InGame_Inv

    HotIfWinNotActive targetWin
    Hotkey userHotkey,    PassHotkey_Toggle
    Hotkey userHotkeyInv, PassHotkey_Inv
    HotIf
}
SetupHotkeys()



; HANDLERS -----------------------------------------------------------------------
InGame_Toggle(*) {                     ; swap turret ↔ driver
    global toggle, holdDuration, settleDelay
    global turretX, turretY, driverX, driverY
    BlockInput "MouseMove"            ; prevents accidental real-mouse nudge
    try {
        Send "{f down}"
        Sleep holdDuration
        if toggle
            MouseMove driverX, driverY, 0, "R"   ; up → driver seat
        else
            MouseMove turretX, turretY, 0, "R"   ; right → turret seat
        Sleep settleDelay
        Send "{f up}"
    }
    finally BlockInput "MouseMoveOff"
    toggle := !toggle                 ; alternate next time
}

InGame_Inv(*) {                        ; quick-open buggy inventory
    global holdDuration, settleDelay, invX, invY
    BlockInput "MouseMove"            ; prevents accidental real-mouse nudge
    try {
        Send "{f down}"
        Sleep holdDuration
        MouseMove invX, invY, 0, "R"
        Sleep settleDelay
        Send "{f up}"
    }
    finally BlockInput "MouseMoveOff"
}



; PASS-THROUGH HELPERS -----------------------------------------------------------
PassHotkey_Common(hk) {
    Send "{Blind}" hk
    MouseGetPos &x, &y
    Tooltip "Script active – hotkey passed through.", x, y
    SetTimer () => Tooltip(), -3000
}

PassHotkey_Toggle(*) => PassHotkey_Common("^f")
PassHotkey_Inv(*)    => PassHotkey_Common("^d")
