export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"


# Aliases

alias python="python3"
alias ll="ls -al"
alias zshrc="vim ~/.zshrc"
alias szsh="source ~/.zshrc"
alias rdp='f() {mstsc.exe /v:$1};f'

eval "$(pyenv init -)"
eval "$(starship init zsh)"
