;; This key map doesn't use Win key and also use Alt as Ctrl
#Requires AutoHotKey >=2.0
#SingleInstance Force
#UseHook
;$Capslock::Esc
RCtrl::RAlt

vkFF::Send "^{Esc}"
vkFF & h::Send "{Left}"
vkFF & l::Send "{Right}"
vkFF & j::Send "{Down}"
vkFF & k::Send "{Up}"

vkFF & e::Run("explorer.exe")

vkFF & i::Send "{PgUp}"
vkFF & o::Send "{PgDn}"
vkFF & p::Send "{End}"
vkFF & q::DllCall("LockWorkStation")
vkFF & u::Send "{Home}"

vkFF & Left::Send("#{Left}")
vkFF & Right::Send("#{Right}")
vkFF & Up::Send("#{Up}")  
vkFF & Enter::Send("#{Up}")
vkFF & Down::Send("#{Down}")  
vkFF & Space::Send("#{Space}")

BypassInputHook := false

*b::
{
  global AltUsedAsModifier
  if GetKeyState("LAlt", "P") {
    AltUsedAsModifier := true
    Send "{Ctrl up}"
    Send "{Blind}!b"
  } else {
    Send "{Blind}b"
  }
}

*c::
{
  global AltUsedAsModifier
  if GetKeyState("LAlt", "P") {
    AltUsedAsModifier := true
    Send "{Ctrl up}"
    If WinActive("ahk_exe WindowsTerminal.exe")
      Send "{Blind}!c"
    else
      Send "{Blind}^c"
  } else {
    Send "{Blind}c"
  }
}

*i::
{
  global AltUsedAsModifier
  if GetKeyState("LAlt", "P") {
    AltUsedAsModifier := true
    Send "{Ctrl up}"
    Send "{Blind}!i"
  } else {
    Send "{Blind}i"
  }
}

*k::
{
  global AltUsedAsModifier
  if GetKeyState("Alt", "P") {
    AltUsedAsModifier := true
    Send "{Ctrl up}"
    Send "{Blind}!k"
  } else {
    Send "{Blind}k"
  }
}

*q::
{
  global AltUsedAsModifier
  if GetKeyState("LAlt", "P") {
    AltUsedAsModifier := true
    Send "{Ctrl up}"
    Send "!{f4}"
  } else {
    Send "{Blind}q"
  }
}

*m::
{
  global AltUsedAsModifier
  if GetKeyState("Alt", "P") {
    AltUsedAsModifier := true
    Send "{Ctrl up}"
    Send "{Blind}!m"
  } else {
    Send "{Blind}m"
  }
}

*v::
{
  global AltUsedAsModifier
  if GetKeyState("LAlt", "P") {
    AltUsedAsModifier := true
    Send "{Ctrl up}"
    If WinActive("ahk_exe WindowsTerminal.exe")
      Send "{Blind}!v"
    else
      Send "{Blind}^v"
  } else {
    Send "{Blind}v"
  }
}

*w::
{
  global AltUsedAsModifier
  if GetKeyState("LAlt", "P") {
    AltUsedAsModifier := true
    Send "{Ctrl up}"
    If WinActive("ahk_exe WindowsTerminal.exe")
      Send "{Blind}!w"
    else
      Send "{Blind}^w"
  } else {
    Send "{Blind}w"
  }
}

^+[::Send "^{PgUp}"
^+]::Send "^{PgDn}"

AltTabMode := false
AltUsedAsModifier := false
AltDown := false
CapsLockUsedAsCtrl := false
CapsLockDown := false
Alt::
{
  global AltUsedAsModifier, AltDown, BypassInputHook

  AltUsedAsModifier := false
  AltDown := true
  BypassInputHook := false
  Send "{Ctrl down}"
  InputHookObj.Start()
}

Alt up::
{
  global AltTabMode, AltDown, InputHookObj, BypassInputHook
  
  AltDown := false
  InputHookObj.Stop()
  ; additional physical state check on the alt key
  if AltTabMode and !GetKeyState("Alt", "P") {
    AltTabMode := false
    SendInput("{Alt up}")
  } else {
    SendInput("{Ctrl up}")
    if !AltUsedAsModifier and !BypassInputHook {
      SendInput "{Escape}"
    }
  }
}

*Tab::
{
  global AltTabMode
  if GetKeyState("Ctrl") {
    if !AltTabMode {
      SendInput("{Ctrl up}")
      AltTabMode := true
      SendInput("{Blind}{Alt down}{Tab}")
      return
    }
  }
  Send("{Blind}{Tab}")
}

CapsLock::
{
  global CapsLockUsedAsCtrl, CapsLockDown, InputHookObj, BypassInputHook
  
  CapsLockUsedAsCtrl := false
  CapsLockDown := true
  BypassInputHook := false
  Send "{Ctrl down}"
  InputHookObj.Start()
}

CapsLock up::
{
  global CapsLockUsedAsCtrl, CapsLockDown, InputHookObj, BypassInputHook
  
  CapsLockDown := false
  InputHookObj.Stop()
  SendInput "{Ctrl up}"
  if !CapsLockUsedAsCtrl and !BypassInputHook {
    SendInput "{Escape}"
  }
}

InputHookObj := InputHook()
InputHookObj.KeyOpt("{All}", "N")
InputHookObj.OnKeyDown := CheckKeyDown
CheckKeyDown(ihObj, vk, scanCode)
{
  global AltUsedAsModifier, AltDown, CapsLockUsedAsCtrl, CapsLockDown
  if AltDown and vk != 0x12 {
    AltUsedAsModifier := true
    ;SendInput("{" . "vk" vk . "}")
  }
  if CapsLockDown and vk != 0x14 {
    CapsLockUsedAsCtrl := true
    ;SendInput("{" . "vk" vk . "}")
  }
}
