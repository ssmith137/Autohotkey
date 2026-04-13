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
