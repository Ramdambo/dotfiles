export EDITOR="nvim"
export PATH="$HOME/.scripts:$HOME/.local/bin:$PATH"
export GRIM_DEFAULT_DIR="$HOME/Pictures/Screenshots"

alias dotfiles="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

grab() {
    GEOM=$(slurp)
    grim -g "$GEOM"
}

mkcd() {
   mkdir -p $1
   cd $1
}

