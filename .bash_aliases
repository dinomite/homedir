#########################
##### Basic Aliases #####
#########################
EXA=`/usr/bin/which exa`
if [ ! -z "$EXA" ]; then
    alias ls="exa"
alias ltr="ls -ls modified"
else
    alias ls="ls $LS_OPTIONS"
    alias ltr="ls -ltr"
fi
alias ll="ls -l"
alias lo="ls -o"
alias lh="ls -lh"
alias la="ls -la"
alias sl="ls"
alias l="ls"
alias s="ls"
alias ld="ls -d"
#alias rm="rm -i"    # Make rming a slow and painful process

# Why doesn't everyone have these?
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."

# Always use extended regex
#alias grep="egrep"
alias cgrep="egrep --color=always"
# Grep with line numbers and colors
alias G="grep -n --color=always --binary-file=without-match --exclude=tags --exclude=*-min.js --exclude-dir='.[a-zA-Z]*' --exclude-dir='external' --exclude-dir='blib'"
# Add recursive & insensitive matching
alias GR="G -r"
alias GRI="G -r -i"
alias GIR="GRI"
alias IGR="GRI"
alias IRG="GRI"
# Ack is too hard to type
alias a="rg"
alias avg="ack --invert-file-match -G"
alias shead="sort|uniq -c|sort -rn|head"
alias t="tail -F"
alias r="rg"

# Find processes
alias paux="ps aux|grep -i"
# Get more math functions, no startup message
alias bc='bc -lq'
# See man pages from all sections
alias man="man -a"

# Is someone looking over your shoulder?
alias c="clear"
alias logout="clear; logout"

# Searching for packages
if [ $OS_TYPE = 'macos' ]; then
    # I use homebrew
    alias searchy="brew search"
elif [ $OS_TYPE = 'freebsd' ]; then
    alias searchy="whereis search"
elif [ $OS_TYPE = 'linux' ]; then
    # Let's just assume it's Debian for now
    alias searchy="apt-cache search"
fi

alias which='type -a'
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
alias svndiffvim='svn diff --diff-cmd ~/bin/svnvimdiff'
alias nslookup="nslookup -sil"
alias wgetdir="wget -r -nH --no-parent"
alias wgetmirror="wget -e robots=off --wait 1 --mirror -U Firefox/11.0 -p --adjust-extension --convert-links --no-parent"
# Print 2 columns, big header, landscape mode, code highlighting, color,
# and use arrows to mark wrapped lines
alias enscript='enscript -2Gr -E --color -C --mark-wrapped-lines=arrow'
alias perldoc='PAGER="" perldoc'
alias pd='perldoc'
alias urldecode='perl -pe '"'"'s/%([0-9a-f]{2})/sprintf("%s", pack("H2",$1))/eig'"'"
alias sharethisdir="echo 'now sharing cur directory at port 9000'; python -m SimpleHTTPServer 9000"
alias ytrip="youtube-dl --max-quality 22 --output '%(title)s.%(ext)s'"
alias chromedev="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --disable-web-security"
# Things I usually want
alias tcpdump="tcpdump -vvnX -s0"

# Maven
alias mci='mvn clean install'
alias mcit='mci -DskipTests'
alias mcp='mvn clean package'
alias mcpt='mcp -DskipTests'
alias mct="mvn clean test"

# Gradle
alias gcb="gw clean build"

alias rubocop="rubocop -DE"
alias kb="./kobaltw"

alias routes='netstat -nr -f inet'

# Git
alias gti='git'
alias gitl='git l -n3'
alias gits='git st'
alias gitd='git diff'
alias gitr='git r'
alias gitf='git f'
alias gitb='git branch'
alias branchify="pbpaste|tr '[:upper:] ' '[:lower:]-'|pbcopy"
alias yoink='git stash && git pull && git stash pop'
alias yolo='git push -f'
alias gsrebase='git-svn-rebase'
alias git-prune='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'

# Mercurial
alias hgl='hg lnp -l3'
alias hgs='hg st'
alias hgd='hg diff'

# Docker
alias d=docker
alias dk=docker
alias dkc='docker compose'
alias dcu='docker compose up'
alias dcb='docker compose build base'
# Show all running containers
alias dps='docker ps --format "table {{.ID}}\t{{.CreatedAt}}\t{{.Status}}\t{{.Ports}}\t{{.Names}}"'
# Stop all containers
alias dsa='docker stop $(docker ps -q)'
# Remove all containers
alias drm='docker rm $(docker ps --filter 'status=exited' --format '{{.ID}}' | xargs)'
# Remove all images
alias drmi='docker rmi $(docker images | grep ^classpass | tr -s " " | cut -f 3 -d " " | xargs)'
# Remove everything Docker knows about
alias docker-smash='dsa; docker rm $(docker ps -a -q); docker system prune -af; docker volume rm $(docker volume ls -q)'
function docker-bash {
    docker exec -t -i "$1" /bin/bash
}

alias unpack_stacktrace="pbpaste | gsed -e 's/\sat\s/ !at /g' | tr '!' '\n' | sed '/^[[:space:]]*$/d' | pbcopy"

#####################
##### Compiling #####
#####################
alias gcc='cowsay "gcc"; gcc'
alias g++='cowsay "g++"; g++'
alias make='cowsay "make"; nice -n 10 make'
alias javac='cowsay "javac"; javac'
# Java with remote debugging enabled
alias jdebug='java -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=5005'
