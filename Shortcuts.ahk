; ---------- Personal snippets (not tracked in Git) ----------
#Include Snippets.ahk
#Include Opacity.ahk

; ----------- Remap CapsLock to Esc and vice versa -----------
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
