# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

unsetopt correct_all
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="jreese"

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
plugins=(git)

# dont rename window in screen/tmux session
    
if [[ "$TERM" == screen* ]]; then
    # set title once
    DISABLE_AUTO_TITLE=true
else
    export TERM=xterm-16color
fi


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


# User specific environment and startup programs
PATH=$PATH:$HOME/bin:/usr/bin
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export PATH
unset USERNAME

RUBYLIB=$RUBYLIB:.
