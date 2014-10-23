alias ls='ls -G'
alias grep='grep --color'
movio () { cd ~/Documents/movio/$1; }
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
alias reloaddns='sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist && sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist'

export PATH="$PATH:$HOME/.rvm/bin:$HOME/Applications/packer:/usr/local/mysql/bin" # Add RVM to PATH for scripting
export JAVA_HOME=`/usr/libexec/java_home`
export EDITOR='vim'
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib

if [ `ps aux |grep ssh-agent | grep -v grep | wc -l` -lt 1 ]; then
  eval `ssh-agent -s` > /dev/null
fi
ssh-add > /dev/null 2>&1

export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_TLS_VERIFY=1
export DOCKER_CERT_PATH=/Users/stanleyz/.boot2docker/certs/boot2docker-vm

