#InstallKeybdHook

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

$LWin::Alt
$RAlt::LWin
$RCtrl::Alt

*h::
if GetKeyState("LWin", "P")
send,{Left}
else if GetKeyState("Shift", "P")
send,H
else
send,h
return

*j::
if GetKeyState("LWin", "P")
send,{Down}
else if GetKeyState("Shift", "P")
send,J
else
send,j
return

*k::
if GetKeyState("LWin", "P")
send,{Up}
else if GetKeyState("Ctrl","P")
{
  winget, win_class, ProcessName, A
    if instr(win_class, "PortX") || instr(win_class, "PuTTY")
      send,^k
    else if A_CaretX != 0
      ;; Plus {Ctrl}{Del} doesn't work the same way as original {Ctrl}{Del}
  send,{Shift Down}{End}{Del}{Shift Up}
    else
      send,^k
}
else if GetKeyState("Shift", "P")
send,K
else
send,k
return

*l::
if GetKeyState("LWin", "P")
send,{Right}
else if GetKeyState("Shift", "P")
send,L
else
send,l
return

*u::
if GetKeyState("LWin", "P")
send,{Home}
else if GetKeyState("Ctrl", "P")
{
  winget, win_class, ProcessName, A
    if instr(win_class, "PortX") || instr(win_class, "PuTTY")
      send,^u
    else if A_CaretX != 0
      ;; Same as the key *k, use this because {Ctrl}{BS} doesn't work the same way as the original combinations
        ;; Tried WinGetClass, can't get the outputvar comparison with String working
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
if GetKeyState("LWin", "P")
send,{End}
else if GetKeyState("Shift", "P")
send,P
else
send,p
return

*i::
if GetKeyState("LWin", "P")
send,{PgUp}
else if GetKeyState("Shift", "P")
send,I
else
send,i
return

*o::
if GetKeyState("LWin", "P")
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
    send,{Shift Down}{Alt Down}{Tab}
  else
    send,{Alt Down}{Tab}
}
else if GetKeyState("LWin", "P")
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

*e::
if GetKeyState("Ctrl", "P")
send,{End}
else if GetKeyState("Shift", "P")
send,E
else
send,e
return

*f::
if GetKeyState("LAlt", "P")
send,^f
else if GetKeyState("Ctrl","P")
send,{Right}
else if GetKeyState("Shift", "P")
send,F
else
send,f
return

*b::
if GetKeyState("Ctrl","P")
send,{Left}
else if GetKeyState("Shift", "P")
send,B
else
send,b
return
