if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

if [ -f /etc/bash_completion.d/git ]; then
  . /etc/bash_completion.d/git
fi

if [ -f /etc/bash_completion.d/git-prompt ]; then
  . /etc/bash_completion.d/git-prompt
fi

if [ -f $HOME/.git-completion.sh ]; then
  . $HOME/.git-completion.sh
fi

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

sd_retval_cond () {
   local ret_val=$?
   if [[ "$ret_val" = "0" ]]; then echo -e "$1"; else echo -e "$2"; fi
   return $ret_val
}
color_my_prompt () {
    local RESET='\[\e[0m\]'     local BOLD='\[\e[1m\]'
    local YELLOW='\[\e[33m\]'   local BLUE='\[\e[34m\]'
    local BLACK='\[\e[30m\]'    local RED='\[\e[31m\]'
    local PINK='\[\e[35m\]'     local CYAN='\[\e[36m\]'
    local GREEN='\[\e[32m\]'    local GRAY='\[\e[37m\]'

    export PS1="$BOLD$BLUE(\u@\h) \$(sd_retval_cond '$GREEN' '$RED')\$(sd_retval_cond :\) \":( \$?\") $YELLOW(\$(date +%H:%M))\n$RESET$BLUE$PINK\w \$$RESET "
}

export EDITOR=vim
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM="auto"
export PATH="$HOME/.cabal/bin:$HOME/node_modules/.bin:$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/.bin:$HOME/local/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"

color_my_prompt

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

if [ -x "$HOME/.pyenv/bin/pyenv" ]; then
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
