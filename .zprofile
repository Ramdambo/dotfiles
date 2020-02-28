export EDITOR="nvim"
export PATH="$HOME/.scripts:$HOME/.local/bin:$PATH"
export GRIM_DEFAULT_DIR="/home/daniel/Pictures/Screenshots"

alias vim="nvim"
alias dotfiles="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias remove="yay -Rns"
alias grab="grim -g \"$(slurp)\""

mkcd() {
   mkdir -p $1
   cd $1
}

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
 exec sway 
fi
