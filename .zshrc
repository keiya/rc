# -*- coding: utf-8 -*-
# Author:		Keiya Chinen, keiyac
# lastupdate	2010/07/29

# users generic .zshrc file for zsh(1)

## Environment variable configuration
#
# LANG
#
export LANG=ja_JP.UTF-8
case ${UID} in
0)
    LANG=C
    ;;
esac

## Default shell configuration
#
# set prompt
#
autoload colors
colors
case ${UID} in
0)
    PROMPT='%{[33m%}[%~]%(!.#.$)%{[m%} '
    RPROMPT="%{[32m%}%n@%m%{[m%} %{[36m%}%D{%Y/%m/%d %H:%M:%S}%{[m%}"
    SPROMPT="%r is correct? [n,y,a,e]"

    ;;
*)
    PROMPT='%{[33m%}[%~]%(!.#.$)%{[m%} '
    RPROMPT="%{[32m%}%n@%m%{[m%} %{[36m%}%D{%Y/%m/%d %H:%M:%S}%{[m%}"
    SPROMPT="%r is correct? [n,y,a,e]"
    ;;
esac

# auto change directory
#
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
#
setopt auto_pushd

# command correct edition before each completion attempt
#
setopt correct
setopt correctall

# compacked complete list display
#
setopt list_packed

# no remove postfix slash of command line
#
setopt noautoremoveslash

# no beep sound when complete list displayed
#
setopt nolistbeep


## Keybind configuration
#
# emacs like keybind (e.x. Ctrl-a goes to head of a line and Ctrl-e goes 
#   to end of it)
#
bindkey -v

# historical backward/forward search with linehead string binded to ^P/^N
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end


## Command history configuration
#
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data


## Completion configuration
#
fpath=(~/.zsh/functions/Completion ${fpath})
autoload -U compinit
compinit -u


## zsh editor
#
autoload zed


## Prediction configuration
#
#autoload predict-on
#predict-off


## Alias configuration
#
# expand aliases before completing
#
setopt complete_aliases     # aliased ls needs if file/dir completions work

alias where="command -v"
alias j="jobs -l"

case "${OSTYPE}" in
freebsd*|darwin*)
    alias ls="ls -G -w"
    ;;
linux*)
    alias ls="ls --color=auto"
    ;;
esac

alias la="ls -la"
alias lf="ls -F"
alias ll="ls -lh"

alias du="du -h"
alias df="df -h"

alias su="su -l"
alias cp="cp -i"
alias rm="rm -i"
alias mv="mv -i"

alias grep="grep --color=auto"

# for screen
alias screen="TERM=screen screen -U" 

case "${OSTYPE}" in
darwin*)
    alias updateports="sudo port selfupdate; sudo port outdated"
    alias portupgrade="sudo port upgrade installed"
    ;;
freebsd*)
    case ${UID} in
    0)
        updateports() 
        {
            if [ -f /usr/ports/.portsnap.INDEX ]
            then
                portsnap fetch update
            else
                portsnap fetch extract update
            fi
            (cd /usr/ports/; make index)

            portversion -v -l \<
        }
        alias appsupgrade='pkgdb -F && BATCH=YES NO_CHECKSUM=YES portupgrade -a'
        ;;
    esac
    ;;
esac

export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/bin:$PATH
export MANPATH=$MANPATH:/opt/local/share/man
export LSCOLORS=gxfxxxxxcxxxxxxxxxxxxx

zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
			     /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

export LESS='--tabs=4 --no-init --LONG-PROMPT --ignore-case'


