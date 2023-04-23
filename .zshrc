# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt autocd beep extendedglob nomatch notify
bindkey -v

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export EDITOR=nvim
export VISUAL=nvim;
export PATH="$PATH:/home/arcashka/.config/Code/User/globalStorage/ms-vscode-remote.remote-containers/cli-bin:/home/arcashka/.cargo/bin"

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/arcashka/.zshrc'

autoload -U colors && colors
PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[white]%}%m %{$fg[red]%}%~ %{$reset_color%}%% "

autoload -Uz compinit
compinit
# End of lines added by compinstall


source /home/arcashka/.config/broot/launcher/bash/br
