# Dotfiles

It's annoying to remember to copy these everywhere. It can be good practice to symlink the files to this repository so everything stays up to date.

Please note the .gitignore in this directory, which can be used for the global gitignore
```git config --global core.excludesfile ~/.gitignore```

## Atom

Be sure to install Atom and then replace the config.cson with the one in the .atom directory here.

## Fish/Fisherman

Most of the fish configuration is done via installing plugins with Fisherman. The fishfile is useful for this. Note that you shouldn't simply symlink the whole .config/fish directory, as there's a lot of stuff that shouldn't go into version control
