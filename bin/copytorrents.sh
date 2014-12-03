if test -n "$(find ~/Downloads -maxdepth 1 -name '*.torrent' -print -quit)"
then
    scp ~/Downloads/*.torrent dinomite@192.168.2.100:/mnt/pescennius/Torrents/NEW-TORRENTS/ && rm ~/Downloads/*.torrent
fi
