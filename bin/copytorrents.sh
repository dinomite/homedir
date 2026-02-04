TORRENT_PATH=~/Downloads/*.torrent
if test -n "$(find ~/Downloads -maxdepth 1 -name '*.torrent' -print -quit)"
then
    chmod 664 $TORRENT_PATH
    #scp -p $TORRENT_PATH dinomite@hostilian:/mnt/pescennius/Torrents/.new_torrents/ && rm ~/Downloads/*.torrent
    cp $TORRENT_PATH /Volumes/media/torrents/new-torrents/ && rm ~/Downloads/*.torrent
fi
