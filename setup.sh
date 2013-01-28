#!/bin/bash

git ls-files | egrep '^\.' | while read file; do
  ln -s $PWD/$file ~
done

git config --global alias.st status
git config --global alias.ci 'commit -v'
git config --global alias.co checkout
git config --global alias.br branch
git config --global color.ui auto
git config --global core.excludesfile ~/.gitignore_global

if [ ! -f $HOME/.git-prompt.sh ]; then
  wget 'https://github.com/git/git/raw/master/contrib/completion/git-prompt.sh' -O $HOME/.git-prompt.sh
fi
