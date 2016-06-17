
autoload -Uz compinit
compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' ignore-parents parent pwd ..
# zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
#                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
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

#bindkey -v
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

alias sed='gsed'
alias be='bundle exec'
alias machine='docker-machine'


export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=vim
#export LESS='--tabs=4 --no-init --LONG-PROMPT --ignore-case --SILENT'
export GREP_OPTIONS='--color=auto'
export PROMPT="%d $ "


# source ~/.bin/tmuxinator.bash
[ -f $HOME/.zshrc.mine ] && source $HOME/.zshrc.mine

path=(/usr/local/bin $HOME/bin $HOME/.rbenv/bin $HOME/.nodebrew/current/bin $path)
eval "$(rbenv init -)"
export JAVA_HOME=`/usr/libexec/java_home`

#eval "$(docker-machine env machine1)"

alias d="docker"
alias dc="docker-compose"
if [ -s "/usr/local/bin/dinghy" ] ; then
  alias dm="dinghy"
  alias dm-start="dinghy start && eval \"\$(dinghy shellinit)\""
  alias dm-restart="dinghy restart && eval \"\$(dinghy shellinit)\""
  alias dm-env="eval \"\$(dinghy shellinit)\""
else
  alias dm="docker-machine"
  alias dm-start="docker-machine start default && eval \"\$(docker-machine env default)\""
  alias dm-restart="docker-machine restart default && eval \"\$(docker-machine env default)\""
  alias dm-env="eval \"\$(docker-machine env default)\""
fi

#if [ -s "/usr/local/bin/docker-machine" ] ; then
#  dm-env > /dev/null 2>&1
#fi

alias ruby="docker run -it --rm ruby:2.3.1-alpine ruby"
alias irb="docker run -it --rm ruby:2.3.1-alpine irb"
alias aws="docker run -it --rm -v ~/.aws:/root/.aws cgswong/aws aws"
#alias aws ="docker run -it --rm -v ~/.aws:/root/.aws -v .:/tmp/work -w /tmp/work cgswong/aws aws"
alias python="docker run -it --rm python:3-alpine python"
alias aws-python="docker run -it -v ~/.aws:/root/.aws gaishimo/aws-sdk-python python"
alias gcloud="docker run --rm -ti --volumes-from gcloud-config google/cloud-sdk gcloud"
alias bq="docker run --rm -ti -v `pwd`:/tmp/work --volumes-from gcloud-config google/cloud-sdk bq"

export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=$PATH:/usr/local/share/git-core/contrib/diff-highlight
eval "$(rbenv init -)"
alias dynamodblocal="docker run -d -v $HOME/var/log/dynamodblocal:/var/log -v $HOME/var/data/dynamodblocal:/var/dynamodblocal -p 18000:18000 -t takemikami/dynamodblocal"
