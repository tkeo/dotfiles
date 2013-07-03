alias mv='nocorrect mv'
alias cp='nocorrect cp'
alias mkdir='nocorrect mkdir'
alias bundle='nocorrect bundle'
alias po=popd
alias ll='ls -l'
alias la='ls -A'
alias lh='ls -lh'
alias lsa='ls -ld .*'

alias -g L='| less'
alias -g G='| grep'
alias -g T='| tail'
alias -g C='| pbcopy'
alias -g V='| vi -'

alias be='bundle exec'
alias sp='spring'
alias s='be rails s'
alias c='sp rails c'

case $OSTYPE in
darwin*)
  alias ls='ls -wGF'
  alias pgrep='nocorrect pgrep -L'
  ;;
linux*)
  alias ls='ls -F'
  ;;
esac

export EDITOR=vi
export PAGER=less
export PATH=$HOME/bin:/usr/local/bin:$PATH
export LANG=ja_JP.UTF-8

if [ -f ~/.zshenv.local ]; then
  . ~/.zshenv.local
fi
