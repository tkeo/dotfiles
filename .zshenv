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
alias s='rails s'
alias c='rails c'

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
export BUNDLER_EDITOR=atom

if [ -d /usr/local/share/chruby ]; then
  source /usr/local/share/chruby/chruby.sh
  source /usr/local/share/chruby/auto.sh
  chruby 2.1
fi

if type direnv > /dev/null; then
  eval "$(direnv hook $0)"
fi

if [ -f ~/.zshenv.local ]; then
  . ~/.zshenv.local
fi
