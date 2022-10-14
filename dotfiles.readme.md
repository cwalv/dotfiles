
Based on https://www.atlassian.com/git/tutorials/dotfiles

This was created with (roughly):

```sh
DOTFILESREPO=${HOME}/.dotfiles.git
git init --bare $DOTFILESREPO

alias dfgit='/usr/bin/git --git-dir=$DOTFILESREPO/ --work-tree=$HOME'
dfgit config --local status.showUntrackedFiles no
```

To checkout on a new machine:
`curl -Lks http://cwa.lv/r/dfgit-install | /bin/bash`

Which runs something like:
```sh
#!/bin/bash

set -eou pipefail

## get dotfiles
echo 'Pulling dotfiles repo'
DOTFILESREPO="${HOME}/.dotfiles.git"
cd "${HOME}"
git clone --recurse --bare https://github.com/cwalv/dotfiles.git "$DOTFILESREPO"
git --git-dir="${DOTFILESREPO}/" --work-tree="${HOME}" checkout
git --git-dir="${DOTFILESREPO}/" --work-tree="${HOME}" submodule update --init --recursive
git --git-dir="${DOTFILESREPO}/" --work-tree="${HOME}" config status.showUntrackedFiles no

## init zprezto links
sed -i 's/^source/#source/g' .zshenv
source .zshenv
${ZDOTDIR}/init-zprezto.sh
sed -i 's/^#source/source/g' .zshenv

## set shell
echo 'Setting shell to /bin/zsh'
chsh -s /bin/zsh
```