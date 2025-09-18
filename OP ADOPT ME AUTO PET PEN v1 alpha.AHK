#NoEnv
#Persistent
SendMode Input
SetWorkingDir %A_ScriptDir%
#SingleInstance Force
FeedbackWebhookURL := "https://discord.com/api/webhooks/1416391483627540624/mRPTSwaEDISGhArtkVc9bz3wupLVXdqjtfCYLHgJHwssdzeMke_vNF2aSxkXEHAeEXVt"  ; Feedback webhook

; ========================
; Fixed Settings
; ========================
D_Hold := 1350
W_Hold := 3000
S_Hold := 750
S_Hold1 := 2250
ClickHold := 10
PreClickDelay := 1000
PreSDelay := 1000
PostSDelay := 1000
MouseX := 955
MouseY := 764
MouseX1 := 975
MouseY1 := 951
MouseX2 := 1161
MouseY2 := 762
MouseX3 := 1190
MouseY3 := 845
MouseX4 := 962
MouseY4 := 469
MouseX5 := 1485
MouseY5 := 329
RobloxWinTitle := "Roblox"

; ========================
; Variables
; ========================
Running := false
SPressed := false
SelectedRarity := "Common"

; ========================
; Create the GUI with Tabs
; ========================
Gui, +AlwaysOnTop +Resize +MinimizeBox
Gui, Font, s10 Bold, Segoe UI

; Tab control
Gui, Add, Tab2, vMainTab w900 h1000, Settings|Statistics|Leaderboard|Misc|Instructions

; =========================
; SETTINGS TAB
; =========================
Gui, Tab, Settings
Gui, Font, s10 Bold, Segoe UI
Gui, Add, Text, x30 y30, Select Rarity
Gui, Font, s9 Norm

; Display selected rarity
Gui, Add, Text, vRarityLabel x50 y60 w300 h30, Selected: %SelectedRarity%

; --- Type Selection ---
Gui, Add, Text, x30 y200, Select Type
Gui, Add, Button, gSelectEgg x50 y230 w100 h30, Egg
Gui, Add, Button, gSelectPet x160 y230 w100 h30, Pet
Gui, Add, Button, gSelectNeon x270 y230 w100 h30, Neon
Gui, Add, Text, vTypeLabel x50 y270 w300 h30, Selected: Egg

; Buttons for rarities
Gui, Add, Button, gSelectCommon x50 y100 w100 h30, Common
Gui, Add, Button, gSelectUncommon x160 y100 w100 h30, Uncommon
Gui, Add, Button, gSelectRare x270 y100 w100 h30, Rare
Gui, Add, Button, gSelectUltraRare x380 y100 w100 h30, UltraRare
Gui, Add, Button, gSelectLegendary x490 y100 w100 h30, Legendary

; Settings
Gui, Add, Checkbox, vHasPetInPen x50 y320 w300 h30, Already have a pet in the pen that isn't maxed/max aged?

; Instruction label
Gui, Add, Text, x50 y150 w400 h20, Select the right one for the correct calculations.

; =========================
; INSTRUCTIONS TAB
; =========================
Gui, Tab, Instructions
Gui, Font, s10 Bold, Segoe UI
Gui, Font, s9 Norm

InstructionsText =
(
Select the correct rarity of the pet or egg for the best timing for the macro to work.

Selected types like eggs have a different set amount of time in the pen from pets or neons. Neons take more time than regular pets too.

Common pets take 7 hours and neons take around 28 hours and eggs take 30 minutes.
Uncommon pets take 8.75 hours and neons take around 35 hours and eggs take ??? minutes.
Rare pets take 18.75 hours and neons take around 225 hours and eggs take 37.5 minutes.
UltraRare pets take 22.25 hours and neons take around 273.137 hours and eggs take 30 minutes.
Legendary pets take 23.625 hours and neons take around 288.072 hours and eggs take 45 minutes.

If you already have a pet inside your pet pen that isn't fully grown, you should enable this feature to ensure you actually get anything from this. Make sure you favorite the pets you want to use and make sure they are all newborn for it to work.

For the macro to work, you need to not move or touch anything as soon as you join. If you do, the macro will break!
)

Gui, Add, Edit, x20 y20 w800 h1100 ReadOnly +VScroll, %InstructionsText%

; =========================
; STATISICS TAB
; =========================
Gui, Tab, Statistics
Gui, Add, Text, vStatisticsDisplay x20 y20 w500 h500, Loading stats...

; =========================
; MISC TAB
; =========================
Gui, Tab, Misc
Gui, Font, s10 Bold, Segoe UI
Gui, Font, s9 Norm

; --- Credits ---
Gui, Add, Text, x20 y30 w850, Credits:
Gui, Add, Text, x40 y50 w850, Script created with assistance by ChatGPT, Stellar, and Tylah.

