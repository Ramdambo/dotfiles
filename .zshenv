export EDITOR="nvim"
export PATH="$HOME/.scripts:$HOME/.local/bin:$HOME/.cargo/bin:$PATH"
export GRIM_DEFAULT_DIR="$HOME/Pictures/Screenshots"

alias dotfiles="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias rmf="rm -rf"
alias view="zathura"

alias e="exa"
alias et="exa --tree"
alias eg="exa --long --git"
alias el="exa --long"

alias gcof="git checkout --"

alias mkdir="mkdir -p"

mkcd() {
   mkdir $1
   cd $1
}

fznvim () {
	file=$(fzf)
	nvim $file
}
