#Requires AutoHotKey >=2.0
#SingleInstance Force
#UseHook
;$Capslock::Esc

#h::
{
  Send "{Left}"
}

#l::
{
  Send "{Right}"
}

#j::
{
  Send "{Down}"
}

#k::
{
  Send "{Up}"
}

!a::
{
  Send "^a"
}

!b::
{
  Send "^b"
}

!c::
{
  Send "^c"
}

!d::
{
  Send "^d"
}

!e::
{
  Send "^e"
}

!f::
{
  Send "^f"
}

<!i::
{
  Send "^i"
}

<!+i::
{
  Send "^+i"
}

!k::
{
  Send "^k"
}

!l::
{
  Send "^l"
}

<!m::
{
  Send "^m"
}

!p::
{
  Send "^p"
}
!+p::
{
  Send "^+p"
}

!q::
{
  Send "!{f4}"
}
^!q::
{
  DllCall("user32.dll\WTSDisconnectSession")
}

!r::
{
  Send "^r"
}

!s::
{
  Send "^s"
}

!t::
{
  Send "<^t"
}

!+t::
{
  Send "^+t"
}

!u::
{
  Send "^u"
}

!v::
{
  Send "^v"
}

!w::
{
  Send "^w"
}

!z::
{
  Send "^z"
}

!LButton::
{
  Send "^{LButton}"
}

!1::
{
  Send "^1"
}

!2::
{
  Send "^2"
}

!3::
{
  Send "^3"
}

!4::
{
  Send "^4"
}

!5::
{
  Send "^5"
}

>!`::
{
  Send "^``"
}

<!+[::
{
  Send "^{PgUp}"
}

<!+]::
{
  Send "^{PgDn}"
}

*Alt::
{
  if (KeyWait("Alt", "T0.1"))
    Send "{Esc}"
}

*CapsLock::
{
  if (KeyWait("Capslock", "T0.1"))
    Send "{Esc}"
  else 
    Send "{Blind}{LCtrl DownR}"
}

*CapsLock up::
{
  Send "{Blind}{LCtrl Up}"
}
