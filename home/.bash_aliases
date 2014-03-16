alias s='git status'
alias d='git diff'
alias l='git log'
alias gfo='git fetch origin'

alias be='bundle exec'
alias br='bundle exec rake'
alias bd='be rake db:migrate; be rake db:test:prepare'

alias tobe='cd ~/src/ToBe'

alias e='emacsclient -t'
alias ec='emacsclient -c'
alias eq='emacs -Q'
alias ekill='emacsclient -e "(kill-emacs)"'

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  alias ls='ls -hF --color'
elif [[ "$OSTYPE" == "darwin"* ]]; then
  alias ls='ls -hFG'
fi

#vimpager=$(which vimpager)
#if [[ -x "$vimpager" ]]; then
#  export PAGER=vimpager
#fi
