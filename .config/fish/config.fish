function pg
    ghq list -p | peco | read line
    if [ $line ]
        cd $line
    end
end

function pr
    gh pr list | fzf-tmux | cut -f1 | read line
    if [ $line ]
        gh pr view $line
    end
end

function issue
    gh issue list | fzf-tmux | cut -f1 | read line
    if [ $line ]
        gh issue view $line
    end
end

alias ea='exa -a'
alias el='exa -l'
alias be='bundle exec'
alias di='git diff'
alias ds='git diff --staged'
alias st='git status'
alias rrf='rake routes | fzf-tmux'
alias rrp='rake routes | peco'
alias pgrep='pgrep -L'

export EDITOR=vi
export LANG=ja_JP.UTF-8
export LESS='-i -M -R -W'
export PAGER=less
export GEMSRC_USE_GHQ=1
export GOPATH=$HOME/go
export BAT_THEME=zenburn
export HOMEBREW_NO_INSTALL_CLEANUP=1

set -gx PATH /usr/local/bin /usr/sbin $PATH
set -gx PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
set -gx MANPATH /usr/local/opt/coreutils/libexec/gnuman $MANPATH

if which rbenv > /dev/null
  rbenv init - | source
end

if type direnv > /dev/null
  eval (direnv hook fish)
end

set -gx PATH $HOME/bin $PATH

complete -c sshrc -w ssh
complete -c aws -f -a '(begin; set -lx COMP_SHELL fish; set -lx COMP_LINE (commandline); /usr/local/bin/aws_completer; end)'
