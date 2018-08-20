#!/bin/bash

mkdir -pv ~/.config/fish/functions
mkdir -pv ~/.emacs.d

git ls-files | egrep '^\.' | while read file; do
  ln -sv "$PWD/$file" "$HOME/$file"
done
