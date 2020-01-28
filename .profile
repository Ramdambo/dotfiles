export EDITOR="nvim"
alias vim="nvim"
export PATH="$HOME/.scripts:$HOME/.local/bin:$PATH"
export GRIM_DEFAULT_DIR="/home/daniel/Pictures/Screenshots"

grab() {
    GEOM=$(slurp)
    grim -g "$GEOM"
}

mkcd() {
   mkdir -p $1
   cd $1
}

# If running from tty1 start sway
if [ "$(tty)" = "/dev/tty1" ]; then
    exec sway
fi
