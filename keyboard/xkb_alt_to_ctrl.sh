if [ "X$DISPLAY" != "X" ]; then
  output=$(setxkbmap -print)
  echo $output | grep 'nocaps' > /dev/null
  if [ $? != 0 ]; then
    xkbdir="$HOME/.xkb"
    setxkbmap -option ctrl:nocaps #-option altwin:ctrl_alt_win
    xcape -e 'Control_L=Escape'
    echo $output \
      | sed 's/\(xkb_symbols[^"]*"[^"]*\)"/\1+altctrl(alt_is_ctrl)"/' \
      | xkbcomp -w 0 -I"$xkbdir" - "$DISPLAY"
  fi
fi
