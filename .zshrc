# Enable Powerlevel30k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
unsetopt nomatch
bindkey -v

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle :compinstall filename '/home/daniel/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES

# Antigen stuff
source $HOME/.local/bin/antigen.zsh

antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle wd
antigen bundle npm
antigen bundle python
antigen bundle archlinux
antigen bundle MichaelAquilina/zsh-you-should-use

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme romkatv/powerlevel10k

# Tell Antigen that you're done.
antigen apply

 # Beginning search with arrow keys
bindkey -M viins jj vi-cmd-mode

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(direnv hook zsh)"
eval "$(zoxide init zsh)"
eval "$(register-python-argcomplete your_script)"
{ eval `ssh-agent` } &> /dev/null

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="/usr/lib:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/.local/share/coursier/bin:$PATH"

export XDG_CURRENT_DESKTOP=sway
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

