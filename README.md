# My dotfiles
This directory contains the dotfiles for my system

## Requirements
Ensure you have the following installed on your system

```
git stow
```

## Installation
First, check out the dotfiles repo in your $HOME directory using git
```
$ git clone git@github.com:hakouguelfen/dotfiles2.git
$ git clone git@codeberg.org:hakouguelfen/dotfiles.git
$ cd dotfiles2
```

then use GNU stow to create symlinks
```
$ stow -t ~ --ignore=README.md .
```

use this to auto remove previous config
```
$ stow --adopt .
```
