alias s='git status'
alias d='git diff'
alias l='git log'
alias gfo='git fetch origin'

alias 4='ssh nik@50.116.28.134'

alias be='bundle exec'
alias br='bundle exec rake'
alias bd='be rake db:migrate; be rake db:test:prepare'

alias tobe='cd ~/src/ToBe'

alias e='emacsclient -t'
alias ec='emacsclient -c'
alias ekill='emacsclient -e "(kill-emacs)"'

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  alias ls='ls -F --color'
elif [[ "$OSTYPE" == "darwin"* ]]; then
  alias ls='ls -FG'
fi

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
