alias ls='ls -G'
alias grep='grep --color'
xopen () { cd ~/Documents/xopen/$1; }
alias cddl='cd ~/Downloads'
alias x='tmux'
alias xs='tmux-cssh'
alias vboxm="VBoxManage"
alias vml="VBoxManage list vms"
alias vmlr="VBoxManage list runningvms"
vms () { VBoxHeadless -s $1 -v off & }
vmd () { VBoxManage controlvm $1 $2; }
vmrdp () { VBoxManage controlvm $1 vrde $2; }
alias ftpup='sudo -s launchctl load -w /System/Library/LaunchDaemons/ftp.plist'
alias ftpdown='sudo -s launchctl unload -w /System/Library/LaunchDaemons/ftp.plist'

export PATH="$PATH:$HOME/.rvm/bin:$HOME/Applications/packer:/usr/local/mysql/bin" # Add RVM to PATH for scripting
export JAVA_HOME='/usr/libexec/java_home'
export EDITOR='vim'
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib
