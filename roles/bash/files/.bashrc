set +o posix

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export PATH="$HOME/.local/bin:/usr/local/bin:$HOME/go/bin:/usr/local/go/bin:/opt/homebrew/bin:$PATH"
export GOROOT=/usr/local/go

# Bash Completion
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

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

# PROMPT

show_color() {
    perl -e 'foreach $a(@ARGV){print "\e[48:2::".join(":",unpack("C*",pack("H*",$a)))."m \e[49m "};print "\n"' "$@"
}

working_directory() {
    printf "$(tput setaf 8)$(tput setaf 12)$(tput setab 8)$(pwd | gsed "s@${HOME}@ @; s@/@  @g")\e[0m$(tput setaf 8)\e[0m"
}

parse_git_branch() {
    branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null) || return
    if [[ $(git status 2> /dev/null | tail -n1) = "nothing to commit, working tree clean" ]]; then
      # printf "$(tput setaf 10)"
      printf "$(tput setaf 10)$(tput setab 10)$(tput setaf 8) $branch\e[0m$(tput setaf 10)\e[0m"
    else
      # printf "$(tput setaf 9)"
      printf "$(tput setaf 9)$(tput setab 9)$(tput setaf 8) $branch\e[0m$(tput setaf 9)\e[0m"
    fi
}

# MISC

push() {
    branch=$(git rev-parse --abbrev-ref HEAD)
    if [[ "$branch" == "main" ]]; then
        echo "Will not push to main."
    elif [[ "$branch" == "master " ]]; then
        echo "Will not push to master."
    else
        git push origin $(git rev-parse --abbrev-ref HEAD)
    fi
}

cdt() {
    if [[ $(git rev-parse --show-toplevel 2> /dev/null) ]]; then
        cd $(git rev-parse --show-toplevel)
    fi
}

ttf() {
    curl -o /dev/null -H 'Cache-Control: no-cache' -s -w "Connect: %{time_connect} TTFB: %{time_starttransfer} Total time: %{time_total} \n" $1
}

# K8S
alias k="kubectl"
alias ko="kubeon"
alias koff="kubeoff"
alias kns="kubens 2> /dev/null"
alias kgn="kubectl get nodes -L node.kubernetes.io/type --sort-by=.metadata.creationTimestamp"
source "/etc/bash_completion.d/kubectl"
complete -F __start_kubectl k
export KUBE_EDITOR="nvim"

sort_by() {
    echo "--sort-by=.metadata.creationTimestamp"
}

kube_ps1() {
    kube_context=$(cat ~/.kube/config | grep "current-context:" | sed "s/current-context: //")
    kube_context="${kube_context:-}"
    kube_namespace=$(kubectl config view --minify --output 'jsonpath={..namespace}')
    kube_namespace="${kube_namespace:-default}"

    if [[ "$KUBE_PS1_ENABLED" == "on" ]]; then
        printf "$(tput setaf 8)$(tput setaf 5)$(tput setab 8) ${kube_context}   ${kube_namespace}\e[0m$(tput setaf 8)\e[0m"
    fi
}

kubeoff() {
    export KUBE_PS1_ENABLED="off"
}

kubeon() {
    export KUBE_PS1_ENABLED="on"
}

kc () {
    kubectx ${1}
}

# kc() {
#     local acc=${1:-}
#     case $acc in)
#         sandbox)
#             jps sandbox
#             ;;
#         *)
#             ;;
#     esac
#     kubectx $acc
# }

# Helpers

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

# ALIASES
alias ls="ls -G"
alias la="ls -A"
alias ll='ls -alF'
alias l='ks -CF'
alias ..="cd .."
alias grep="grep --color=auto"
alias reset="reset && source ~/.bashrc"
alias copy="xclip -selection clipboard"
alias restart-sound="pulseaudio -k && sudo alsa force-reload"
alias vi="nvim"
alias vim="nvim"
alias vvim="vim"
alias vimdiff="nvim -d"

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

export GREP_COLOR='1;33'

if [ -n "$SSH_CONNECTION" ]; then
  export PS1='┌─╸\[\e[1;32m\]\u@\h\[\e[0;37m\]╺─╸[\[\e[1;34m\]\w\[\e[1;37m\]]$(parse_git_branch)\[\e[1;32m\] \n\[\e[1;37m\]└────╸\[\e[0m\]'
else
    export PS1=$'$(working_directory) $(parse_git_branch) $(kube_ps1) $(curprofile) $([ \j -gt 0 ] && echo "\e[1;32m\]")\[\e[1;32m\] \n\[\e[0;37m\]  \[\e[0m\]'
fi

_getprofiles() {
    COMPREPLY=($(compgen -W "$(sed -n 's#^\[\(.*\)\]#\1#p' ~/.aws/config | sort -u)" -- "${COMP_WORDS[1]}"))
}

aps () {
    if [ -z "$1" ]; then
        echo $AWS_DEFAULT_PROFILE
        return
    fi

    export AWS_DEFAULT_PROFILE=$1
    printf "$(echo $1)"
}

curprofile() {
    aws_profile="$AWS_DEFAULT_PROFILE"
    if [[ "${aws_profile}" == "prod" ]]; then
      printf "$(tput setaf 8)$(tput setaf 1)$(tput setab 8) $AWS_DEFAULT_PROFILE\e[0m$(tput setaf 8)\e[0m"
    elif [[ -z "${aws_profile}" ]]; then
      printf "$(tput setaf 8)$(tput setaf 12)$(tput setab 8) -\e[0m$(tput setaf 8)\e[0m"
    else
      printf "$(tput setaf 8)$(tput setaf 12)$(tput setab 8) $AWS_DEFAULT_PROFILE\e[0m$(tput setaf 8)\e[0m"
    fi
    # printf "$(tput setaf 8)$(tput setaf 12)$(tput setab 8)$(pwd | gsed "s@${HOME}@ @; s@/@  @g")\e[0m$(tput setaf 8)\e[0m"
}
complete -F _getprofiles aps
