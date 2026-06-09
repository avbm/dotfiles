#!/bin/zsh
#
# .aliases - Set whatever shell aliases you want.
#

# single character aliases - be sparing!
alias _=sudo
alias l="eza --icons=automatic"
alias g=git
alias k=kubectl

# mask built-ins with better defaults
alias vim=nvim
alias vi=nvim
export EDITOR=nvim

# more ways to ls
alias ls="eza --icons=automatic"
alias ll='ls -lh'
alias la='ls -lAh'
alias lla='ls -lAh'
alias ldot='ls -ld .*'
alias llc="ls -lh --color=always"

# fix common typos
alias quit='exit'
alias cd..='cd ..'
alias zd="z ~/.dotfiles"

# tar
alias tarls="tar -tvf"
alias untar="tar -xf"

# find
#alias fd='find . -type d -name'
alias ff='find . -type f -name'

# url encode/decode
alias urldecode='python3 -c "import sys, urllib.parse as ul; \
    print(ul.unquote_plus(sys.argv[1]))"'
alias urlencode='python3 -c "import sys, urllib.parse as ul; \
    print (ul.quote_plus(sys.argv[1]))"'

# misc
alias zshrc='${EDITOR:-vim} "${ZDOTDIR:-$HOME}"/.zshrc'
alias zbench='for i in {1..10}; do /usr/bin/time zsh -lic exit; done'
alias zdot='cd ${ZDOTDIR:-~}'
alias memo="emacsclient -c  -a emacs $HOME/Documents/Notes/memo.org"
alias todo="emacsclient -c  -a emacs $HOME/Documents/Notes/todo.org"
alias cls=clear
alias ssh="ssh -A"  # Pass ssh-agent session to server