; --- Donations / Communities ---
Gui, Add, Text, x20 y90 w850, Donations/Communities:
Gui, Add, Text, x40 y110 w850, If you would like to support development, consider donating or joining:
Gui, Add, Text, x60 y130 w850, PayPal: Coming Soon
Gui, Add, Text, x60 y150 w850, Discord: https://discord.gg/W7t4ymBNYQ
Gui, Add, Text, x60 y170 w850, Roblox Group: Coming Soon

; --- Disclaimers & Script Info ---
Gui, Add, Text, x20 y200 w850, Disclaimers and Script Info:
Gui, Add, Text, x40 y220 w850, This script is provided as-is, without warranty. Use responsibly.
Gui, Add, Text, x40 y240 w850, It automates message sending in Roblox (offline or personal use), tracks session stats, and
Gui, Add, Text, x40 y260 w850, optionally encourages donations. It does not access sensitive account data or passwords.

; --- Benefits of Support ---
Gui, Add, Text, x20 y300 w850, What we gain from donations/support: 
Gui, Add, Text, x40 y320 w850, - Feedback and support to improve the script
Gui, Add, Text, x40 y340 w850, - Motivation to maintain and enhance features
Gui, Add, Text, x40 y360 w850, - Small contributions to cover development time

; --- Responsible Use ---
Gui, Add, Text, x20 y400 w850, Responsible Use:
Gui, Add, Text, x40 y420 w850, Please use the script responsibly and do not harass others or violate platform rules.

; --- Feedback Instructions ---
Gui, Add, Text, x20 y460 w850, Feedback Instructions:
Gui, Add, Text, x40 y480 w850, - Open Notepad or txt file and type messages, feedback, or issues one per line.
Gui, Add, Text, x40 y500 w850, - Feedback helps prioritize updates and fixes.
Gui, Add, Text, x40 y520 w850, - You can share feedback via Discord or optional form provided.

