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

# Add local user bin to PATH
export PATH=$PATH:$HOME/bin

# go related settings
export GOPATH=$HOME/dev/go
export PATH=$PATH:$GOPATH/bin

# rust related settings
# CARGO_HOME=/Users/amodm/.cargo/bin
export PATH=$PATH:$HOME/.cargo/bin

# terraform override for core builds
alias terraform="$HOME/bin/terraform"

# Random useful aliases
alias cls=clear
alias ssh="ssh -A"

# fetch configs specific to machine
if [ -f $HOME/.zshrc_local ]; then
    source $HOME/.zshrc_local
fi

