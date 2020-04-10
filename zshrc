# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
#ZSH_THEME="agnoster"

# set plugins and enable oh-my-zsh
plugins=(git ssh-agent)
source $ZSH/oh-my-zsh.sh

# set editor
alias vim="nvim"
export EDITOR=nvim

# virtualenv wrapper configs
export WORKON_HOME=$HOME/.venv
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
source $WORKON_HOME/tools/bin/virtualenvwrapper.sh

alias mkvenv=mkvirtualenv
alias mvenv=mvvirtualenv
alias rmvenv=rmvirtualenv

# Random useful aliases
alias cls=clear
alias ssh="ssh -A"  # Pass ssh-agent session to server

# Random useful functions
function gor {
  cd `git rev-parse --show-toplevel`
}

# fetch configs specific to machine
if [ -f $HOME/.zshrc_local ]; then
    source $HOME/.zshrc_local
fi

