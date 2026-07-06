alias s='git status'
alias d='git diff'
alias l='git log'
alias gfo='git fetch origin'
alias gfu='git fetch upstream'
alias gsm='git show-ref --verify --quiet refs/heads/master && git switch master || git switch main'

# git branch-sort
alias gbs='git for-each-ref --sort=committerdate refs/heads/'

alias e='emacs -nw'
alias ec='emacsclient -c'
alias eq='emacs -nw -Q'
alias ekill='emacsclient -e "(kill-emacs)"'

alias xup='xrdb ~/.Xresources'

alias dquilt="quilt --quiltrc=${HOME}/.quiltrc-dpkg"
complete -F _quilt_completion -o filenames dquilt
