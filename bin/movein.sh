#!bash
# After cloning homedir repo into new homedir, setup
cd ~
git submodule update --init --recursive

# Run vim movein
sh ~/.vim/movein.sh
