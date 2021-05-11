# Created by albonycal
# *** zshrc ***

#ENV
export XDG_CONFIG_HOME="$HOME/.config"
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
#export MANPAGER="nvim -c 'set ft=man' -"
export TERM="xterm-256color"
export DMEDITOR='nvim'
export EDITOR='nvim'
export DMBROWSER='firefox'
export PATH=$PATH:~/go/bin:~/.local/bin
eval "$(ssh-agent -s)" >/dev/null
#starship prompt
source <("/usr/bin/starship" init zsh --print-full-init)
#plugins
source $HOME/.config/zsh/completion.zsh 
source $HOME/.config/zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 
source /home/albony/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.config/zsh/key-bindings.zsh
source $HOME/.config/zsh/history.zsh
source $HOME/.config/zsh/vi-mode.plugin.zsh
#plugin conf

# Initialize the completion system
autoload -Uz compinit

# Cache completion if nothing changed - faster startup time
typeset -i updated_at=$(date +'%j' -r ~/.config/zsh/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.config/zsh/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi
# Enhanced form of menu completion called `menu selection'
zmodload -i zsh/complist

#alias'es 
alias cls='clear'
alias ls='exa --color auto'
alias l='exa --color auto'
alias ll='exa -la --color auto '
alias la='exa -la --color auto'
alias vim='nvim'
alias v='nvim'
alias mirror='rate-arch-mirrors | sudo tee /etc/pacman.d/mirrorlist'
alias tmux='tmux -u'
alias mpv='mpv --hwdec'
