# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

if [ -f /etc/bash_completion.d/git ]; then
  . /etc/bash_completion.d/git
fi

if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
  . /usr/local/etc/bash_completion.d/git-completion.bash
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

#export GOROOT="$HOME/go"
export GOPATH="$HOME/gocode"

export PATH="$HOME/.cabal/bin:$HOME/node_modules/.bin:$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/.bin:$HOME/.local/bin:$HOME/local/bin:$PATH"
export PATH="/opt/ghc/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$PATH:$HOME/local/go/bin"

color_my_prompt

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
