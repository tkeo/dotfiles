#!/bin/bash

mkdir -pv ~/.config/fish/functions
mkdir -pv ~/.config/git
mkdir -pv ~/.config/peco
mkdir -pv ~/.emacs.d
mkdir -pv ~/.rbenv

git ls-files | egrep '^\.' | while read file; do
  ln -sv "$PWD/$file" "$HOME/$file"
done
