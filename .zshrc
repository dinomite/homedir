### Paths
PATH=.:$HOME/bin:/usr/games:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin:/usr/games/bin:/opt/local/bin:/usr/lib/mpich/bin:/usr/local/mysql/bin:/opt/cxoffice/bin:/opt/CollabNet_Subversion/bin:$HOME/.rvm/bin:$PATH
MANPATH=$HOME/.software/man:/opt/local/man:/opt/local/share/man:$MANPATH

### Prompt variable
# Color the hostname
HOSTNAME=`hostname|sed -e 's/\..*$//'`
if [ $HOSTNAME = 'Caligula' ] || [ $HOSTNAME = 'Caligula.local' ]; then
    export HOST_COLOR="\033[1;35m"
fi
if [ $HOSTNAME = 'claudius' ]; then
    export HOST_COLOR="\033[1;36m"
fi
if [ $HOSTNAME = 'drewble' ]; then
    export HOST_COLOR="\033[1;34m"
fi
if [ $HOSTNAME = 'davinci' ]; then
    export HOST_COLOR="\033[1;31m"
fi

# Color the colon red & capitalize hostname if root
COLON_COLOR='0m'
if [ ${UID} -eq 0 ]; then
    COLON_COLOR='1;31m'
fi
if [ ${UID} -eq 0 ]; then
    HOSTNAME="`echo $HOSTNAME|tr '[a-z]' '[A-Z]'`"
fi

# Set the actual prompt
PROMPT=`echo -ne "$HOST_COLOR$HOSTNAME\033[00m\e[$COLON_COLOR:\033[01;32m%~\033[00m\033[01;33m\$\033[00m "`
#change the titlebar in xterms
PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME}:${PWD}\007"'

### History
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=20000
setopt appendhistory autocd
unsetopt beep
bindkey -v

### Completion
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' glob 1
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=** r:|=** l:|=*'
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' substitute 1
zstyle :compinstall filename '/home/dinomite/.zshrc'

autoload -Uz compinit
compinit

# Different options for ls depending on system
if [ `uname` = Darwin ]; then
    export LS_OPTIONS='-F'
else
    if [ `uname` = FreeBSD ]; then
        export LS_OPTIONS='-G'
    else
        # Probably Linux with GNU utils
        export LS_OPTIONS='--color=auto'
    fi
fi

### Standard variables
export PAGER=/usr/bin/less
export EDITOR='vim -X'
export BROWSER='firefox'
export CC=/usr/bin/gcc
# Make perl localization work
export LC_ALL=C
export LANGUAGE=en_US

### Aliases
alias ls='ls $LS_OPTIONS'
alias ll="ls -l"
alias lo="ls -o"
alias lh="ls -lh"
alias la="ls -la"
alias sl="ls"
alias l="ls"
alias s="ls"
# Make rming a slow and painful process
#alias rm="rm -i"
# Why doesn't everyone have these?
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."
# No X with vim
alias vim='vim -X'
# Always use extended regex
alias grep="egrep"
# Grep with line numbers and colors
alias G="grep -n --color=always --binary-file=without-match --exclude=tags --exclude=*-min.js --exclude-dir='.[a-zA-Z]*'"
# Find processes
alias paux="ps aux|grep -i"
# Get more math functions, no startup message
alias bc='bc -lq'
# See man pages from all sections
alias man="man -a"
# Is someone looking over your shoulder?
alias c="clear"
alias logout="clear; logout"
# Debian package management
alias searchy="apt-cache search"
alias birth="aptitude install"
# Info pages are crap. make them slightly less so.
alias info="info --vi-keys"
# Find big files (and hidden big files)
alias ducks="du -ms *|sort -n"
alias duckshid="du -ms .*|sort -n"
# Show the differences when watching
alias watch="watch -d"
# Why doesn't BitchX load the rc by default?
alias BitchX="BitchX -b"
# Continue wget downloads if possible
alias wget="wget  -c"
alias screen='TERM=screen screen'
alias jobs="jobs -l"
alias bwm-ng="bwm-ng -u bytes -T avg"
alias bwmon='bwmon -b'
alias xterm="xterm -bg black -fg white"
alias mkisofs="mkisofs -r -R -J -l -f"
alias svndiffvim='svn diff --diff-cmd ~/bin/svnvimdiff'
alias nslookup="nslookup -sil"
alias tether="ssh -D7070 -l root"
alias wgetdir="wget -r -nH --no-parent"
alias wgetmirror="wget --mirror -U Firefox/1.5 -p --html-extension --convert-links"

