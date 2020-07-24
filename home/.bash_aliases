alias ':P'='homeshick pull dotfiles'

alias b='bzr'
alias bs='bzr status'

alias s='git status'
alias d='git diff'
alias l='git log'
alias gfo='git fetch origin'
alias gfu='git fetch upstream'
alias gcm='git checkout master'
alias gcd='git checkout -- .'
# git branch-sort
alias gbs='git for-each-ref --sort=committerdate refs/heads/'

alias be='bundle exec'
alias br='bundle exec rake'

alias e='emacs -nw'
alias ec='emacsclient -c'
alias eq='emacs -nw -Q'
alias ekill='emacsclient -e "(kill-emacs)"'

alias xup='xrdb ~/.Xresources'

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  alias ls='ls -F --color'
elif [[ "$OSTYPE" == "darwin"* ]]; then
  alias ls='ls -FG'
fi

alias dquilt="quilt --quiltrc=${HOME}/.quiltrc-dpkg"
complete -F _quilt_completion -o filenames dquilt
