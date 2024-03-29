
if [ -f $HOME/.cargo/env ]; then
    source "$HOME/.cargo/env"
fi

if [[ "$(uname -s)" == "Linux" && -f /home/linuxbrew/.linuxbrew/bin/brew ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Include a snap paths if a profile file for them exist
if [ -f /etc/profile.d/apps-bin-path.sh ]; then
    source /etc/profile.d/apps-bin-path.sh
fi

# Include a .zprofile_local if it exists
if [ -f $HOME/.zprofile_local ]; then
    source $HOME/.zprofile_local
fi

