# If not running interactively, don't do anything
[ -z "$PS1" ] && return

set -o vi

# History
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

# Color man pages
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
      man "$@"
}

# make and cd dir
mkcd() {
  mkdir -p "$@" && cd "$@"
}

# git parsing for status
function parse_git_dirty {
    if [[ $(git status 2> /dev/null | tail -n1) = "nothing to commit, working directory clean" ]]; then
      echo -e '\x1B[1;32m'
    else
      echo -e '\x1B[1;31m'
    fi
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/╺─╸$(parse_git_dirty)\1/"
}

extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

# Color fix
sh ~/repos/dotfiles/colors/base16-default.dark.sh

# Aliases
alias ls="ls -G"
alias la="ls -A"
alias ll="ls -la"
alias ..="cd .."
alias grep="grep --color=auto"
alias reset="reset && source ~/.bashrc"
alias copy="xclip -selection clipboard"


export LSCOLORS="exfxcxdxbxegedabagacad"
export LS_COLORS='di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
export GREP_COLOR='1;33'

if [ -n "$SSH_CONNECTIONION" ]; then
  export PS1='┌─╸\[\e[1;32m\]\u@\h\[\e[0;37m\]╺─╸[\[\e[1;34m\]\w\[\e[1;37m\]]$(parse_git_branch)\[\e[1;32m\] \n\[\e[1;37m\]└───╸\[\e[0m\]'
else
  export PS1='┌─╸[\[\e[1;34m\]\w\[\e[1;37m\]]$(parse_git_branch)\[\e[1;32m\] \n\[\e[1;37m\]└───╸\[\e[0m\]'
fi
