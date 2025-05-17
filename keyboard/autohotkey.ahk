#Requires AutoHotKey >=2.0
#SingleInstance Force
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

!c::
{
  Send "^c"
}

!v::
{
  Send "^v"
}

!t::
{
  Send "<^t"
}

!+t::
{
  Send "^+t"
}

!f::
{
  Send "^f"
}

!LButton::
{
  Send "^{LButton}"
}

!s::
{
  Send "^s"
}

!a::
{
  Send "^a"
}

!w::
{
  Send "^w"
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

!u::
{
  Send "^u"
}

!k::
{
  Send "^k"
}

!l::
{
  Send "^l"
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

!z::
{
  Send "^z"
}

!b::
{
  Send "^b"
}

!d::
{
  Send "^d"
}

!e::
{
  Send "^e"
}

!p::
{
  Send "^p"
}
!+p::
{
  Send "^+p"
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
