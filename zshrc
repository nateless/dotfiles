# Show contents of directory after cd-ing into it
chpwd() {
  ls -lrthG
}

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Enable completion
autoload -U compinit
compinit

# Disable flow control commands (keeps C-s from freezing everything)
stty start undef
stty stop undef

alias a='ls -lrthG'

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="af-magic"

plugins=(git nateless colorize)

source $ZSH/oh-my-zsh.sh

. z

HISTSIZE=10000
SAVEHIST=10000
