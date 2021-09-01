#InstallKeybdHook
#UseHook, On
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#SingleInstance force

;; General key mappings that simulate Mac keyboards
$Capslock::Esc
$Esc::Capslock
*LAlt::
  send,{Ctrl down}
return

*LAlt Up::
  if A_PriorKey = Tab
    send,{Alt Up}{Enter}{Ctrl Up}
  else
    send,{Ctrl Up}
return

vkFF::Alt
$RAlt::RWin
$RCtrl::RAlt

*b::
  if GetKeyState("Ctrl","P")
  {
    winget, procname, ProcessName, A
    if procname in cmd.exe,powershell.exe,debian.exe,PortX.exe,PuTTY.exe,code.exe
      send,^b
    else
      send,{Left}
  }
  else if GetKeyState("Shift", "P")
    send,B
  else
    send,b
return

*e::
  if GetKeyState("Ctrl", "P")
    send,{End}
  Else if GetKeyState("LAlt", "P")
    run explorer.exe
  else if GetKeyState("Shift", "P")
    send,E
  else
    send,e
return

*f::
  if GetKeyState("LAlt", "P") and GetKeyState("Shift", "P")
  {
    WinGet, procname, ProcessName, A
    if procname in outlook.exe
      send, {Ctrl DownR}f
    Else
      send, {Ctrl downR}{Shift downR}f
  }
  else if GetKeyState("vkFF", "P") and GetKeyState("Shift", "P")
    send, {CtrlUp}{ShiftDown}{AltDown}f{ShiftUp}{AltUp}
  else if GetKeyState("LAlt", "P")
  {
    WinGet, procname, ProcessName, A
    if procname in outlook.exe
      Send, {Ctrl up}{F3}
    else 
      send,^f
  }
  else if GetKeyState("Ctrl","P")
  {
    winget, procname, ProcessName, A
    if procname in cmd.exe,powershell.exe,debian.exe,PortX.exe,PuTTY.exe,code.exe
      send,^f
    else
      send,{Right}
  }
  else if GetKeyState("Shift", "P")
    send,F
  else
    send,f
return

*h::
  if GetKeyState("vkFF", "P")
    send,{Left}
  else if GetKeyState("Shift", "P")
    send,H
  else
    send,h
return

*j::
  if GetKeyState("vkFF", "P")
    send,{Down}
  else if GetKeyState("Shift", "P")
    send,J
  else
    send,j
return

*k::
  if GetKeyState("vkFF", "P")
    send,{Up}
  else if GetKeyState("Ctrl","P")
  {
    winget, procname, ProcessName, A
    if procname in code.exe,debian.exe,PortX.exe,PuTTY.exe,cmd.exe,powershell.exe
      send,^k
    else if A_CaretX != 0
      Send,{Shift Down}{End}{Del}{Shift Up}
    else
      send,^k
  }
  else if GetKeyState("Shift", "P")
    send,K
  else
    send,k
return

*l::
  if GetKeyState("vkFF", "P")
    send,{Right}
  else if GetKeyState("RAlt", "P")
    DllCall("user32.dll\LockWorkStation")
  else if GetKeyState("Shift", "P")
    send,L
  else
    send,l
return

*u::
  if GetKeyState("vkFF", "P")
    send,{Home}
  else if GetKeyState("Ctrl", "P")
  {
    winget, procname, ProcessName, A
    if procname in code.exe,debian.exe,PortX.exe,PuTTY.exe,cmd.exe,powershell.exe
      send,^u
    else if A_CaretX != 0
      send,{Shift Down}{Home}{Del}{Shift Up}
    else
      send,^u
  }
  else if GetKeyState("Shift", "P")
    send,U
  else
    send,u
return

*p::
  if GetKeyState("vkFF", "P")
    send,{End}
  else if GetKeyState("Ctrl", "P" )
    send,^p
  else if GetKeyState("Shift", "P")
    send,P
  else
    send,p
return

*i::
  if GetKeyState("vkFF", "P")
    send,{PgUp}
  else if GetKeyState("Shift", "P")
    send,I
  else
    send,i
return

*o::
  if GetKeyState("vkFF", "P")
    send,{PgDn}
  else if GetKeyState("Shift", "P")
    send,O
  else
    send,o
return

*Tab::
  if GetKeyState("LAlt", "P")
  {
    if GetKeyState("Shift", "P")
      send,{Shift DownR}{Alt DownR}{Tab}
    else
      send,{Alt DownR}{Tab}
  }
  else if GetKeyState("vkFF", "P")
  {
    if GetKeyState("Shift", "P")
      send,{Shift Down}{Alt Down}{Tab}
    else
      send,{Alt Down}{Tab}
  }
  else if GetKeyState("Ctrl", "P")
    send,{Ctrl down}{Tab}
  else
    send,{Tab}
return

;; The section below is an additional remapping that can be used on top of exisitng General ones 
*a::
  if GetKeyState("LAlt", "P")
    send,^a
  else if GetKeyState("Ctrl","P")
    send,{Home}
  else if GetKeyState("Shift", "P")
    send,A
  else
    send,a
return

*q::
  if GetKeyState("LAlt","P")
    WinKill, A,
  else if GetKeyState("Shift", "P")
    send,Q
  else
    send,q
return

*w::
  if GetKeyState("LAlt","P")
  {
    WinGet, procname, ProcessName, A
    if procname in chrome.exe,code.exe,PortX.exe
      send, ^w
    Else
      WinClose, A
  }
  else if GetKeyState("Ctrl", "P")
  {
    WinGet, procname, ProcessName, A
    if procname in code.exe,debian.exe,PortX.exe,PuTTY.exe,cmd.exe,powershell.exe
      send,^w
    else if A_CaretX != 0
      Send, {CtrlUp}{CtrlDown}{BackSpace}
    else
      send,^w
  }
  else if GetKeyState("Shift", "P")
    send,W
  else
    send,w
return

*Space::
  if GetKeyState("LAlt", "P")
    send, {Ctrl}{Esc}
  else if GetKeyState("Ctrl", "P")
    send, {Ctrl}{Space}
  else
    send, {Space}
return

*[::
  if GetKeyState("LAlt", "P") And GetKeyState("Shift", "P")
    send, {Ctrl Down}{ShiftDown}{Tab}
  else if GetKeyState("LAlt", "P")
    send, {CtrlUp}{AltDown}{Left}{AltUp}
  Else if GetKeyState("Shift", "P")
    send, {Shift Down}[{ShiftUp}
  Else
    send, [
return

*]::
  if GetKeyState("LAlt", "P") And GetKeyState("Shift", "P")
    send, {Ctrl Down}{Tab}
  else if GetKeyState("LAlt", "P")
    send, {CtrlUp}{AltDown}{Right}{AltUp}
  else if GetKeyState("Shift", "P")
    send, {Shift Down}]{ShiftUp}
  Else
    send, ]
return

*4::
  if GetKeyState("LAlt", "P") And GetKeyState("Shift", "P")
    send, {CtrlUp}{RWin Down}{Shift Down}s{RWinUp}{ShiftUp}
  else if GetKeyState("Shift", "P")
    send, $
  Else
    send, 4
return

;; Enable three finger move
drag_enabled := 0
+^#F22::
  if (drag_enabled) 
    Click, Up
  else
    Click, Down
  drag_enabled := !drag_enabled
return

LButton::
  if(drag_enabled)
  {
    Click up
    drag_enabled := 0
  }
  else
    click
return