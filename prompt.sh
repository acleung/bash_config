function __getgitbranch {
 local CYAN="\001\e[00;36m\002"
 local RED="\001\e[00;31m\002"
 local GREEN="\001\e[00;32m\002"
 local branch=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
 local reddot=""
 local greendot=""
 if [[ ! -z $branch ]]; then
  reddot=`git status 2> /dev/null | grep "Changes not staged for commit" | sed -e 's/.*/*/'`;
 fi
 if [[ ! -z $branch ]]; then
  greendot=`git status 2> /dev/null | grep "Changes to be committed" | sed -e 's/.*/*/'`;
 fi
 if [[ ! -z $branch ]]; then
  echo -e " ${CYAN}(${branch}${RED}${reddot}${GREEN}${greendot}${CYAN})"
 fi
}

function __setprompt
{
  local  WHITE="\[\033[00;00m\]"
  local    RED="\[\033[00;31m\]"
  local  GREEN="\[\033[00;32m\]"
  local   BLUE="\[\033[01;34m\]"
  local   CYAN="\[\033[00;36m\]"
  local   GRAY="\[\033[00;37m\]"
  local YELLOW="\[\033[1;33m\]"
  local hn=`hostname -a | tr -d ' '`
  local me=`whoami`

  # LINE 1 [ PWD ]
  PS1="${BLUE}[ ${GRAY}\w"
  PS1="$PS1${RED}\`RET=\$?; if [ \$RET != 0 ] ; then echo \" (\$RET)\"; fi\`"
  PS1="$PS1${BLUE} ]"
  PS1="$PS1\n"
  # LINE 2 
  # First get the current git branch
  PS1="$PS1${BLUE}[\$(__getgitbranch)"
  PS1="$PS1 ${WHITE}${me}${WHITE}@${WHITE}${hn} ${BLUE}]${WHITE}: "
  PS2=">>>> "
}
__setprompt

function __setprompt_oneline {
  local  WHITE="\[\033[00;00m\]"
  local    RED="\[\033[00;31m\]"
  local  GREEN="\[\033[00;32m\]"
  local   BLUE="\[\033[01;34m\]"
  local   CYAN="\[\033[00;36m\]"
  local   GRAY="\[\033[00;37m\]"
  local YELLOW="\[\033[1;33m\]"
  local hn=`hostname -a | tr -d ' '`
  local me=`whoami`

  # LINE 1 [ PWD ]
  PS1="${BLUE}[ ${WHITE}${me}${WHITE}@${WHITE}${hn} ${BLUE}]${WHITE}: "
  PS2=">>>> "
}
