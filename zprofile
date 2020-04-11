
# Include a .zprofile_local if it exists
if [ -f $HOME/.zprofile_local ]; then
    source $HOME/.zprofile_local
fi
