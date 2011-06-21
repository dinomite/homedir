#!bash
CONSTRAIN_HOMEDIR=.drew
# Root of the GitHub repository
GITHUB_ROOT=https://raw.github.com/dinomite/homedir/master/
GITHUB_FILES=( .bash_aliases .bash_functions .bash_global .bashrc .vimrc.simple )
# Files that need sed run on them to insert CONSTRAIN_HOMEDIR in paths they reference
SED_TRANSFORM_FILES=( .bashrc )

# See: http://noobody.org/Data/PonychanImageCrawler.bash
function depCheck()
{
    find `echo $PATH | sed 's/:/ /g'` -name $1 > $1 2> /dev/null
    lines=`wc -l $1 | egrep -o "[0-9][0-9]*" | head -n 1`
    rm "$1"
    if [[ $lines -gt 0 ]]
    then
        return 1
    else
        return 0
    fi
}
depCheck wget
WGET=$?
depCheck curl
CURL=$?

if [[ $WGET -eq 0 ]]
then
    if [[ $CURL -eq 0 ]]
    then
        echo -e "Couldn't find wget or curl in path\n"
        exit 1
    fi
fi

if [[ $WGET -ne 0 ]]
then
    DOWNLOADER='wget -nv -O -'
else
    if [[ $CURL -ne 0 ]]
    then
        DOWNLOADER='curl -fsS'
    fi
fi

# Make the dotfiles directory
if [[ ! -d $CONSTRAIN_HOMEDIR ]]
then
    mkdir ~/$CONSTRAIN_HOMEDIR
fi
cd ~/$CONSTRAIN_HOMEDIR

# Get all of the files
for file in "${GITHUB_FILES[@]}"
do
    $DOWNLOADER "$GITHUB_ROOT/$file" > $file
done

# Run sed on files that need it, altering homedir-relative paths
for file in "${SED_TRANSFORM_FILES[@]}"
do
    sed -i'' -e "s#~/\.#~/$CONSTRAIN_HOMEDIR/.#" $file
done

# Add other aliases
echo "alias vim='vim -u ~/$CONSTRAIN_HOMEDIR/.vimrc.simple'" >> ~/$CONSTRAIN_HOMEDIR/.bash_aliases
