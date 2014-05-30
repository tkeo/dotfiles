#!/bin/bash

git ls-files | egrep '^\.' | while read file; do
  ln -s $PWD/$file ~
done
