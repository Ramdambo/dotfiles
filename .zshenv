source /opt/ros/melodic/setup.zsh

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

alias ccc="g++ -x c++ -Wall -O2 -static -pipe -o"
alias ccd="g++ -Wall -Wextra -fsanitize=undefined,address -D_GLIBCXX_DEBUG -g -o"

