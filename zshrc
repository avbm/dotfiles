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


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh
[ -f  /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
# widget to go to repo with CTRL-G
export DEV_ROOT=$HOME/dev
fzf-repo-widget() {
  local cmd="${FZF_CTRL_G_COMMAND:-"command find -L $DEV_ROOT -mindepth 1 -maxdepth 3 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) \
    -prune -o -type d -print 2> /dev/null | cut -b$((2 + ${#DEV_ROOT}))-"}"
  setopt localoptions pipefail no_aliases 2> /dev/null
  local dir="$(eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS $FZF_ALT_C_OPTS" $(__fzfcmd) +m)"
  if [[ -z "$dir" ]]; then
    zle redisplay
    return 0
  fi
  cd "$DEV_ROOT/$dir"
  unset dir # ensure this doesn't end up appearing in prompt expansion
  local ret=$?
  zle fzf-redraw-prompt
  return $ret
}
zle     -N   fzf-repo-widget
bindkey '^G' fzf-repo-widget


alias memo="vim $HOME/Documents/memo.md"
alias git-gone="git fetch -p && git branch -vv | grep ' gone\]' | cut -d' ' -f3 | xargs git branch -D $1"
function groot {
    cd $(git rev-parse --show-toplevel)
}

function clean_known_hosts {
    sed -i.bak "${1}d" $HOME/.ssh/known_hosts
}

if [[ "$(uname -s)" == "Linux" ]]; then
    # Set caps lock as esc in case of external keyboard
    setxkbmap -option caps:escape
fi
