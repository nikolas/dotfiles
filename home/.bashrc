if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

export PATH="$HOME/.bin:$PATH"

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
