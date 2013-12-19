# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pygmalion"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rvm rails)

# dont rename window in screen/tmux session
    
if [[ "$TERM" == screen* ]]; then
    # set title once
    DISABLE_AUTO_TITLE=true
    unset DBUS_SESSION_BUS_ADDRESS
else
    export TERM=xterm-256color
fi

# set current dir for tmux
#$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#I") $PWD)

alias vi=vim

vim () {
    (unset GEM_PATH GEM_HOME; command vim "$@")
}

# Module: Change directory with bookmarks
# path: bin/zsh-modules-available/cdbookmarks
function cedit() {
  vim ~/.cdbookmarks
}

function c() {
  NewDir=`egrep "^$1\s." ~/.cdbookmarks \
     | awk '{print $2}'`
  echo cd $NewDir
  cd $NewDir
  unset $NewDir
}

function _c() {
  reply=(`cat ~/.cdbookmarks | awk '{print $1}'`);
}

compctl -K _c c

source $ZSH/oh-my-zsh.sh
export PYTHONSTARTUP=~/.pythonrc

# switch keyboard mapping
alias basic="sudo setxkbmap -variant 'basic'"
alias nodead="sudo setxkbmap -variant 'nodeadkeys'"

alias grep="grep --color"

alias ruby="ruby -I ."
# by default open files in tabs
# alias vi="vi -p"
# alias gvim="gvim -p"

# ask before deletion
alias rm="rm -i"

# solarized theme for dir colors
eval "`dircolors ~/.dircolors`"

alias l="ls"
alias la="ls -a"
alias ll="ls -l"

# start tmux in 256 color mode
alias tmux="tmux -2" 

unsetopt correctall

# User specific environment and startup programs
PATH=$PATH:$HOME/bin:/usr/bin
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export PATH
unset USERNAME


RUBYLIB=$RUBYLIB:.

# load local rvm config
__rvm_project_rvmrc
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
