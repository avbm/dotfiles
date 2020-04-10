
# Add local user bin to PATH
export PATH=$PATH:$HOME/bin

# go related settings
export GOPATH=$HOME/dev/go
export PATH=$PATH:$GOPATH/bin

# rust related settings
# CARGO_HOME=/Users/amodm/.cargo/bin
export PATH=$PATH:$HOME/.cargo/bin

# Include a .zprofile_local if it exists
if [ -f $HOME/.zprofile_local ]; then
    source $HOME/.zprofile_local
fi
