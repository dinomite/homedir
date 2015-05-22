if test -n "$(find ~/Downloads -maxdepth 1 -name '*.torrent' -print -quit)"
then
    scp -p ~/Downloads/*.torrent dinomite@192.168.2.100:/mnt/pescennius/NewTorrents/ && rm ~/Downloads/*.torrent
fi
