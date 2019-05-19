# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
unsetopt nomatch
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/danielg/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#
zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "$key[Up]"   ]] && bindkey -- "$key[Up]"   up-line-or-beginning-search
[[ -n "$key[Down]" ]] && bindkey -- "$key[Down]" down-line-or-beginning-search

export PATH=$HOME/.local/bin:$PATH

powerline-daemon -q
. /usr/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh

# Antigen stuff
source /usr/share/zsh/share/antigen.zsh

antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle wd
antigen bundle npm
antigen bundle vscode
antigen bundle python
antigen bundle archlinux
antigen bundle sudo

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
# antigen theme evan 
antigen theme agnoster

# Tell Antigen that you're done.
antigen apply

source /usr/share/nvm/init-nvm.sh
alias gogh="./.local/share/gogh"

mkcd() {
   mkdir -p $1
   cd $1
}

alias points="$CURRENT_TERM/points"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

