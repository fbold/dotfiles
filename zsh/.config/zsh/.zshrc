# The following lines were added by compinstall
zstyle :compinstall filename '/home/surak/.config/zsh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# load promp, which changes what the actual prompt line looks like
#fpath=($ZDOTDIR/prompts $fpath)
#autoload -Uz prompt_purification_setup && prompt_purification_setup

# add startship (https://starship.rs/)
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# ls colors generated with vivid
export LS_COLORS="$(vivid generate gruvbox-dark)"

# default editor
export EDITOR=nvim

# allow ctrl+arrow
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

if [ -f ~/.config/zsh/.zsh_aliases ]; then
. ~/.config/zsh/.zsh_aliases
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[ -s "$HOME/.cargo/env" ] && \. "$HOME/.cargo/env"

# add ~/bin to path so can run my own installed apps, like appimages
[ -d "$HOME/bin" ] && export PATH="$PATH:$HOME/bin"
[ -d "$HOME/go/bin" ] && export PATH="$PATH:$HOME/go/bin"
