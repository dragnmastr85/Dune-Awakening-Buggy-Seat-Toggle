#Requires AutoHotkey v2.0
#SingleInstance Force
#Warn
; #RequireAdmin   ; ← uncomment if you really need BlockInput to freeze the mouse

; AutoHotkey Script: Buggy Seat Toggle – Dune: Awakening
; Author: dragnmastr85 (Adam)
; 
; Hotkey simulates holding “F” and mouse move to swap between turret and driver seats
; (first press → turret / right, second press → driver / up).
; Second hotkey moves the cursor to the buggy-inventory wedge instead.
; Outside the game the hotkeys pass through and show a 3-second tooltip.
; The X/Y offsets below already line up on my setup, but they’re exposed as
; user variables if you ever need to tweak them (you probably won’t).
; 
; Version: 2.0 · 2025-07-07 · Requires AutoHotkey v2


; USER VARIABLES
userHotkey      := "^f"    ; seat-toggle              (default Ctrl + F)
userHotkeyInv   := "^d"    ; inventory                (default Ctrl + D)

holdDuration    :=  600    ; ms to hold “F”           (600-800 ms works for most)
settleDelay     :=   60    ; ms cursor sits on wedge  (60-100 ms works for most)

; Seat-toggle offsets (pixels, relative to wheel center)
turretX :=  500   
turretY :=    0
driverX :=    0  
driverY := -500

; Inventory offsets
invX := -500
invY := -100
; Do not edit below this line


; INITIALIZE
toggle    := false         ; false → next move = turret, true → driver
targetWin := "ahk_class UnrealWindow ahk_exe DuneSandbox-Win64-Shipping.exe"

; HOTKEYS
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

; HANDLERS
InGame_Toggle(*) {         ; swap turret ↔ driver
    global toggle, holdDuration, settleDelay
    global turretX, turretY, driverX, driverY
    BlockInput "MouseMove" ; prevents accidental real-mouse nudge
    try {
        Send "{f down}"
        Sleep holdDuration
        if toggle
            MouseMove driverX, driverY, 0, "R" 
        else
            MouseMove turretX, turretY, 0, "R" 
        Sleep settleDelay
        Send "{f up}"
    }
    finally BlockInput "MouseMoveOff"
    toggle := !toggle      ; alternate next time
}

InGame_Inv(*) {            ; quick-open buggy inventory
    global holdDuration, settleDelay, invX, invY
    BlockInput "MouseMove" ; prevents accidental real-mouse nudge
    try {
        Send "{f down}"
        Sleep holdDuration
        MouseMove invX, invY, 0, "R"
        Sleep settleDelay
        Send "{f up}"
    }
    finally BlockInput "MouseMoveOff"
}

; PASS-THROUGH HELPERS
PassHotkey_Common(hk) {
    Send "{Blind}" hk
    MouseGetPos &x, &y
    Tooltip "Script active – hotkey passed through.", x, y
    SetTimer () => Tooltip(), -3000
}

PassHotkey_Toggle(*) => PassHotkey_Common("^f")
PassHotkey_Inv(*)    => PassHotkey_Common("^d")
