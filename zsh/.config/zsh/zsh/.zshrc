# The following lines were added by compinstall
zstyle :compinstall filename '/home/surak/.config/zsh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

alias ls='ls -a --color=auto'
alias la="ls -a"
alias grep='grep --color=auto'
alias sd="sudo systemctl start docker.service"
alias lzd=lazydocker

# load promp, which changes what the actual prompt line looks like
fpath=($ZDOTDIR/prompts $fpath)
autoload -Uz prompt_purification_setup && prompt_purification_setup

if [ -f ~/.zsh_aliases ]; then
. ~/.zsh_aliases
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"
