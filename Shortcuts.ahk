; ---------- Personal snippets (not tracked in Git) ----------
#Include Snippets.ahk

;CapsLock::Esc
;Esc::CapsLock

; ----------- Maximize focused window (Enter) -----------
#Enter::
    WinGet, activewindow, ID, A
    WinGet, minmax, MinMax, ahk_id %activewindow%

    if (minmax = 1)
        WinRestore, ahk_id %activewindow%
    else
        WinMaximize, ahk_id %activewindow%
return

; ----------- Claude (a) -----------
#a::
    IfWinExist, ahk_exe Claude.exe
    {
        WinActivateBottom, ahk_exe Claude.exe
        Send, #^i
    }
    else
        Run, C:\Program Files\WindowsApps\Claude_1.1062.0.0_x64__pzs8sxrjxfjjc\app\claude.exe
return

; ----------- Browser (Brave) (b) -----------
#b::
    IfWinExist, ahk_exe brave.exe
    {
        WinActivateBottom, ahk_exe brave.exe
        Send, #^i
    }
    else
        Run, brave.exe
return

; ----------- ConnectWise - c -----------
#c::
    IfWinExist, ahk_exe ConnectWise.exe
    {
        WinActivateBottom, ahk_exe ConnectWise.exe
        Send, #^i
    }
    else
        Run, ConnectWise.exe
return

; ----------- Show Desktop (d) ----------------

; ----------- Microsoft Outlook (e) -----------
#e::
    IfWinExist, ahk_exe olk.exe
    {
        WinActivateBottom, ahk_exe olk.exe
        Send, #^i
    }
else
    Run, olk.exe
return

; ----------- File Explorer (f) -----------
#f::
    IfWinExist, ahk_class CabinetWClass
       {
          WinActivateBottom, ahk_class CabinetWClass
          Send, #^i
       }
else
    Run, explorer.exe
return

; ----------- Goose (g) ----------------
#g::
    IfWinExist, ahk_exe Goose.exe
       {
          WinActivateBottom, ahk_exe Goose.exe
          Send, #^i
       }
else
    Run, C:\Users\Spencer\AppData\Local\Programs\Goose-1.29.1\dist-windows\Goose.exe
return

; ----------- IDE (i) -----------
#i::
    IfWinExist, ahk_exe Zed.exe
        {
        WinActivateBottom, ahk_exe Zed.exe
        Send, #^i
    }
else
    Run, Zed.exe
return

; ----------- unbound (j) -------------------
#j::
    Send, #{left}
    Send, #^i
return

; ----------- Unbound (k)----------------
#k::
    Send, #{right}
    Send, #^i
return

; ----------- Windows lock (l) ------------

; ----------- Microsoft Teams (new) - m -----------
#m::
    IfWinExist, ahk_exe ms-teams.exe
    {
        WinActivateBottom, ahk_exe ms-teams.exe
        Send, #^i
    }
else
    Run, ms-teams.exe
return

; ----------- Obsidian (n) -----------
#n::
    IfWinExist, ahk_exe obsidian.exe
    {
        WinActivateBottom, ahk_exe obsidian.exe
        Send, #^i
    }
else
    Run, obsidian://
return

; ----------- Unset (o) -----------
;#o::
;    IfWinExist, ahk_exe .exe
;    {
;        WinActivateBottom, ahk_exe .exe
         Send, #^i
;    }
;else
;    Send, ^!o
;return

; ---------- 2FA Authenticator (p) --------------
#p::
    IfWinExist, ahk_exe WinOTP Authenticator.exe
    {
        WinActivateBottom, ahk_exe WinOTP Authenticator.exe
        Send, #^i
    }
else
    Run, shell:AppsFolder\34135VladimirAkopyan.WinOTPAuthenticator_2pzdtnkq902vy!App
return

; ----------- Quick Assist (q) --------------
#q::
    IfWinExist, ahk_exe QuickAssist.exe
    {
        WinActivateBottom, ahk_exe QuickAssist.exe
        Send, #^i
    }
else
    Run, QuickAssist.exe
return

; --------- Windows Run (r) --------------

