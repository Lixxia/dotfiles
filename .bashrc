# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# History
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

# Less 
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
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

cdt() {
    if [[ $(git rev-parse --show-toplevel 2> /dev/null) ]]; then
        cd $(git rev-parse --show-toplevel)
    fi
}

# git parsing for status
parse_git_dirty() {
    if [[ $(git status 2> /dev/null | tail -n1) = "nothing to commit, working tree clean" ]]; then
      echo -e "$(tput setaf 10)  "
    else
      echo -e "$(tput setaf 9)  "
    fi
}

parse_git_branch() {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/╺─╸$(parse_git_dirty)\1/"
}

working_directory() {
    echo -e "$(tput setaf 12)$(pwd | sed "s/${HOME//\//\\\/}//; s/\//  /g")\e[0m"
}

# K8S

kube_ps1() {
    kube_context=$(cat ~/.kube/config | grep "current-context:" | sed "s/current-context: //")
    kube_context="${kube_context:-}"
    kube_namespace=$(kubectl config view --minify --output 'jsonpath={..namespace}')
    kube_namespace="${kube_namespace:-default}"

    if [[ "$KUBE_PS1_ENABLED" == "on" ]]; then
        echo -e "ﴱ\e[1;33m${kube_context}\e[0m╸\e[1;34m${kube_namespace}\e[0m]╺─╸"
    fi
}

kubeoff() {
    export KUBE_PS1_ENABLED="off"
}

kubeon() {
    export KUBE_PS1_ENABLED="on"
}

extract() {
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
sh ~/.colors/base16-gruvbox-dark.sh

# Aliases
alias ls="ls -G"
alias la="ls -A"
alias ll='ls -alF'
alias l='ks -CF'
alias ..="cd .."
alias grep="grep --color=auto"
alias reset="reset && source ~/.bashrc"
alias copy="xclip -selection clipboard"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

#export LS_COLORS='di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
export GREP_COLOR='1;33'

if [ -n "$SSH_CONNECTION" ]; then
  export PS1='┌─╸\[\e[1;32m\]\u@\h\[\e[0;37m\]╺─╸[\[\e[1;34m\]\w\[\e[1;37m\]]$(parse_git_branch)\[\e[1;32m\] \n\[\e[1;37m\]└────╸\[\e[0m\]'
else
  export PS1=$'┌─╸ $(working_directory) $(parse_git_branch)\[\e[1;32m\] \n\[\e[1;37m\]└────╸\[\e[0m\]'
fi
