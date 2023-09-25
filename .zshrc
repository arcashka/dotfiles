# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

bindkey -v
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export EDITOR=nvim
export VISUAL=nvim;
export PATH="$PATH:/home/arcashka/.config/Code/User/globalStorage/ms-vscode-remote.remote-containers/cli-bin:/home/arcashka/.cargo/bin"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git)

dockerzsh() {
  docker exec -it $1 zsh
}

autoload -Uz compinit
compinit

# Define completion for dockerzsh
_dockerzsh() {
  local -a container_names
  container_names=($(docker ps --format "{{.Names}}"))
  _describe 'values' container_names
}

compdef _dockerzsh dockerzsh

source $ZSH/oh-my-zsh.sh

alias lg="lazygit"
alias devup="devcontainer up --workspace-folder ."

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