; --------- ScreenConnect (s) -------------------
#s::
    IfWinExist, ahk_exe ScreenConnect.WindowsClient.exe
        WinActivateBottom, ahk_exe ScreenConnect.WindowsClient.exe
        Send, #^i
return

; ----------- Terminal (t) -----------
#t::
    IfWinExist, ahk_exe WindowsTerminal.exe
    {
        WinActivateBottom, ahk_exe WindowsTerminal.exe
        Send, #^i
    }
else
    Run, wt.exe
return

; ----------- Minimize focused window (u) -----------
#u::
    WinMinimize, A
return

; ----------- Clipboard History (v) -------------------

; ----------- Microsoft Word (w) -----------
#w::
    IfWinExist, ahk_exe WINWORD.EXE
    {
        WinActivateBottom, ahk_exe WINWORD.EXE
        Send, #^i
    }
else
    Run, WINWORD.EXE
return

; ----------- Microsoft Excel - x -----------
#x::
    IfWinExist, ahk_exe EXCEL.EXE
    {
        WinActivateBottom, ahk_exe EXCEL.EXE
        Send, #^i
    }
else
    Run, EXCEL.EXE
return

; ----------- Close focused window (y) -----------
#y::
    WinClose, A
return

; ----------- Zoom (z) -----------
#z::
    IfWinExist, ahk_exe zoom.exe
    {
        WinActivateBottom, ahk_exe zoom.exe
        Send, #^i
    }
else
    Run, zoom.exe
return

; ---------- (,) temporarily show desktop -----------

; ---------- (.) emoji picker ----------------

; ---------- Windows Settings (;) ----------
#;::
    IfWinExist, ahk_exe ms-settings.exe
        {
            WinActivateBottom, ahk_exe ms-settings.exe
            Send, #^i
        }
else
    Run, ms-settings.exe
return


; ---------- Toggle Opacity ----------------
; Win + Ctrl + O toggles opacity between 220 and 255
^#o::
    WinGet, currentTrans, Transparent, A
    if (currentTrans != 255)
        WinSet, Transparent, 255, A
    else
        WinSet, Transparent, 210, A
return


; ---------- manual focus only one window ----------------
#^i::  ; win+ctrl+i hotkey
    winget, activewindow, id, a

    ; get position of the active window
    wingetpos, activex, activey, activewidth, activeheight, ahk_id %activewindow%
    activex2 := activex + activewidth
    activey2 := activey + activeheight

    winget, windowlist, list

    loop, %windowlist%
    {
        windowid := windowlist%a_index%

        ; skip the active window itself
        if (windowid = activewindow)
            continue

        ; skip if window doesn't exist or is minimized
        winget, windowexists, id, ahk_id %windowid%
        if (!windowexists)
            continue

        winget, minmax, minmax, ahk_id %windowid%
        if (minmax = -1)
            continue

        ; skip system windows
        wingettitle, windowtitle, ahk_id %windowid%
        wingetclass, windowclass, ahk_id %windowid%
        if (windowtitle = ""
            || windowclass = "shell_traywnd"
            || windowclass = "dv2controlhost"
            || windowclass = "msgrimewindowclass"
            || windowclass = "sysshadow"
            || windowclass = "button"
            || instr(windowclass, "shell_") > 0
            || instr(windowclass, "windows.ui") > 0)
            continue

        ; skip windows without a minimize button
        winget, windowstyle, style, ahk_id %windowid%
        if (!(windowstyle & 0x20000))
            continue

        ; get this window's rect
        wingetpos, wx, wy, ww, wh, ahk_id %windowid%
        wx2 := wx + ww
        wy2 := wy + wh

        ; check if it overlaps with the active window
        if (wx < activex2 && wx2 > activex && wy < activey2 && wy2 > activey)
        {
            winminimize, ahk_id %windowid%
        }
    }

    winactivate, ahk_id %activewindow%

return

