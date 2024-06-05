# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

#ZSH_THEME="amodm"
ZSH_THEME="robbyrussell"
#ZSH_THEME="agnoster"

# override prompt - TODO figure out how to override theme
PROMPT='%{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'
PROMPT+="%(?:%{$fg_bold[green]%}❯ :%{$fg_bold[red]%}❯ )%{$reset_color%}"

# set plugins and enable oh-my-zsh
plugins=(
    git
    ssh-agent
    gpg-agent
    #zsh-completions
    #zsh-autocomplete
    zsh-autosuggestions
    zsh-syntax-highlighting
)
fpath+=~/.zfunc
source $ZSH/oh-my-zsh.sh

# ls alias
if which eza &> /dev/null; then
    alias ls="eza"
fi
alias llc="ls -lh --color=always"

# set editor
alias vim="nvim"
export EDITOR=nvim

# alias deprecated egrep
alias egrep="grep -E"

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
add_to_path $HOME/.local/bin

# go related settings
export GOPATH=$HOME/dev/go
add_to_path $GOPATH/bin

alias goupdate="go list -m -json all | jq -r 'select( (.Indirect==null or .Indirect==false) and .Main==null) | (.Path) + \"@\" + (.Version)' | xargs go get -u && go mod tidy"
alias goupdate-latest="go list -m -json all | jq -r 'select( (.Indirect==null or .Indirect==false) and .Main==null) | (.Path) + \"@latest\"' | xargs go get -u && go mod tidy"

# rust related settings
# CARGO_HOME=/Users/amodm/.cargo/bin
add_to_path $HOME/.cargo/bin

# Add linuxbrew bin dir to path
add_to_path /home/linuxbrew/.linuxbrew/bin

# fetch configs specific to machine
if [ -f $HOME/.zshrc_local ]; then
    source $HOME/.zshrc_local
fi


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh
[ -f  /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
[ -f $HOME/.fzf/shell/key-bindings.zsh ] && source $HOME/.fzf/shell/key-bindings.zsh

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
  zle push-line # Clear buffer. Auto-restored on next prompt.
  BUFFER="cd -- ${DEV_ROOT}/${dir}"
  zle accept-line
  local ret=$?
  unset dir # ensure this doesn't end up appearing in prompt expansion
  zle reset-prompt
  return $ret
  # cd "$DEV_ROOT/$dir"
  # unset dir # ensure this doesn't end up appearing in prompt expansion
  # local ret=$?
  # zle fzf-redraw-prompt
  # return $ret
}
zle     -N   fzf-repo-widget
bindkey '^G' fzf-repo-widget


alias memo="emacsclient -c  -a emacs $HOME/Documents/Notes/memo.org"
alias todo="emacsclient -c  -a emacs $HOME/Documents/Notes/todo.org"
function git-gone {
    GIT_OUT=$(git fetch -p 2>&1)
    echo $GIT_OUT
    GIT_BRANCHES=($(git branch -v | awk '{ print $1}' | grep -v '*'))
    DELETED_BRANCHES=$(echo $GIT_OUT | grep '\[deleted\]' | awk '{ print $NF }' | cut -c8-)
    for branch in $GIT_BRANCHES; do
        if echo $DELETED_BRANCHES | grep $branch &> /dev/null; then
            git branch -D $branch
        fi
    done
    # Cleanup any branches not covered above
    GONE_BRANCHES=($(git branch -vv | grep ' gone\]' | cut -d' ' -f3 | xargs))
    for branch in $GONE_BRANCHES; do
        git branch -D $branch
    done
}
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

# try out the starship prompt
# if command -v starship &> /dev/null; then
#     eval "$(starship init zsh)"
# fi

if [[ "$TERM" == "xterm-kitty" ]]; then
    # ssh has issues with xterm-kitty so using a standard fallback
    export TERM="xterm-256color"
fi

# add autocomplete for kubectl
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)
alias k=kubectl
complete -F __start_kubectl k

# Base16 Shell
export BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"
