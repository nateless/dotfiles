# nateless Dot Files

These are config files to set up a system the way I like it. It now uses [Oh My ZSH](https://github.com/robbyrussell/oh-my-zsh).

## Installation

Run the following commands in your terminal. It will prompt you before it does anything destructive.

```terminal
git clone git://github.com/nateless/dotfiles ~/.dotfiles
cd ~/.dotfiles
rake install
```

After installing, open a new terminal window to see the effects.

Feel free to customize the .zshrc file to match your preference.


## Features

Many of the following features are added through the "nateless" Oh My ZSH plugin.

There are several features enabled in Ruby's irb including history and completion. Many convenience methods are added as well such as "ri" which can be used to get inline documentation in IRB. See irbrc file for details.


## Uninstall

To remove the dotfile configs, run the following commands. Be certain to double check the contents of the files before removing so you don't lose custom settings.

```
unlink ~/.bin
unlink ~/.gitignore
unlink ~/.gemrc
unlink ~/.gvimrc
unlink ~/.irbrc
unlink ~/.vim
unlink ~/.vimrc
rm ~/.zshrc # careful here
rm ~/.gitconfig
rm -rf ~/.dotfiles
rm -rf ~/.oh-my-zsh
```

Then open a new terminal window to see the effects.
