
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