; --- Feedback Form ---
Gui, Add, Text, x20 y560 w850 cRed, Note: Feedback cannot include quotes ("), backslashes (\), control characters, null characters, or emojis.
Gui, Add, Text, x20 y580 w850, Submit Feedback:
Gui, Add, Edit, vFeedbackInput w600 h75
Gui, Add, Button, gSendFeedback x640 y615 w120 h45, Send
Gui, Add, Text, vFeedbackStatus x20 y670 w800, Status: Waiting for feedback...


; --- Finish Tabs ---
Gui, Tab  ; Return to main GUI context

; --- Show GUI ---
Gui, Show, x100 y100 w900 h1250, AdoptMe Macro
return

; ========================
; Button Labels
; ========================
SelectEgg:
    SelectedType := "Egg"
    GuiControl,, TypeLabel, Selected: %SelectedType%
return

SelectPet:
    SelectedType := "Pet"
    GuiControl,, TypeLabel, Selected: %SelectedType%
return

SelectNeon:
    SelectedType := "Neon"
    GuiControl,, TypeLabel, Selected: %SelectedType%
return

SelectCommon:
    SelectedRarity := "Common"
    GuiControl,, RarityLabel, Selected: %SelectedRarity%
return

SelectUncommon:
    SelectedRarity := "Uncommon"
    GuiControl,, RarityLabel, Selected: %SelectedRarity%
return

SelectRare:
    SelectedRarity := "Rare"
    GuiControl,, RarityLabel, Selected: %SelectedRarity%
return

SelectUltraRare:
    SelectedRarity := "UltraRare"
    GuiControl,, RarityLabel, Selected: %SelectedRarity%
return

SelectLegendary:
    SelectedRarity := "Legendary"
    GuiControl,, RarityLabel, Selected: %SelectedRarity%
return


StartLoop:
    Gui, Submit, NoHide
    if (Running)
    {
        MsgBox, Automation is already running!
        return
    }
    Running := true
    SPressed := false
    StatusLabelText := "Status: Running"
    GuiControl,, StatusLabel, %StatusLabelText%
    SetTimer, SequenceLoop, 10
return

StopLoop:
    Running := false
    StatusLabelText := "Status: Stopped"
    GuiControl,, StatusLabel, %StatusLabelText%
return

ExitScript:
    ExitApp
return

; =========================
; Hotkeys
; =========================
F6::  ; Start automation via hotkey
    GoSub, StartLoop
return

; declare this at the top of your script, outside any hotkeys
LastPress := 0

F7::  ; Stop automation or exit if pressed twice
    global Running, LastPress
    if (A_TickCount - LastPress < 2000)  ; pressed again within 2 seconds
    {
        ExitApp  ; exit if double pressed
    }

    LastPress := A_TickCount  ; update timestamp

    ; First press just stops the loop
    Running := false
    SetTimer, SequenceLoop, Off
    GuiControl,, StatusLabel, Status: Stopped
return

F10::  ; Copy mouse position
F9::   ; Added F9 hotkey also
    MouseGetPos, MouseX, MouseY
    Clipboard := MouseX "," MouseY
    ToolTip, Mouse Position Copied:`nX: %MouseX% Y: %MouseY%
    SetTimer, RemoveToolTip, -1500
return

RemoveToolTip:
    ToolTip
return
; ========================
; Stats Variables
; ========================
StatsFile := A_ScriptDir "\AdoptMeMacroStats.dat"
Stats := {Runs:0, SuccessfulClicks:0, FailedActions:0}
XORKey := 135 ; Simple XOR key for encryption

; ========================
; Load Stats on startup
; ========================
if FileExist(StatsFile)
{
    FileRead, EncryptedData, %StatsFile%
    Decrypted := XORString(EncryptedData, XORKey)
    try
    {
        Stats := StrReplace(Decrypted, "`r`n", "")  ; clean line breaks
        Stats := JSON_Load(Stats)
    }
    catch
    {
        MsgBox, Failed to load stats, starting fresh.
        Stats := {Runs:0, SuccessfulClicks:0, FailedActions:0}
    }
}
UpdateStatsDisplay()

SmoothMove(x, y, step := 20, delay := 5) {
    MouseGetPos, curX, curY
    dx := (x - curX) / step
    dy := (y - curY) / step
    Loop, %step% {
        curX += dx
        curY += dy
        MouseMove, %curX%, %curY%, 0
        Sleep, %delay%
    }
}

EnsureRobloxActive() {
    global RobloxWinTitle
    IfWinExist, %RobloxWinTitle%
    {
        WinActivate
        WinWaitActive, %RobloxWinTitle%,, 2
    }
}

SequenceLoop:
; Make sure TotalLoops is defined
if !TotalLoops
    TotalLoops := 1  ; default to 1 if not set

    global TotalLoops
    Loop, %TotalLoops%
    {
        ; clicks...
    }
    if (!Running) {
        SetTimer, SequenceLoop, Off
        return
    }

    ; Bring Roblox to front
    IfWinExist, %RobloxWinTitle%
    {
        WinActivate
        WinWaitActive, %RobloxWinTitle%
        SleepInterruptible(250)
    }
    else
    {
        Stats.FailedActions++
        SaveStats()
        Running := false
        GuiControl,, StatusLabel, Status: Stopped
        SetTimer, SequenceLoop, Off
    }

    ; ===== START CUSTOM SEQUENCE =====
    SleepInterruptible(5000)  ; Wait 2.5 seconds before starting

; 1) Move mouse and click (gradual movement)
SmoothMove(500, 500)
Click down
SleepInterruptible(ClickHold)
Click up

SleepInterruptible(250)
EnsureRobloxActive()
SmoothMove(MouseX, MouseY)
SleepInterruptible(250)
Click down
SleepInterruptible(ClickHold)
Click up

SleepInterruptible(250)
EnsureRobloxActive()
SmoothMove(MouseX, MouseY)
SleepInterruptible(250)
Click down
SleepInterruptible(ClickHold)
Click up

SleepInterruptible(250)
EnsureRobloxActive()
SmoothMove(MouseX, MouseY)
SleepInterruptible(250)
Click down
SleepInterruptible(ClickHold)
Click up

SleepInterruptible(250)
EnsureRobloxActive()
SmoothMove(973,946)
SleepInterruptible(250)
Click down
SleepInterruptible(ClickHold)
Click up

SleepInterruptible(250)
EnsureRobloxActive()
SmoothMove(973,946)
SleepInterruptible(250)
Click down
SleepInterruptible(ClickHold)
Click up

SleepInterruptible(250)
EnsureRobloxActive()
SmoothMove(973,946)
SleepInterruptible(250)
Click down
SleepInterruptible(ClickHold)
Click up

SleepInterruptible(500)
SmoothMove(500, 500)
Click down
SleepInterruptible(ClickHold)
Click up

SleepInterruptible(500)
EnsureRobloxActive()
SmoothMove(962,483)
SleepInterruptible(500)
Click down
SleepInterruptible(ClickHold)
Click up
SleepInterruptible(500)

EnsureRobloxActive()
SmoothMove(962,483)
SleepInterruptible(500)
Click down
SleepInterruptible(ClickHold)
Click up

SleepInterruptible(500)
EnsureRobloxActive()
SmoothMove(962,483)
SleepInterruptible(500)
Click down
SleepInterruptible(ClickHold)
Click up

SleepInterruptible(500)
EnsureRobloxActive()
SmoothMove(966,468)
SleepInterruptible(500)
Click down
SleepInterruptible(ClickHold)
Click up
SleepInterruptible(500)

EnsureRobloxActive()
SmoothMove(966,468)
SleepInterruptible(500)
Click down
SleepInterruptible(ClickHold)
Click up

SleepInterruptible(500)
EnsureRobloxActive()
SmoothMove(966,468)
SleepInterruptible(500)
Click down
SleepInterruptible(ClickHold)
Click up

SleepInterruptible(250)
EnsureRobloxActive()
SmoothMove(1026,531)
SleepInterruptible(250)
Click down
SleepInterruptible(ClickHold)
Click up

SleepInterruptible(250)
EnsureRobloxActive()
SmoothMove(1026,531)
SleepInterruptible(250)
Click down
SleepInterruptible(ClickHold)
Click up

SleepInterruptible(250)
EnsureRobloxActive()
SmoothMove(1026,531)
SleepInterruptible(250)
Click down
SleepInterruptible(ClickHold)
Click up

SleepInterruptible(250)
EnsureRobloxActive()
SmoothMove(1050,700)
SleepInterruptible(250)
Click down
SleepInterruptible(ClickHold)
Click up

SleepInterruptible(250)
EnsureRobloxActive()
SmoothMove(1050,700)
SleepInterruptible(250)
Click down
SleepInterruptible(ClickHold)
Click up

SleepInterruptible(250)
EnsureRobloxActive()
SmoothMove(1050,700)
SleepInterruptible(250)
Click down
SleepInterruptible(ClickHold)
Click up

SleepInterruptible(250)
EnsureRobloxActive()
SmoothMove(836,605)
SleepInterruptible(250)
Click down
SleepInterruptible(ClickHold)
Click up

SleepInterruptible(250)
EnsureRobloxActive()
SmoothMove(836,605)
SleepInterruptible(250)
Click down
SleepInterruptible(ClickHold)
Click up

; ==============================
; Rarity-specific click sequence
; ==============================
if (SelectedRarity = "Common") {
    ; --- Common sequence ---
SleepInterruptible(250)
EnsureRobloxActive()
SmoothMove(932,714)
SleepInterruptible(250)
Click down
SleepInterruptible(ClickHold)
Click up

SleepInterruptible(250)
EnsureRobloxActive()
SmoothMove(1044,715)
SleepInterruptible(250)
Click down
SleepInterruptible(ClickHold)
Click up

SleepInterruptible(250)
EnsureRobloxActive()
SmoothMove(825,749)
SleepInterruptible(250)
Click down
SleepInterruptible(ClickHold)
Click up

SleepInterruptible(250)
EnsureRobloxActive()
SmoothMove(932,752)
SleepInterruptible(250)
Click down
SleepInterruptible(ClickHold)
Click up
}
else if (SelectedRarity = "Uncommon") {
    ; --- Uncommon sequence (placeholder) ---
SleepInterruptible(250)
EnsureRobloxActive()
SmoothMove(830,715)
SleepInterruptible(250)
Click down
SleepInterruptible(ClickHold)
Click up

SleepInterruptible(250)
EnsureRobloxActive()
SmoothMove(1044,715)
SleepInterruptible(250)
Click down
SleepInterruptible(ClickHold)
Click up

SleepInterruptible(250)
EnsureRobloxActive()
SmoothMove(825,749)
SleepInterruptible(250)
Click down
SleepInterruptible(ClickHold)
Click up

SleepInterruptible(250)
EnsureRobloxActive()
SmoothMove(932,752)
SleepInterruptible(250)
Click down
SleepInterruptible(ClickHold)
Click up
}
else if (SelectedRarity = "Rare") {
    ; --- Rare sequence (placeholder) ---
SleepInterruptible(250)
EnsureRobloxActive()
SmoothMove(830,715)
SleepInterruptible(250)
Click down
SleepInterruptible(ClickHold)
Click up

SleepInterruptible(250)
EnsureRobloxActive()
SmoothMove(932,714)
SleepInterruptible(250)
Click down
SleepInterruptible(ClickHold)
Click up

SleepInterruptible(250)
EnsureRobloxActive()
SmoothMove(825,749)
SleepInterruptible(250)
Click down
SleepInterruptible(ClickHold)
Click up

SleepInterruptible(250)
EnsureRobloxActive()
SmoothMove(932,752)
SleepInterruptible(250)
Click down
SleepInterruptible(ClickHold)
Click up
}
else if (SelectedRarity = "UltraRare") {
    ; --- UltraRare sequence (placeholder) ---
SleepInterruptible(250)
EnsureRobloxActive()
SmoothMove(830,715)
SleepInterruptible(250)
Click down
SleepInterruptible(ClickHold)
Click up

SleepInterruptible(250)
EnsureRobloxActive()
SmoothMove(932,714)
SleepInterruptible(250)
Click down
SleepInterruptible(ClickHold)
Click up

SleepInterruptible(250)
EnsureRobloxActive()
SmoothMove(1044,715)
SleepInterruptible(250)
Click down
SleepInterruptible(ClickHold)
Click up

SleepInterruptible(250)
EnsureRobloxActive()
SmoothMove(932,752)
SleepInterruptible(250)
Click down
SleepInterruptible(ClickHold)
Click up
}
else if (SelectedRarity = "Legendary") {
    ; --- Legendary sequence (placeholder) ---
SleepInterruptible(250)
EnsureRobloxActive()
SmoothMove(830,715)
SleepInterruptible(250)
Click down
SleepInterruptible(ClickHold)
Click up

SleepInterruptible(250)
EnsureRobloxActive()
SmoothMove(932,714)
SleepInterruptible(250)
Click down
SleepInterruptible(ClickHold)
Click up

SleepInterruptible(250)
EnsureRobloxActive()
SmoothMove(1044,715)
SleepInterruptible(250)
Click down
SleepInterruptible(ClickHold)
Click up

SleepInterruptible(250)
EnsureRobloxActive()
SmoothMove(825,749)
SleepInterruptible(250)
Click down
SleepInterruptible(ClickHold)
Click up
}

SleepInterruptible(250)
EnsureRobloxActive()
SmoothMove(1064,814)
SleepInterruptible(250)
Click down
SleepInterruptible(ClickHold)
Click up

SleepInterruptible(250)
EnsureRobloxActive()
SmoothMove(1064,814)
SleepInterruptible(250)
Click down
SleepInterruptible(ClickHold)
Click up

SleepInterruptible(250)
EnsureRobloxActive()
SmoothMove(1064,814)
SleepInterruptible(250)
Click down
SleepInterruptible(ClickHold)
Click up

SleepInterruptible(250)
EnsureRobloxActive()
SmoothMove(979,942)
SleepInterruptible(250)
Click down
SleepInterruptible(ClickHold)
Click up

SleepInterruptible(250)
EnsureRobloxActive()
SmoothMove(979,942)
SleepInterruptible(250)
Click down
SleepInterruptible(ClickHold)
Click up

SleepInterruptible(250)
EnsureRobloxActive()
SmoothMove(979,942)
SleepInterruptible(250)
Click down
SleepInterruptible(ClickHold)
Click up

SleepInterruptible(5000)
EnsureRobloxActive()

    ; --- Hold D ---
    SleepInterruptible(250)
    SendInput, {d down}
    SleepInterruptible(D_Hold)
    SendInput, {d up}

    ; --- Hold W after D ---
    SleepInterruptible(250)
    SleepInterruptible(PreClickDelay)
    SendInput, {w down}
    SleepInterruptible(W_Hold)
    SendInput, {w up}
    SleepInterruptible(250)

; --- Hold S after W ---
if (HasPetInPen) {
SleepInterruptible(250)
SleepInterruptible(PreClickDelay)
EnsureRobloxActive()
SmoothMove(967,963)
SleepInterruptible(250)
Click down
SleepInterruptible(ClickHold)
Click up
} else {
SmoothMove(500, 500)
}

SleepInterruptible(PreClickDelay)
if (HasPetInPen) {
    SendInput, {s down}
    SleepInterruptible(S_Hold)   ; normal hold
    SendInput, {s up}
} else {
    SendInput, {s down}
    SleepInterruptible(S_Hold1)    ; longer hold
    SendInput, {s up}
}

SleepInterruptible(250)

    SleepInterruptible(250)
    EnsureRobloxActive()
    SmoothMove(1199,1001)
    SleepInterruptible(250)
    Click down
    SleepInterruptible(ClickHold)
    Click up

    SleepInterruptible(250)
    EnsureRobloxActive()
    SendInput, {e down}
    SleepInterruptible(10)
    SendInput, {e up}

    SleepInterruptible(250)
    EnsureRobloxActive()
    SmoothMove(500, 500)
    SleepInterruptible(250)
    Click down
    SleepInterruptible(ClickHold)
    Click up

; ===== Custom 8-click sequence with alternating offset =====
Loop, %TotalLoops%
{
    offsetX := (A_Index - 1) * 91  ; increment X per loop
    offsetY := (A_Index - 1) * 91  ; increment Y per loop

        ; 1) Fixed
        SleepInterruptible(500)
        SmoothMove(930,395)
        SleepInterruptible(500)
        Click down
        SleepInterruptible(ClickHold)
        Click up

        ; 1) Fixed
        SleepInterruptible(500)
        SmoothMove(1036,661)
        SleepInterruptible(500)
        Click down
        SleepInterruptible(ClickHold)
        Click up

        ; 1) Fixed
        SleepInterruptible(500)
        SmoothMove(930,397)
        SleepInterruptible(500)
        Click down
        SleepInterruptible(ClickHold)
        Click up


        ; 1) Fixed
        SleepInterruptible(500)
        SmoothMove(1036,661)
        SleepInterruptible(500)
        Click down
        SleepInterruptible(ClickHold)
        Click up


        ; 1) Fixed
        SleepInterruptible(500)
        SmoothMove(930,395)
        SleepInterruptible(500)
        Click down
        SleepInterruptible(ClickHold)
        Click up

        ; 1) Fixed
        SleepInterruptible(500)
        SmoothMove(1036,661)
        SleepInterruptible(500)
        Click down
        SleepInterruptible(ClickHold)
        Click up

        ; 1) Fixed
        SleepInterruptible(500)
        SmoothMove(930,397)
        SleepInterruptible(500)
        Click down
        SleepInterruptible(ClickHold)
        Click up

        ; 1) Fixed
        SleepInterruptible(500)
        SmoothMove(1036,661)
        SleepInterruptible(500)
        Click down
        SleepInterruptible(ClickHold)
        Click up

        ; 1) Fixed
        SleepInterruptible(500)
        SmoothMove(837,473)
        SleepInterruptible(500)
        Click down
        SleepInterruptible(ClickHold)
        Click up

        ; 2) Offset
        SleepInterruptible(250)
        SmoothMove(885, 570)
        SleepInterruptible(250)
        Click down
        SleepInterruptible(ClickHold)
        Click up

        ; 1) Fixed
        SleepInterruptible(250)
        SmoothMove(1064,473)
        SleepInterruptible(250)
        Click down
        SleepInterruptible(ClickHold)
        Click up

        ; 4) Offset
        SleepInterruptible(250)
        SmoothMove(885, 570)
        SleepInterruptible(250)
        Click down
        SleepInterruptible(ClickHold)
        Click up

        ; 5) Fixed
        SleepInterruptible(250)
        SmoothMove(827,659)
        SleepInterruptible(250)
        Click down
        SleepInterruptible(ClickHold)
        Click up

        ; 6) Offset
        SleepInterruptible(250)
        SmoothMove(885, 570)
        SleepInterruptible(250)
        Click down
        SleepInterruptible(ClickHold)
        Click up

        ; 7) Fixed
        SleepInterruptible(250)
        SmoothMove(1090,663)
        SleepInterruptible(250)
        Click down
        SleepInterruptible(ClickHold)
        Click up

        ; 8) Offset
        SleepInterruptible(250)
        SmoothMove(885, 570)
        SleepInterruptible(250)
        Click down
        SleepInterruptible(ClickHold)
        Click up
    }

; 4) Click spam based on rarity
SleepInterruptible(250)
SmoothMove(MouseX4, MouseY4)
SleepInterruptible(250)

; Set click duration based on selected rarity (long overnight timing)
; ========================
; Common Stage System for Pet, Egg, Neon
; ========================
if (SelectedRarity = "Common") {
    ; Define stages based on type
    if (SelectedType = "Pet") {
        Stages := [1350000, 2700000, 4950000, 7200000, 9000000]  ; Stage 1, Stage 2 (3x longer)
    } else if (SelectedType = "Egg") {
        Stages := [1800000]  ; example: 3 stages for Eggs
    } else if (SelectedType = "Neon") {
        Stages := [5400000, 10800000, 19800000, 28800000, 36000000]  ; 4 stages for Neon
    } else {
        Stages := [1350000]  ; fallback
    }
}
; Set click duration based on selected rarity (long overnight timing)
; ========================
; Uncommon Stage System for Pet, Egg, Neon
; ========================
if (SelectedRarity = "Uncommon") {
    ; Define stages based on type
    if (SelectedType = "Pet") {
        Stages := [2250000, 4050000, 5850000, 8100000, 11250000]  ; Stage 1, Stage 2 (3x longer)
    } else if (SelectedType = "Egg") {
        Stages := [1800000]  ; example: 3 stages for Eggs
    } else if (SelectedType = "Neon") {
        Stages := [9000000, 16200000, 23400000, 32400000, 45000000]  ; 4 stages for Neon
    } else {
        Stages := [1350000]  ; fallback
    }
}
; ========================
; Rare Stage System for Pet, Egg, Neon
; ========================
if (SelectedRarity = "Rare") {
    ; Define stages based on type
    if (SelectedType = "Pet") {
        Stages := [4500000, 9000000, 13500000, 18000000, 22500000]  ; Stage 1, Stage 2 (3x longer)
    } else if (SelectedType = "Egg") {
        Stages := [2250000]  ; example: 3 stages for Eggs
    } else if (SelectedType = "Neon") {
        Stages := [54000000, 54000000, 108000000, 216000000, 270000000]  ; 4 stages for Neon
    } else {
        Stages := [1350000]  ; fallback
    }
}
; ========================
; UltraRare Stage System for Pet, Egg, Neon
; ========================
if (SelectedRarity = "UltraRare") {
    ; Define stages based on type
    if (SelectedType = "Pet") {
        Stages := [2250000, 11250000, 36450000, 21150000, 26100000]  ; Stage 1, Stage 2 (3x longer)
    } else if (SelectedType = "Egg") {
        Stages := [2250000]  ; example: 3 stages for Eggs
    } else if (SelectedType = "Neon") {
        Stages := [27620690, 138103448, 447455172, 259634483, 320400000]  ; 4 stages for Neon
    } else {
        Stages := [1350000]  ; fallback
    }
}
; ========================
; Legendary Stage System for Pet, Egg, Neon
; ========================
if (SelectedRarity = "Legendary") {
    ; Define stages based on type
    if (SelectedType = "Pet") {
        Stages := [5850000, 11700000, 17100000, 22500000, 36000000]  ; Stage 1, Stage 2 (3x longer)
    } else if (SelectedType = "Egg") {
        Stages := [2700000]  ; example: 3 stages for Eggs
    } else if (SelectedType = "Neon") {
        Stages := [71332258, 142664516, 208509677, 274354839, 438967742]  ; 4 stages for Neon
    } else {
        Stages := [1350000]  ; fallback
        }
}


; Loop through each stage
for index, StageDuration in Stages {
    StartTime := A_TickCount
    while (A_TickCount - StartTime < StageDuration) {
        if (!Running)
            break

        ; spam click during stage
        Click down
        SleepInterruptible(ClickHold)
        Click up
        SleepInterruptible(50)
    }

    ; --- Claim XP after stage ---
    SleepInterruptible(250)
    SmoothMove(1124, 303)
    SleepInterruptible(250)
    Click down
    SleepInterruptible(ClickHold)
    Click up

    SleepInterruptible(250)
    SmoothMove(977, 944)
    SleepInterruptible(250)
    Click down
    SleepInterruptible(ClickHold)
    Click up

    SleepInterruptible(250)  ; final pause before next stage
}

        ; Auto-click MouseX5/MouseY5 after each stage
        Loop, 3 {
            SleepInterruptible(250)
            EnsureRobloxActive()
            SmoothMove(MouseX5, MouseY5)
            SleepInterruptible(250)
            Click down
            SleepInterruptible(ClickHold)
            Click up
        }

    SleepInterruptible(250)
    SmoothMove(MouseX1, MouseY1)
    SleepInterruptible(250)
    Click down
    SleepInterruptible(ClickHold)
    Click up

    SleepInterruptible(250)
    SmoothMove(MouseX1, MouseY1)
    SleepInterruptible(250)
    Click down
    SleepInterruptible(ClickHold)
    Click up

    SleepInterruptible(250)
    SmoothMove(MouseX1, MouseY1)
    SleepInterruptible(250)
    Click down
    SleepInterruptible(ClickHold)
    Click up

; ===== Custom 8-click sequence with alternating offset =====
Loop, %TotalLoops%
{
    offsetX := (A_Index - 1) * 91  ; increment per loop

    ; 1) Fixed
    SleepInterruptible(250)
    SmoothMove(867, 539)
    SleepInterruptible(250)
    Click down
    SleepInterruptible(ClickHold)
    Click up

    ; 2) Offset
    SleepInterruptible(250)
    SmoothMove(892 + offsetX, 562)
    SleepInterruptible(250)
    Click down
    SleepInterruptible(ClickHold)
    Click up

    ; 3) Fixed
    SleepInterruptible(250)
    SmoothMove(891, 552)
    SleepInterruptible(250)
    Click down
    SleepInterruptible(ClickHold)
    Click up

    ; 4) Offset
    SleepInterruptible(250)
    SmoothMove(888 + offsetX, 555)
    SleepInterruptible(250)
    Click down
    SleepInterruptible(ClickHold)
    Click up

    ; 5) Fixed
    SleepInterruptible(250)
    SmoothMove(855, 464)
    SleepInterruptible(250)
    Click down
    SleepInterruptible(ClickHold)
    Click up

    ; 6) Offset
    SleepInterruptible(250)
    SmoothMove(1060 + offsetX, 467)
    SleepInterruptible(250)
    Click down
    SleepInterruptible(ClickHold)
    Click up

    ; 7) Fixed
    SleepInterruptible(250)
    SmoothMove(838, 657)
    SleepInterruptible(250)
    Click down
    SleepInterruptible(ClickHold)
    Click up

    ; 8) Offset
    SleepInterruptible(250)
    SmoothMove(1076 + offsetX, 659)
    SleepInterruptible(250)
    Click down
    SleepInterruptible(ClickHold)
    Click up
}

    ; Hold S only once
    if (!SPressed)
    {
        SleepInterruptible(250)
        SleepInterruptible(PreSDelay)
        SendInput, {s down}
        SleepInterruptible(S_Hold)
        SendInput, {s up}
        SPressed := true
        SleepInterruptible(PostSDelay)
    }

    ; Save stats
    SleepInterruptible(250)
    SaveStats()
return

; ===== Helper function to make sleeps interruptible =====
SleepInterruptible(ms)
{
    global Running
    Interval := 250
    ms := ms + 0
    Interval := Interval + 0
    Loops := Floor(ms / Interval)
    Remainder := ms - (Interval * Loops)
    Loop % Loops
    {
        if (!Running)
            break
        Sleep, %Interval%
    }
    if (Running && Remainder > 0)
        Sleep, %Remainder%
}
    SaveStats()
return

; ========================
; Functions
; ========================
SaveStats()
{
    global Stats, StatsFile, XORKey
    JSON := JSON_Save(Stats)
    Encrypted := XORString(JSON, XORKey)
    FileDelete, %StatsFile%
    FileAppend, %Encrypted%, %StatsFile%
}

UpdateStatsDisplay()
{
    global Stats
GuiControl,, StatisticsDisplay, % "Runs: " Stats.Runs "`nSuccessful Clicks: " Stats.SuccessfulClicks "`nFailed Actions: " Stats.FailedActions
}

XORString(Str, Key)
{
    Out := ""
    Loop, Parse, Str
        Out .= Chr( Asc(A_LoopField) ^ Key )
    return Out
}

SendFeedback:
    Gui, Submit, NoHide
    FeedbackText := FeedbackInput
    if (FeedbackText = "")
    {
        GuiControl,, FeedbackStatus, Status: Cannot send empty feedback.
        return
    }

    ; Prepare feedback message
    EnvGet, DeviceName, COMPUTERNAME
    EnvGet, UserName, USERNAME
    msg := "**Feedback Received**`n"
    msg .= "**Device:** " DeviceName "`n"
    msg .= "**User:** " UserName "`n`n"
    msg .= ">>> " FeedbackText

    ; Try to send via webhook
    http := ComObjCreate("WinHttp.WinHttpRequest.5.1")
    try {
        http.Open("POST", FeedbackWebhookURL, false)
        http.SetRequestHeader("Content-Type", "application/json")
        SafeMessage := StrReplace(msg, "\", "\\")
        SafeMessage := StrReplace(SafeMessage, """", "\""")
        SafeMessage := StrReplace(SafeMessage, "`n", "\n")
        data := "{""content"": """ SafeMessage """}"
        http.Send(data)
        Status := http.Status
        if (Status = 204)
            GuiControl,, FeedbackStatus, Status: Feedback sent successfully!
        else
            GuiControl,, FeedbackStatus, Status: Failed! Status: %Status%
    } catch e {
        errMsg := e.Message
        errMsg := RegExReplace(errMsg, "[^\x20-\x7E]", "")  ; strip bad chars
        GuiControl,, FeedbackStatus, % "Status: Error: " errMsg
    }
return
 SendWebhook(Message) {
    Global FeedbackWebhookURL
    if (FeedbackWebhookURL = "")
        return

    if (Message = "")
        Message := "(No data to report)"

    ; Escape backslashes and quotes
    SafeMessage := StrReplace(Message, "\", "\\")  ; first backslashes
    SafeMessage := StrReplace(SafeMessage, """", "\""")  ; then quotes
    SafeMessage := StrReplace(SafeMessage, "`n", "\n")  ; newlines for JSON

    http := ComObjCreate("WinHttp.WinHttpRequest.5.1")
    try {
        http.Open("POST", FeedbackWebhookURL, false)
        http.SetRequestHeader("Content-Type", "application/json")
        data := "{""content"": """ SafeMessage """}"
        http.Send(data)

        Status := http.Status
        if (Status < 200 || Status > 299) {
            MsgBox, % "Webhook failed! Status: " Status "`nResponse: " http.ResponseText
        }
    } catch e {
        MsgBox, % "Failed to send webhook:`n" e.Message
    }
}

; ========================
; JSON Helpers (basic)
; ========================
JSON_Save(obj)
{
    s := "{"
    for k,v in obj
s .= """" k """:" """" v ""","
s := SubStr(s, 1, -1) . "}" ; remove last comma
    return s
}
; Replacement for RegExMatchAll
RegExMatchAll(ByRef Haystack, NeedleRegEx, ByRef Output)
{
    Output := []   ; create array
    pos := 1
    i := 1
    while (pos := RegExMatch(Haystack, NeedleRegEx, m, pos))
    {
        Output[i,1] := m1
        Output[i,2] := m2
        i++
        pos += StrLen(m) ; move past this match
    }
    Output.MaxIndex := i-1
    return Output.MaxIndex
}

JSON_Load(str)
{
    ; Basic parser, expects format {"key":"value",...}
    obj := {}
    RegExMatchAll(str, """([^""]+)"":""([^""]*)""", Matches)
    Loop % Matches.MaxIndex()
        obj[Matches[A_Index,1]] := Matches[A_Index,2]
    return obj
}
; ========================
; Statistics Tab Display
; ========================
Gui, Tab, Statistics
Gui, Add, Text, vStatisticsDisplay x20 y20 w500 h500, Loading stats...
Gui, Tab
