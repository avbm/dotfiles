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

alias grwd="git rev-parse --show-toplevel"

function groot {
    cd $(git rev-parse --show-toplevel)
}

