function __addspace {
  local space=""
  while read data
  do
    echo " $data"
  done
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
    PS1="$PS1${BLUE}[${CYAN}${WINDOW}${CYAN}\`git branch 2> /dev/null |\
     sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'|__addspace\`"
    PS1="$PS1 ${WHITE}${me}${WHITE}@${WHITE}${hn} ${BLUE}]${WHITE}: "
    PS2=">>>> "
}
__setprompt

function __setprompt_oneline
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
    PS1="${BLUE}[ ${WHITE}${me}${WHITE}@${WHITE}${hn} ${BLUE}]${WHITE}: "
    PS2=">>>> "
}
__setprompt
