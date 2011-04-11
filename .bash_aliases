#########################
##### Basic Aliases #####
#########################
alias ls='ls $LS_OPTIONS'
alias ll="ls -l"
alias lo="ls -o"
alias lh="ls -lh"
alias la="ls -la"
alias sl="ls"
alias l="ls"
alias s="ls"
#alias rm="rm -i"    # Make rming a slow and painful process
# Show most recent files at the bottom
alias ltr="ls -ltr"

# Why doesn't everyone have these?
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."

# Always use extended regex
alias grep="egrep"
# Grep with line numbers and colors
alias G="grep -n --color=always --binary-file=without-match --exclude=tags --exclude=*-min.js --exclude-dir='.[a-zA-Z]*' --exclude-dir='external' --exclude-dir='blib'"
# Add recursive & insensitive matching
alias GR="G -r"
alias GRI="G -r -i"
alias GIR="GRI"
alias IGR="GRI"
alias IRG="GRI"
# Ack is too hard to type
alias a="ack"
# Better find
alias findr='findr.sh'
alias findra='findr.sh -a'

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

alias which='type -a'
alias h="history |grep"
# Info pages are crap. make them slightly less so.
alias info="info --vi-keys"
# Why doesn't BitchX load the rc by default?
alias BitchX="BitchX -b"
# Continue wget downloads if possible
alias wget="wget --no-check-certificate -c"
# Reset terminal escape code http://forums.gentoo.org/viewtopic-t-444558-start-0.html
alias nethack='echo -e "\033c"; nethack'
alias bcvissh="bcvi --wrap-ssh --"
alias screen='TERM=screen screen'
alias jobs="jobs -l"
alias bwm-ng="bwm-ng -u bytes -T avg -i getifaddrs"
alias xterm="xterm -bg black -fg white"
alias mkisofs="mkisofs -r -R -J -l -f"
alias svnst='svn st'
alias svndiffvim='svn diff --diff-cmd ~/bin/svnvimdiff'
alias nslookup="nslookup -sil"
alias tether="ssh -D7070 -l root"
alias wgetdir="wget -r -nH --no-parent"
alias wgetmirror="wget --mirror -U Firefox/1.5 -p --html-extension --convert-links"
# Print 2 columns, big header, landscape mode, code highlighting, color,
# and use arrows to mark wrapped lines
alias enscript='enscript -2Gr -E --color -C --mark-wrapped-lines=arrow'
# rsync the files (but not metadata or vim tmp files) of an SVN checkout
alias syncsvn='rsync -a --exclude=".svn*" --exclude=".*.swp" --exclude=".*.swo"'
alias perldoc='PAGER="" perldoc'
alias pd='perldoc'

# Hide a bunch of crap in dig
alias dig='dig +nocomments +noquestion +nocmd +nostats'

alias gti='git'
# A short git log
alias gitl='git l -n3'
alias gits='git st'

alias routes='netstat -nr -f inet'

#####################
##### Compiling #####
#####################
alias gcc='cowsay "gcc"; gcc'
alias g++='cowsay "g++"; g++'
alias make='cowsay "make"; nice -n 10 make'
alias javac='cowsay "javac"; javac'

###########################
##### Remote Machines #####
###########################
alias claudius="ssh dinomite@dinomite.net"
alias caligula="ssh dinomite@caligula.dinomite.net"
alias titus="ssh dinomite@titus.dinomite.net"
alias congresslaw="ssh dinomite@congresslaw.net"

##### CSH #####
alias tempest="ssh dinomite@tempest.csh.rit.edu"
alias fury="ssh dinomite@fury.csh.rit.edu"
alias tonka="ssh dinomite@tonka.csh.rit.edu"
alias whitefox="ssh dinomite@whitefox.csh.rit.edu"
alias scorn="ssh scorn.csh.rit.edu"
alias jake="ssh jake.csh.rit.edu"
alias hactar="ssh jake.csh.rit.edu"
alias rancor="ssh rancor.csh.rit.edu"
