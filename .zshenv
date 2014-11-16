alias mv='nocorrect mv'
alias cp='nocorrect cp'
alias mkdir='nocorrect mkdir'
alias bundle='nocorrect bundle'
alias cap='nocorrect cap'
alias spring='nocorrect spring'
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
alias -g P='| peco'

alias be='bundle exec'
alias bo='bundle open'
alias s='rails s'
alias c='rails c'
alias rs='rspec'
alias di='git diff'
alias st='git status'
alias pbo=peco-bundle-open
alias rrp='rake routes | peco'

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
export PATH=/usr/local/bin:$PATH
export LANG=ja_JP.UTF-8
export BUNDLER_EDITOR=atom
export GOPATH=$HOME/.go

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

if type direnv > /dev/null; then
  eval "$(direnv hook $0)"
fi

export PATH=$HOME/bin:$GOPATH/bin:$PATH

if [ -f ~/.zshenv.local ]; then
  . ~/.zshenv.local
fi
