[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# This is required to make sure GPG can sign commit message supplied from
# editors
export GPG_TTY=$(tty)

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

alias k=kubectl
alias kg='kubectl get'
alias kd='kubectl describe'
alias kns='kubectl-ns'
alias kx=kubectx
alias h=helm
alias curl='curl --netrc-file <(gpg --batch -q -d ~/.netrc.gpg)'

# Display branches for all folders in the current directory
gsbranch() {
  for i in `ls`; do cd $i; b=$(git branch | grep '* ' | cut -f2 -d' '); printf "%-50s %-10s\n" $i $b; cd ..;  done
}
