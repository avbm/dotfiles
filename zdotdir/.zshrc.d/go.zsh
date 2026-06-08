
export GOPATH=$HOME/dev/go
alias goupdate="go list -m -json all | jq -r 'select( (.Indirect==null or .Indirect==false) and .Main==null) | (.Path) + \"@\" + (.Version)' | xargs go get -u && go mod tidy"
alias goupdate-latest="go list -m -json all | jq -r 'select( (.Indirect==null or .Indirect==false) and .Main==null) | (.Path) + \"@latest\"' | xargs go get -u && go mod tidy"


