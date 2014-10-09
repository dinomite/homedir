if test -n "$(find ~/Downloads -maxdepth 1 -name '*.torrent' -print -quit)"
then
    scp ~/Downloads/*.torrent root@192.168.2.254:/tmp/mnt/MEDIA/NewTorrents/ && rm ~/Downloads/*.torrent
fi
