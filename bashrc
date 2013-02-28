if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

#PATH=$PATH:$HOME/bin
#export PATH

export EDITOR=vim
export TERM=xterm-color
export LANG=en_US.UTF-8

#export PYTHONPATH=/home/andy/code/lib/python2.7
# Unset PYTHONPATH environment var since we're using virtualenv
unset PYTHONPATH

export PS1=$'\\[\\033]0;\\w\\007\n\\033[32m\\][\u@\h] \\[\\033[33m\\w\\033[0m\\]\n$ '
export PS2=$'> '
export PS4=$'+ '


# Virtual Env and pip settings
export PIP_RESPECT_VIRTUALENV=true
export PIP_DOWNLOAD_CACHE=$HOME/pip_cache
source /usr/local/bin/virtualenvwrapper.sh

# Aliases
#alias ls='ls -Gh'

# Make ipython aware of the current virtualenv
alias ipython="python -c 'import IPython; IPython.embed()'"

alias ll='ls -ls'
alias la='ls -las'

alias sha1sum="openssl dgst -sha1"
alias md5sum="openssl dgst -md5"

alias pf='ps auxf'
alias findp='find . -name \*.py'
alias findj='find . -name \*.java'
alias untar='tar -xzvf'

#alias tunnel_example="ssh -L 20080:localhost:10080 andy@localhost -N"

# ====
# functions
# ====

function ff() { find . -name '*'$1'*' ; }
function ffi() { find . -type f -not -name '*.pyc' -name '*'$1'*' ; } # ignore .pyc files; make this more generic
function gg() { grep -HnIr "$1" . ; }
function gi() { grep -HnIir "$1" . ; }

# ============================
# Virtualenv nosetests helpers
# ============================

function install_nose() {
    cd test/nose/;
    python 'setup.py' install --prefix=~/.virtualenvs/$1;
    cd ../..;
}
alias run_nose="python `which nosetests`"

# Keychain
#==========
eval `keychain --eval --agents ssh id_rsa`

# Display 256 color palette in the shell
# * Useful for customizing terminal multiplexers, etc.
#=======================================================
function terminal_colors() {
    for i in {0..255} ; do
        printf "\x1b[38;5;${i}mcolour${i}\n"
    done
}
