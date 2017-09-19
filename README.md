# Dotfiles

It's annoying to remember to copy these everywhere. It can be good practice to symlink the files to this repository so everything stays up to date.

## Homebrew

Based on [this Medium post](https://medium.com/@satorusasozaki/automate-mac-os-x-configuration-by-using-brewfile-58a78ce5cc53), install [Homebrew](https://brew.sh/), then install Brew bundle with the following command:
```
brew tap Homebrew/bundle
```

This allows the use of the Brewfile to quickly install needed applications.

## Git

The .gitignore in this directory should be used for the global gitignore
```
git config --global core.excludesfile ~/.gitignore
```


## Atom

Be sure to install Atom and then replace the config.cson with the one in the .atom directory here.

## Fish/Fisherman

Most of the fish configuration is done via installing plugins with [Fisherman](https://github.com/fisherman/fisherman). The fishfile is useful for this. Note that you shouldn't simply symlink the whole .config/fish directory, as there's a lot of stuff that shouldn't go into version control

## Vim

In addition to the `.vimrc` file, you need to install [Vundle](https://github.com/VundleVim/Vundle.vim). Follow the installation instructions on their page. The configuration is already taking Fish into account.
