# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="robbyrussell"

export EDITOR='chic -w'

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/Users/admin/.rvm/gems/ruby-2.0.0-preview2/bin:/Users/admin/.rvm/gems/ruby-2.0.0-preview2@global/bin:/Users/admin/.rvm/rubies/ruby-2.0.0-preview2/bin:/Users/admin/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/git/bin

# for Homebrew installed rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi