(( $+commands[brew] )) || return 1
eval $(brew shellenv)


if [[ -d /home/linuxbrew/.linuxbrew/share/zsh/site-functions ]]; then
    fpath=(/home/linuxbrew/.linuxbrew/share/zsh/site-functions/ $fpath)
fi

