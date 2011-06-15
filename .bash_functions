#####################
##### Functions #####
#####################
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

function calc {
    awk "BEGIN{ print $* }";
}

function getip {
    host $1|grep " has address "|cut -d" " -f4
}

# Load my basic homedir when SSHing to Clearspring hosts
function cssh {
    ssh $1 -t "exec bash --rcfile .drew/.bashrc"
}
complete -F _ssh cssh
