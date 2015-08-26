TORRENT_PATH=~/Downloads/*.torrent
if test -n "$(find ~/Downloads -maxdepth 1 -name '*.torrent' -print -quit)"
then
    chmod 664 $TORRENT_PATH
    scp -p $TORRENT_PATH dinomite@septimius.local:/mnt/pescennius/NewTorrents/ && rm ~/Downloads/*.torrent
fi
