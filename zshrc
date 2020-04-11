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

function add_to_path {
    # echo "PATH: ${PATH}"
    if grep -q $1: <<< $PATH \
        || grep -q :$1: <<< $PATH \
        || grep -q :$1 <<< $PATH; then
      return
    else
      export PATH=$PATH:$1
    fi
}

# Add local user bin to PATH
add_to_path $HOME/bin

# go related settings
export GOPATH=$HOME/dev/go
add_to_path $GOPATH/bin

# rust related settings
# CARGO_HOME=/Users/amodm/.cargo/bin
add_to_path $HOME/.cargo/bin

# fetch configs specific to machine
if [ -f $HOME/.zshrc_local ]; then
    source $HOME/.zshrc_local
fi

