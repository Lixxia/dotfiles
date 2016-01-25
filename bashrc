function parse_git_dirty {
    if [[ $(git status 2> /dev/null | tail -n1) = "nothing to commit, working directory clean" ]]; then
      echo -e '\e[1;32m'
    else
      echo -e '\e[1;31m'
    fi
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ ──$(parse_git_dirty) \1/"
}

# Gruvbox color fix for 256-color terminals.
source ~/.vim/colors/gruvbox256.sh

alias ls="ls --color=auto"
alias la="ls -A"
alias ..="cd .."
alias grep="grep --color=auto"
alias reset="reset && source ~/.bashrc"
alias copy="xclip -selection clipboard"

mkcd() {
  mkdir -p "$@" && cd "$@"
}

export LSCOLORS="exfxcxdxbxegedabagacad"
export LS_COLORS='di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
export GREP_COLOR='1;33'

export PS1='┌─── \e[1;32m\t\e[0;37m ── \e[1;34m\w\e[1;37m$(parse_git_branch)\e[1;32m \n\e[1;37m└─\e[1;35m\u\e[0;36m@\e[1;33m\h:~\e[0;37m\$\e[0m '

