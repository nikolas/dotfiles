alias ':P'='homeshick pull dotfiles'

alias b='bzr'
alias bs='bzr status'

alias s='git status'
alias d='git diff'
alias l='git log'
alias gfo='git fetch origin'
alias gfu='git fetch upstream'

alias be='bundle exec'
alias br='bundle exec rake'

alias e='emacsclient -t'
alias ec='emacsclient -c'
alias eq='emacs -nw -Q'
alias ekill='emacsclient -e "(kill-emacs)"'

alias xup='xrdb ~/.Xresources'

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  alias ls='ls -F --color'
elif [[ "$OSTYPE" == "darwin"* ]]; then
  alias ls='ls -FG'
fi
