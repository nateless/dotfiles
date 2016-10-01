# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="af-magic"

plugins=(git nateless colorize)

source $ZSH/oh-my-zsh.sh

. z

HISTSIZE=10000
SAVEHIST=10000
