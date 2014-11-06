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
export EDITOR='vim'
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib

# Docker
alias rac="docker rm $(docker ps -a | grep Exited | grep -v _keep | awk '{print $3}' | awk 'NR!=1')"
alias rai="docker rmi $(docker images | grep "<none>" | awk '{print $3}' | awk 'NR!=1')"
drb() { 
  host_name=$3
  c_name=$2
  i_name=$1
  cmd="docker run -ti"
  if [[ "X$c_name" != "X" ]]; then
    cmd="$cmd --name='$c_name'"
  fi
  if [[ "X$host_name" != "X" ]]; then
    cmd="$cmd -h $host_name"
  fi
  cmd="$cmd $i_name /bin/bash"
  $cmd
}
