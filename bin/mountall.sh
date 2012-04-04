#!/bin/bash
SSHFS="/usr/local/bin/sshfs"
SSHFS_OPTIONS="-o follow_symlinks"
SMBMOUNT="/sbin/mount"
SMBMOUNT_OPTIONS="-t smbfs -o user,username=dstephens"

ENCFS="encfs"

if mount | grep "/Users/dinomite/clear" > /dev/null; then
    echo "EncFS is already mounted."
else
    echo "mounting EncFS..."
    $ENCFS $HOME/Dropbox/encrypted $HOME/clear
fi

###if grep "^//genfiles/users/dstephens" /proc/mounts > /dev/null; then
###    echo "genfiles is already mounted."
###else
###    echo "mounting genfiles..."
###    sudo $SMBMOUNT $SMBMOUNT_OPTIONS //genfiles/users/dstephens /home/dstephens/genfiles
###fi

###if grep "^davinci" /proc/mounts > /dev/null; then
###    echo "davinci is already mounted."
###else
###    echo "mounting davinci..."
###    sshfs -o follow_symlinks davinci:/home/dstephens /home/dstephens/davinci/
###fi

###if grep "^higgs" /proc/mounts > /dev/null; then
###    echo "higgs is already mounted."
###else
###    echo "mounting higgs..."
###    sshfs -o follow_symlinks higgs:/home/dstephens /home/dstephens/higgs/
###fi

###if mount | grep "^dev1" > /dev/null; then
###    echo "dev1 is already mounted."
###else
###    echo "mounting dev1..."
###    $SSHFS $SSHFS_OPTIONS dev1:/home/dstephens /Users/dstephens/dev1/
###fi

###if mount | grep "^titus" > /dev/null; then
###    echo "titus is already mounted."
###else
###    echo "mounting titus..."
###    $SSHFS $SSHFS_OPTIONS titus:/Users/dinomite /Users/drew/titus/
###fi

###if grep "^claudius" /proc/mounts > /dev/null; then
###    echo "claudius is already mounted."
###else
###    echo "mounting claudius..."
###    $SSHFS $SSHFS_OPTIONS claudius:/home/dinomite /home/dstephens/claudius/
###fi
