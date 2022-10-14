
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
# TODO
```