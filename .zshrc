HISTFILE=~/.zsh-history
HISTSIZE=1000000
SAVEHIST=1000000

autoload -U colors
colors
autoload -U compinit
compinit

unlimit
limit -s

umask 022

ruby_version() {
  if [ $RUBY_VERSION ]; then
    echo $RUBY_VERSION
  else
    type rbenv > /dev/null && echo `rbenv version-name`
  fi
}

ruby_info() {
  if [ -n "$(ruby_version)" ]; then
    echo "%{$fg[yellow]%}[$(ruby_version)]%{$reset_color%}"
  fi
}

PROMPT='`whoami`@`hostname`%{%(?.$fg[green].$fg[red])%}$%{$reset_color%} '
RPROMPT='%~ %{$fg[red]%}$(__git_ps1)%{$reset_color%}$(ruby_info) '

bindkey -e
bindkey ' ' magic-space
bindkey "^P" history-beginning-search-backward
bindkey "^N" history-beginning-search-forward

setopt always_last_prompt
setopt append_history
setopt auto_list
setopt auto_pushd
setopt auto_remove_slash
setopt auto_resume
setopt bang_hist
setopt correct
setopt correct_all
setopt equals
setopt extended_glob
setopt extended_history
setopt globdots
setopt hist_ignore_dups
setopt hist_ignore_space
setopt list_types
setopt long_list_jobs
setopt magic_equal_subst
setopt no_auto_param_slash
setopt no_beep
setopt no_bg_nice
setopt no_checkjobs
setopt no_clobber
setopt no_prompt_cr
setopt notify
setopt prompt_subst
setopt pushd_ignore_dups
setopt pushd_minus
setopt pushd_silent
setopt pushd_to_home
setopt rc_quotes
setopt rec_exact
setopt rm_star_silent
setopt share_history
setopt transient_rprompt

zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}'

case "${TERM}" in
xterm*)
  precmd() {
    echo -ne "\033]0;${HOST%%.*}:${PWD}\007"
  }
  ;;
esac

setenv() { export $1=$2 }

chpwd() {
  ls
}

mcd() { mkdir $1 && cd $1 }

function peco-bundle-open() {
    bundle open $(bundle list | grep '*' | peco | awk '{ print $2 }')
}
function peco-gem-edit() {
    gem edit $(gem list | grep -v '*' | peco | awk '{ print $1 }')
}
function peco-gem-search() {
    open "https://rubygems.org/gems/$(gem search $1 | grep -v '*' | peco | awk '{ print $1 }')"
}
function peco-ghq() {
    cd $(ghq list -p | peco)
}

# http://qiita.com/karupanerura/items/65e476755f6348553144
function SELECT () {
    mysql -e "SELECT $*"
}
function SHOW () {
    mysql -e "SHOW $*"
}

alias SELECT="noglob SELECT"
alias SHOW="noglob SHOW"

. /usr/local/etc/bash_completion.d/git-prompt.sh

if [ -f ~/.zshrc.local ]; then
  . ~/.zshrc.local
fi
