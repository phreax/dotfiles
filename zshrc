# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="avit"

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
plugins=(git rvm rails wd python docker tmuxinator)

source $ZSH/oh-my-zsh.sh

# activate vi mode 
bindkey -v

# bind common shortcuts in vi mode
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

# display vi normal mode in prompt
precmd() {
  RPROMPT=""
}

zle-keymap-select() {
  RPROMPT=""
    [[ $KEYMAP = vicmd  ]] && RPROMPT="(CMD)"
      () { return $__prompt_status  }
        zle reset-prompt

}
zle-line-init() {
  typeset -g __prompt_status="$?"
}
zle -N zle-keymap-select
zle -N zle-line-init
export KEYTIMEOUT=1

if [[ "$TERM" == screen* ]]; then
    # set title once
    DISABLE_AUTO_TITLE=true
    unset DBUS_SESSION_BUS_ADDRESS
fi

alias vi=vim

vim () {
    (unset GEM_PATH GEM_HOME; command vim "$@")
}

compctl -K _c c

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
eval "`gdircolors ~/.dircolors`"

alias ls='ls --color=auto'
alias l="ls"
alias la="ls -a"
alias ll="ls -l"

# start tmux in 256 color mode
alias tmux="tmux" 


unsetopt correctall

# User specific environment and startup programs
PATH=$PATH:$HOME/bin
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

# z
source `brew --prefix`/etc/profile.d/z.sh

# python path
# export PYTHONPATH="/Users/micha/dev/objectdetection"
export PYTHONPATH="."

PATH=$HOME/anaconda2/bin:$PATH
export PATH
unset USERNAME


RUBYLIB=$RUBYLIB:.

# load local rvm config
__rvm_project_rvmrc
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

source ~/.aws_credentials
source ~/.api_keys

export LC_ALL=en_US.UTF-8

# pip install and add to requirements
# thanks to http://stackoverflow.com/questions/20006000/install-a-package-and-write-to-requirements-txt-with-pip
pip_install_save() {
    source .venv/bin/activate
    package_name=$1
    shift
    requirements_file='./requirements.txt'
    pip install $package_name "$@" && pip freeze | grep -i "^$package_name==" >> $requirements_file
}

# Uage: update-ec2-host <instance name, e.g. gpu1>
#
# will result in defining the host as ec2-gpu1
update-ec2-host() {
   instance_name=$1 
   hostname="ec2-$instance_name"
   public_ip=`aws ec2 describe-instances --filters "Name=tag:Name,Values=$instance_name" | jq ".Reservations[0].Instances[0].PublicIpAddress" | sed -e 's/"//g'`

   if [ -n $public_ip ]
   then
       old_ip=`cat /etc/hosts |grep $hostname | cut -d' ' -f1`
       if [ -z $old_ip ]
       then 
           echo "No entry found for '$hostname' in /etc/hosts, creating new entry."
           sudo sh -c "echo '$public_ip $hostname' >> /etc/hosts "

           echo "Creating entry in ~/.ssh/config"
           cat <<- EOF >> ~/.ssh/config 
Host $hostname 
    User ubuntu
    IdentityFile ~/.ssh/aws/aws_terraloupe_frankfurt.pem
EOF

           return 0
       fi
       echo "$old_ip -> $public_ip"
       cat /etc/hosts |sed -e "s/^\(.*\) $hostname$/$public_ip $hostname/g" > /tmp/hosts
       sudo mv /tmp/hosts /etc/hosts
   else
       echo "No instance found for '$instance_name'"
       return -1
   fi
}

# Usage: awslogs <group> <stream> [<time ago in minutes>]
awslogs() {
    if [ -n "$3" ]
    then
        to=$(date +%s%3N)
        let "from=$to - $3 * 1000"
        timerange="--start-time $from --end-time $to"
    else
        timerange=""
    fi
    cmd="aws logs filter-log-events --log-group-name $1 --log-stream-names $2 $timerange"
    eval $cmd |jq ".events[].message"


}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
