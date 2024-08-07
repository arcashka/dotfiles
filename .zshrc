# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export DOCKER_OPTS="${DOCKER_OPTS} --insecure-registry apricot-docker.artifact.swf.i.mercedes-benz.com"

bindkey -v
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export EDITOR=nvim
export VISUAL=nvim;
export PATH="$PATH:/home/arcashka/.config/Code/User/globalStorage/ms-vscode-remote.remote-containers/cli-bin:/home/arcashka/.cargo/bin:/opt/nvim/"
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
alias nvim_up='nvim --headless --listen localhost:6666'
alias neovide_connect='neovide --server localhost:6666'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if command -v ssh-agent > /dev/null 2>&1; then
  eval "$(ssh-agent -s)" > /dev/null 2>&1
  ssh-add ~/.ssh/github > /dev/null 2>&1
fi
