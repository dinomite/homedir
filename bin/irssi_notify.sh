#!/bin/sh
# http://matthewhutchinson.net/2010/8/21/irssi-screen-fnotify-and-growl-on-osx

(ssh dinomite.net -o PermitLocalCommand=no  \
  ": > .irssi/fnotify ; tail -f .irssi/fnotify " |  \
while read heading message; do                      \
  growlnotify -t "[irssi] ${heading}" -m "${message}";      \
done)&
