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

git_status() {
  if [ -n "$(current_branch)" ]; then
    echo "%{$fg[red]%}[$(current_branch)]%{$reset_color%}"
  fi
}

# from oh-my-zsh/plugins/git/git.plugin.zsh
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

PROMPT=' %{%(?.$fg[green].$fg[red])%}$%{$reset_color%} '
RPROMPT='%~ $(git_status)%{$fg[yellow]%}[`rbenv version | sed -e "s/ (.*$//"`]%{$reset_color%} '

bindkey -e
bindkey ' ' magic-space
bindkey "^P" history-beginning-search-backward
bindkey "^N" history-beginning-search-forward

setopt correct correct_all
setopt auto_list always_last_prompt list_types
setopt rec_exact auto_remove_slash no_auto_param_slash magic_equal_subst
setopt auto_pushd pushd_to_home pushd_silent pushd_minus pushd_ignore_dups
setopt auto_cd cdable_vars
setopt globdots extended_glob equals rc_quotes
setopt extended_history share_history append_history hist_ignore_dups bang_hist
setopt hist_ignore_space
setopt notify long_list_jobs auto_resume no_bg_nice
setopt no_beep no_clobber no_prompt_cr rm_star_silent
setopt no_checkjobs
setopt transient_rprompt prompt_subst

zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}'

setenv() { export $1=$2 }

chpwd() {
  ls
}

if [ -f ~/.zshrc.local ]; then
  . ~/.zshrc.local
fi
