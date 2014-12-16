# Vi mode bash key bindings
set -o vi
bind '"\C-a": beginning-of-line'
bind '"\C-e": end-of-line'
bind '"\C-k": kill-line'
bind '"\C-p": previous-history'
bind '"\C-n": next-history'

alias grep='grep --color'
