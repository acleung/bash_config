function __getgitbranch {
  if [ "$(uname)" == "Darwin" ]; then
   local WHITE="\033[00;00m"
   local CYAN="\033[00;36m"
   local RED="\033[00;31m"
   local GREEN="\033[00;32m"
  else
   local WHITE="\0001\e[00;00m\0002"
   local CYAN="\0001\e[00;36m\0002"
   local RED="\0001\e[00;31m\0002"
   local GREEN="\0001\e[00;32m\0002"
  fi

 local branch=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
 if [[ ! -z $branch ]]; then
  if [[ "$branch" != "(no branch)" ]]; then
   reddot=`git status -uno 2> /dev/null | grep "Changes not staged for commit" | sed -e 's/.*/*/'`;
   greendot=`git status -uno 2> /dev/null | grep "Changes to be committed" | sed -e 's/.*/*/'`;
   arrow=`git status -uno 2> /dev/null | grep "Your branch is ahead of" | sed -e 's/.*/^/'`;
   echo -e " ${WHITE}(${GREEN}${arrow}${CYAN}${branch}${RED}${reddot}${GREEN}${greendot}${WHITE})"
  else
   echo -e " ${WHITE}(${CYAN}no branch${WHITE})"
  fi
 fi
}

function __getpwd {
  if [ "$(uname)" == "Darwin" ]; then
   local WHITE="\033[00;00m"
   local GRAY="\033[00;90m"
  else
   local WHITE="\0001\e[00;00m\0002"
   local GRAY="\0001\e[00;90m\0002"
  fi


 local COLORPWD="${WHITE}"
 for dir in `dirs +0 | tr "\/" "\n"`; do
  COLORPWD="${COLORPWD}"$dir"${GRAY}/${WHITE}"
 done
 if [[ ! -z `dirs +0 | grep --color=never ^\/` ]]; then
  COLORPWD="${GRAY}/${COLORPWD}"
 fi
 echo -e " $COLORPWD"
}

function __setprompt
{
  local  WHITE="\[\033[00;00m\]"
  local    RED="\[\033[00;31m\]"
  local  GREEN="\[\033[00;32m\]"
  local   BLUE="\[\033[01;34m\]"
  local   CYAN="\[\033[00;36m\]"
  local   GRAY="\[\033[00;90m\]"
  local YELLOW="\[\033[1;33m\]"

  if [ "$(uname)" == "Darwin" ]; then
   local hn="macbook"
  else
   local hn=`hostname -a | tr -d ' '`
  fi
  local me=`whoami`

  # LINE 1 [ PWD ]
  PS1="${BLUE}["
  PS1="$PS1${RED}\`RET=\$?; if [ \$RET != 0 ] ; then echo \" (\$RET)\"; fi\`"
  PS1="$PS1\$(__getpwd)"
  PS1="$PS1\$(__getgitbranch)"
  PS1="$PS1${BLUE} ]"
  PS1="$PS1\n"
  # LINE 2 
  # First get the current git branch
  PS1="$PS1 ${WHITE}${me}${GRAY}@${WHITE}${hn}${GRAY}:"
  PS1="$PS1 ${WHITE}"
  PS2=">>>> "
}
__setprompt
