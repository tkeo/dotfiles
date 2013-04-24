#!/bin/bash

git ls-files | egrep '^\.' | while read file; do
  ln -s $PWD/$file ~
done

if [ ! -f $HOME/.git-prompt.sh ]; then
  wget 'https://github.com/git/git/raw/master/contrib/completion/git-prompt.sh' -O $HOME/.git-prompt.sh
fi