; --old, for safe keeping --
; ---------- manual focus only one window ----------------
;#^i::  ; win+ctrl+i hotkey
;    ; get the currently active window
;    winget, activewindow, id, a
;
;    ; array to store focused windows on each monitor
;    focusedwindows := {}
;    focusedwindows[activewindow] := true
;
;    ; get list of all windows
;    winget, windowlist, list
;
;    ; find the topmost visible window on each monitor
;    loop, %windowlist%
;    {
;        windowid := windowlist%a_index%
;
;        ; skip if window doesn't exist or is minimized
;        winget, windowexists, id, ahk_id %windowid%
;        if (!windowexists)
;            continue
;
;        winget, minmax, minmax, ahk_id %windowid%
;        if (minmax = -1)
;            continue
;
;        ; get window info
;        wingettitle, windowtitle, ahk_id %windowid%
;        wingetclass, windowclass, ahk_id %windowid%
;
;        ; skip system windows
;        if (windowtitle = ""
;            || windowclass = "shell_traywnd"
;            || windowclass = "dv2controlhost"
;            || windowclass = "msgrimewindowclass"
;            || windowclass = "sysshadow"
;            || windowclass = "button"
;            || instr(windowclass, "shell_") > 0
;            || instr(windowclass, "windows.ui") > 0)
;            continue
;
;        ; check if window has minimize button
;        winget, windowstyle, style, ahk_id %windowid%
;        if (!(windowstyle & 0x20000))  ; ws_minimizebox
;            continue
;
;        ; get window position and size
;        wingetpos, winx, winy, winwidth, winheight, ahk_id %windowid%
;
;        ; get monitor info for this window
;        sysget, monitorcount, monitorcount
;
;        loop, %monitorcount%
;        {
;            sysget, monitor%a_index%, monitor, %a_index%
;
;            ; check if window center is on this monitor
;            wincenterx := winx + (winwidth / 2)
;            wincentery := winy + (winheight / 2)
;
;            if (wincenterx >= monitor%a_index%left
;                && wincenterx <= monitor%a_index%right
;                && wincentery >= monitor%a_index%top
;                && wincentery <= monitor%a_index%bottom)
;            {
;                ; this window is on monitor a_index
;                monitorkey := "monitor" . a_index
;
;                ; if we haven't found a focused window for this monitor yet,
;                ; or this window is higher in z-order (closer to foreground)
;                if (!focusedwindows.haskey(monitorkey))
;                {
;                    ; check if this window is visible and not covered
;                    winget, windowstate, exstyle, ahk_id %windowid%
;                    if (!(windowstate & 0x80))  ; not ws_ex_layered or invisible
;                    {
;                        focusedwindows[monitorkey] := windowid
;                    }
;                }
;                break
;            }
;        }
;    }
;
;    ; now minimize all windows except the focused ones
;    loop, %windowlist%
;    {
;        windowid := windowlist%a_index%
;
;        ; skip if this is one of our focused windows
;        skipthis := false
;        for key, value in focusedwindows
;        {
;            if (windowid = value)
;            {
;                skipthis := true
;                break
;            }
;        }
;        if (skipthis)
;            continue
;
;        ; skip if window doesn't exist
;        winget, windowexists, id, ahk_id %windowid%
;        if (!windowexists)
;            continue
;
;        ; skip if window is already minimized
;        winget, minmax, minmax, ahk_id %windowid%
;        if (minmax = -1)
;            continue
;
;        ; get window info to filter out system windows
;        wingettitle, windowtitle, ahk_id %windowid%
;        wingetclass, windowclass, ahk_id %windowid%
;
;        ; skip system windows
;        if (windowtitle = ""
;            || windowclass = "shell_traywnd"
;            || windowclass = "dv2controlhost"
;            || windowclass = "msgrimewindowclass"
;            || windowclass = "sysshadow"
;            || windowclass = "button"
;            || instr(windowclass, "shell_") > 0
;            || instr(windowclass, "windows.ui") > 0)
;            continue
;
;        ; check if window has minimize button
;        winget, windowstyle, style, ahk_id %windowid%
;        if (!(windowstyle & 0x20000))  ; ws_minimizebox
;            continue
;
;        ; minimize the window
;        winminimize, ahk_id %windowid%
;    }
;
;    ; ensure the original active window stays active
;    winactivate, ahk_id %activewindow%
;
;return
