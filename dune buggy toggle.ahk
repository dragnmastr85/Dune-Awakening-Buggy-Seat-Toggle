#Requires AutoHotkey v2.0
#SingleInstance Force
#Warn

; AutoHotkey Script: Buggy Seat Toggle – Dune: Awakening
; Author: dragnmastr85 (Adam)

; Simulates holding “F” and mouse move to swap between turret and driver seats.
; Runs only in the Dune window; everywhere else it passes the hotkey through
; and shows a 3-second tooltip at the cursor.

; Version: 1.1  ·  2025-07-07  ·  Requires AutoHotkey v2


; USER SETTINGS

userHotkey    := "^f"                 ; ^ = Ctrl, ! = Alt, + = Shift, # = Win

holdDuration  := 1000                 ; milliseconds to hold the “F” key

; Don't change below this line

toggle := false                       ; turret ↔ driver tracker

; HOTKEYS
HotIfWinActive "ahk_class UnrealWindow ahk_exe DuneSandbox-Win64-Shipping.exe"
Hotkey userHotkey, InGame             ; runs only when game window focused

HotIfWinNotActive "ahk_class UnrealWindow ahk_exe DuneSandbox-Win64-Shipping.exe"
Hotkey userHotkey, PassThrough        ; runs everywhere else
HotIf                                 ; clear context

; HANDLERS
InGame(*) {
    global toggle, holdDuration

    BlockInput "MouseMove"            ; lock out real-world mouse motion
    try {
        Send "{f down}"
        Sleep holdDuration

        if toggle
            MouseMove 0, -200, 0, "R" ; up → driver seat
        else
            MouseMove 200, 0, 0, "R"  ; right → turret seat

        Send "{f up}"
    }
    finally {
        BlockInput "MouseMoveOff"     ; ALWAYS re-enable, even on error
    }
    toggle := !toggle
}

PassThrough(*) {
    global userHotkey

    Send "{Blind}" userHotkey         ; re-send the hotkey string

    MouseGetPos &x, &y
    Tooltip "Script active – hotkey passed through.", x, y
    SetTimer () => Tooltip(), -3000   ; hide after 3 s
}
