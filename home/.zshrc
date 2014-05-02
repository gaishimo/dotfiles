autoload -Uz compinit
compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' ignore-parents parent pwd ..
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

autoload -Uz colors
colors


HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end




local GREEN=$'%{\e[1;32m%}'
local YELLOW=$'%{\e[1;33m%}'
local BLUE=$'%{\e[1;34m%}'
local DEFAULT=$'%{\e[1;m%}'

autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

# autoload predict-on
# predict-on

bindkey -v
#bindkey -M viins 'jj' vi-cmd-mode
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end



setopt print_eight_bit
setopt interactive_comments
setopt auto_pushd
setopt pushd_ignore_dups
setopt no_beep
setopt nolistbeep
setopt no_flow_control
setopt auto_cd
setopt magic_equal_subst
#setopt share_history
setopt hist_ignore_all_dups
setopt hist_save_nodups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt auto_menu
setopt extended_glob
setopt correct
setopt list_packed

alias where="command -v"
alias j="jobs -l"
alias la='ls -a'
alias ll='ls -l'
alias lf="ls -F"
alias ll="ls -l"
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias sudo='sudo '
alias du="du -h"
alias df="df -h"
alias su="su -l"


alias -g L='| less'
alias -g G='| grep'
if which pbcopy >/dev/null 2>&1 ; then
    # Mac
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
    # Cygwin
    alias -g C='| putclip'
fi

alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'


export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH="/usr/local/heroku/bin:$PATH"
export EDITOR=vim
#export LESS='--tabs=4 --no-init --LONG-PROMPT --ignore-case --SILENT'
export GREP_OPTIONS='--color=auto'

# source ~/.bin/tmuxinator.bash
[ -f $HOME/.zshrc.mine ] && source $HOME/.zshrc.mine
[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh

export PATH=$HOME/.bin:$HOME/.nodebrew/current/bin:$PATH
export JAVA_HOME=`/usr/libexec/java_home`

export DOCKER_HOST=tcp://127.0.0.1:4243