### Compiling
alias gcc='cowsay "Hello"; gcc'
alias g++='cowsay "Hello"; g++'
alias make='cowsay "Hello"; nice -n 10 make'
alias javac='cowsay "Hello"; javac'

### Functions
# Get the version of a Perl module
function perlmodver {
    perl -M$1 -e 'print "Version " . $ARGV[0]->VERSION . " of " . $ARGV[0] . " is installed.\n"' $1
}

# I often want awk '{print <var>}'
function fawk {
    first="awk '{print "
    last="}'"
    cmd="${first}\$${1}${last}"
    eval $cmd
}

### Remote Machines
alias claudius="ssh -Y dinomite@dinomite.net"
alias caligula="ssh -Y dinomite@caligula.dinomite.net"
alias tycho="ssh -Y dinomite@tycho"
alias augustus="ssh -Y dinomite@augustus.dinomite.net"
alias congresslaw="ssh -Y dinomite@congresslaw.net"
#CSH
alias tempest="ssh -Y dinomite@tempest.csh.rit.edu"
alias fury="ssh -Y dinomite@fury.csh.rit.edu"
alias tonka="ssh -Y dinomite@tonka.csh.rit.edu"
alias whitefox="ssh dinomite@whitefox.csh.rit.edu"
alias neverforget="ssh -Y root@neverforget.csh.rit.edu"
alias scorn="ssh -Y scorn.csh.rit.edu"
alias jake="ssh -Y jake.csh.rit.edu"
alias hactar="ssh -Y jake.csh.rit.edu"
alias gcart="ssh gcart.csh.rit.edu"
alias wariniraq="ssh -Y wariniraq.csh.rit.edu"
alias katrina="ssh -Y root@katrina.csh.rit.edu"
#CS
alias hilly="ssh -Y dgs4466@hilly.cs.rit.edu"
alias queeg="ssh -Y dgs4466@queeg.cs.rit.edu"
alias slartibartfast="ssh -Y dgs4466@slartibartfast.cs.rit.edu"
alias paradox="ssh -Y dgs4466@paradox.cs.rit.edu"
alias paranoia="ssh -Y dgs4466@paranoia.cs.rit.edu"
#alias csproj="ssh -Y p334-01h@queeg.cs.rit.edu"
#alias dbcproject='ssh -Y p485-01e@slartibartfast.cs.rit.edu'
#RIT
alias grace="ssh dgs5364@grace.rit.edu"
#Genius
# Open an SSH tunnel from localhost:9999 to drewble via dev1
# then, open a dynamic tunnel on localhost:7070 to drewble
alias drewble="ssh -f -N dev1 -L 9999:drewble.genius.local:22; ssh -D7070 -p 9999 drew@localhost"
alias davinci="ssh dstephens@davinci"
alias higgs="ssh dstephens@higgs"
alias dev1="ssh dstephens@dev1"
alias euclid="ssh dstephens@euclid"
alias einstein="ssh dstephens@einstein"
alias trymarketinggenius.com="ssh dstephens@www.trymarketinggenius.com"
alias trysalesgenius.com="ssh dstephens@www.trymarketinggenius.com"
alias rewriterKill='sudo kill `ps aux|grep rewriter|grep root|grep httpd|cut -c10-14`'
alias dev1db='mysql -u mgdev -h 192.168.10.97 -p mg'
alias dev2db='mysql -u mgdev -h 192.168.30.111 -p mg'
alias stg1db='mysql -u mg -h 192.168.30.63 -P 3307 -p mg'
alias stg2db='mysql -u mg -h 192.168.30.63 -P 3308 -p mg'
