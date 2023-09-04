export ZSH="$HOME/.oh-my-zsh"

bindkey -v
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export EDITOR=nvim
export VISUAL=nvim;
export PATH="$PATH:/home/arcashka/.config/Code/User/globalStorage/ms-vscode-remote.remote-containers/cli-bin:/home/arcashka/.cargo/bin"
ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

alias lg="lazygit"
