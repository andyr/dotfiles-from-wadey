if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

PATH=$PATH:/sbin:/opt/node/bin:$HOME/bin
export PATH

export EDITOR=vim
export TERM=xterm-color
export LANG=en_US.UTF-8

#export PYTHONPATH=/home/andy/code/lib/python2.7
# Unset PYTHONPATH environment var since we're using virtualenv
#unset PYTHONPATH

export PS1=$'\\[\\033]0;\\w\\007\n\\033[32m\\][\u@\h] \\[\\033[33m\\w\\033[0m\\]\n$ '
export PS2=$'> '
export PS4=$'+ '

# CentOS 6, start ssh-agent
#exec /usr/bin/ssh-agent $SHELL
#ssh-add

# Virtual Env and pip settings
export PIP_RESPECT_VIRTUALENV=true
export PIP_DOWNLOAD_CACHE=$HOME/.pip_cache
#source /usr/local/bin/virtualenvwrapper.sh

# Aliases
#alias ls='ls -Gh'
alias ls='ls --color'
#alias ls='ls -Gh --color=auto'

# Make ipython aware of the current virtualenv
alias ipython="python -c 'import IPython; IPython.embed()'"
alias start-ssh-agent="$(ssh-agent -s)"
alias ll='ls -ls'
alias la='ls -las'

alias sha1sum="openssl dgst -sha1"
alias md5sum="openssl dgst -md5"

alias pf='ps auxf'
alias findp='find . -name \*.py'
alias findj='find . -name \*.java'
alias untar='tar -xvf'      # .tar
alias untargz='tar -xzvf'    # .tar.gz
alias untarbz2='tar -xjvf'   # .tar.bz2

#alias tunnel_example="ssh -L 20080:localhost:10080 andy@localhost -N"
#alias rootlogin_jump='ssh -t <jumpbox> "ssh -t <remote-host> '\''cd <remote-dir> && sudo -H -p Password[%p-\>%U]: -s'\''"'
#alias rootlogin='ssh -t <remote-host> "cd <remote-dir> && sudo -H -p Password[%p-\>%U]: -s"'

# ====
# functions
# ====

function ff() { find . -name '*'$1'*' ; }
function ffi() { find . -type f -not -name '*.pyc' -name '*'$1'*' ; } # ignore .pyc files; make this more generic
function gg() { grep -HnIr "$1" . ; }
function gi() { grep -HnIir "$1" . ; }
function memusage() { ps aux | awk 'NR != 1 {x[$1] += $4} END{ for(z in x) { if(x[z]>0) { print z, x[z]"%" } }}' ; }


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

# Generate keys with:
# ssh-keygen -t rsa -C "your_email@example.com"

# Display 256 color palette in the shell
# * Useful for customizing terminal multiplexers, etc.
#=======================================================
function terminal_colors() {
    for i in {0..255} ; do
        printf "\x1b[38;5;${i}mcolour${i}\n"
    done
}

#mount
# sshfs name@server:/path/to/folder /path/to/mount/point
# fusermount -u  /path/to/mount/point

# The use_env call below is a reusable command to activate/create a new Python
# # virtualenv, requiring only a single declarative line of code in your .env
# files.
# # It only performs an action if the requested virtualenv is not the current
# one.
use_env() {
  typeset venv
  venv="$1"
  if [[ "${VIRTUAL_ENV:t}" != "$venv" ]]; then
    if workon | grep -q "$venv"; then
      workon "$venv"
    else
      echo -n "Create virtualenv $venv now? (Yn) "
      read answer
      if [[ "$answer" == "Y" ]]; then
        mkvirtualenv "$venv"
      fi
    fi
  fi
}
