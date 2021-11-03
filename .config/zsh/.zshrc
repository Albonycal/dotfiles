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
export DOOMDIR=~/.config/doom
#YTFZF
export FZF_PLAYER="devour mpv --hwdec"
eval "$(ssh-agent -s)" >/dev/null
#starship prompt
source <("/usr/bin/starship" init zsh --print-full-init)
#plugins
source $HOME/.config/zsh/completion.zsh 
source $HOME/.config/zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 
source $HOME/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.config/zsh/key-bindings.zsh
source $HOME/.config/zsh/history.zsh
source $HOME/.config/zsh/vi-mode.plugin.zsh
#fzf
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
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
#func

function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
 else
    for n in "$@"
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.cbt|*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar) 
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.cbr|*.rar) unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.cbz|*.epub|*.zip) unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.apk|*.arj|*.cab|*.cb7|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.pkg|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *.cpio)      cpio -id < ./"$n"  ;;
            *.cba|*.ace) unace x ./"$n"      ;;
            *.zpaq)      zpaq x ./"$n"      ;;
            *.arc)       arc e ./"$n"       ;;
            *.cso)       ciso 0 ./"$n" ./"$n.iso" && \
                              extract $n.iso && \rm -f $n ;;
            *)
                         echo "extract: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
fi
}
#tmux
#tmux -u
#unset TMUX
#alias'es 
alias cls='clear'
alias ls='exa --color auto'
alias l='exa --color auto'
alias ll='exa -la --color auto '
alias la='exa -la --color auto'
alias vim='nvim'
alias v='nvim'
alias mirror="sudo reflector --age 6 --latest 20  --fastest 20 --threads 5 --sort rate --protocol https --save /etc/pacman.d/mirrorlist"
alias tmux='tmux -u'
alias "mpvd"='devour mpv --hwdec'
alias mpv='mpv --hwdec'
alias mupdf='zathura'
alias open='xdg-open'
#https://github.com/anhsirk0/fetch-master-6000
alias dogfetch='fm6000 -color random -dog'
alias pywalr='pywalr ~/pix/wallpapers/'
#dependency aria2c
#alias wget='aria2c -x16 $1'
