#####################
##### Functions #####
#####################
function h {
    rg $@ ~/.bash_history
}

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

# Print a histogram, with setable unit size
function histogram {
    UNIT=$1
    if [ -z "$UNIT" ]; then
        UNIT="1";
    fi

    first="sort|uniq -c|awk '{printf(\"\n%s \", \$0); for (i =0; i<\$1; i=i+"
    last=") {printf(\"#\")};}'; echo \"\""
    cmd="${first}${UNIT}${last}"
    eval $cmd
}
function getNum {
    UNIT=$1
    if [ -z "$UNIT" ]; then
        UNIT="1";
    fi

    first="sort|uniq -c|awk '{printf(\"\n%s \", \$0); x=0; for (i =0; i<\$1; i=i+"
    last=") {x=x+1} printf(\"%s\", x);}'; echo \"\""
    cmd="${first}${UNIT}${last}"
    eval $cmd
}

function calc {
    awk "BEGIN{ print $* }";
}

function getip {
    host $1|grep " has address "|cut -d" " -f4
}

function g {
    if [[ $# > 0 ]]; then
        git $@
    else
        git status --short --branch
    fi
}
function gitc {
    git co -t $(git branch -r | grep "$1")
}

# Kill things in style
function fuck() {
    if pkill -9 "$1"; then
        echo ; echo " (╯°□°）╯︵$(echo "$1"|toilet -f term -F rotate)"; echo
    fi
}

listening() {
    if [ $# -eq 0 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P
    elif [ $# -eq 1 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P | grep -i --color $1
    else
        echo "Usage: listening [pattern]"
    fi
}


function gw() {
    pushd . > /dev/null

    while [[ ! -x ./gradlew && $PWD != '/' ]]; do
        cd ..
    done

    if [[ -x ./gradlew ]] ; then
        ./gradlew "$@"
    else
        echo "Could not find gradlew in any parent dir" >&2
    fi

    popd > /dev/null
}
