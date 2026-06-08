fpath+=( "$HOME/.cache/antidote/github.com/mattmc3/ez-compinit" )
source "$HOME/.cache/antidote/github.com/mattmc3/ez-compinit/ez-compinit.plugin.zsh"
fpath+=( "$HOME/.cache/antidote/github.com/zsh-users/zsh-completions/src" )
fpath+=( "$HOME/.cache/antidote/github.com/aloxaf/fzf-tab" )
source "$HOME/.cache/antidote/github.com/aloxaf/fzf-tab/fzf-tab.plugin.zsh"
fpath+=( "$HOME/.cache/antidote/github.com/belak/zsh-utils/completion/functions" )
builtin autoload -Uz $fpath[-1]/*(N.:t)
compstyle_zshzoo_setup
fpath+=( "$HOME/.cache/antidote/github.com/belak/zsh-utils/editor" )
source "$HOME/.cache/antidote/github.com/belak/zsh-utils/editor/editor.plugin.zsh"
fpath+=( "$HOME/.cache/antidote/github.com/belak/zsh-utils/history" )
source "$HOME/.cache/antidote/github.com/belak/zsh-utils/history/history.plugin.zsh"
fpath+=( "$HOME/.cache/antidote/github.com/romkatv/powerlevel10k" )
source "$HOME/.cache/antidote/github.com/romkatv/powerlevel10k/powerlevel10k.zsh-theme"
source "$HOME/.cache/antidote/github.com/romkatv/powerlevel10k/powerlevel9k.zsh-theme"
fpath+=( "$HOME/.cache/antidote/github.com/belak/zsh-utils/utility" )
source "$HOME/.cache/antidote/github.com/belak/zsh-utils/utility/utility.plugin.zsh"
export PATH="$HOME/.cache/antidote/github.com/romkatv/zsh-bench:$PATH"
fpath+=( "$HOME/.cache/antidote/github.com/ohmyzsh/ohmyzsh/plugins/colored-man-pages" )
source "$HOME/.cache/antidote/github.com/ohmyzsh/ohmyzsh/plugins/colored-man-pages/colored-man-pages.plugin.zsh"
fpath+=( "$HOME/.cache/antidote/github.com/ohmyzsh/ohmyzsh/plugins/extract" )
source "$HOME/.cache/antidote/github.com/ohmyzsh/ohmyzsh/plugins/extract/extract.plugin.zsh"
fpath+=( "$HOME/.cache/antidote/github.com/ohmyzsh/ohmyzsh/plugins/git" )
source "$HOME/.cache/antidote/github.com/ohmyzsh/ohmyzsh/plugins/git/git.plugin.zsh"
fpath+=( "$HOME/.cache/antidote/github.com/ohmyzsh/ohmyzsh/plugins/gpg-agent" )
source "$HOME/.cache/antidote/github.com/ohmyzsh/ohmyzsh/plugins/gpg-agent/gpg-agent.plugin.zsh"
fpath+=( "$HOME/.cache/antidote/github.com/zdharma-continuum/fast-syntax-highlighting" )
source "$HOME/.cache/antidote/github.com/zdharma-continuum/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
fpath+=( "$HOME/.cache/antidote/github.com/zsh-users/zsh-autosuggestions" )
source "$HOME/.cache/antidote/github.com/zsh-users/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
fpath+=( "$HOME/.cache/antidote/github.com/unixorn/warhol.plugin.zsh" )
source "$HOME/.cache/antidote/github.com/unixorn/warhol.plugin.zsh/warhol.plugin.zsh"
fpath+=( "$HOME/.cache/antidote/github.com/rkh/zsh-jj" )
source "$HOME/.cache/antidote/github.com/rkh/zsh-jj/zsh-jj.plugin.zsh"
fpath+=( "$HOME/.cache/antidote/github.com/sdiebolt/zsh-ssh-agent" )
source "$HOME/.cache/antidote/github.com/sdiebolt/zsh-ssh-agent/zsh-ssh-agent.plugin.zsh"
