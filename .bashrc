# .bashrc
source /etc/profile
source ~/.bash_global
source ~/.bash_aliases
source ~/.bash_functions
if [ -f ~/.bash_local ]
then
    source ~/.bash_local
fi
if [ -f "$HOME/.cargo/env" ]
then
    source "$HOME/.cargo/env"
fi
