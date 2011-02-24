#!bash
# After cloning homedir repo into new homedir, setup
cd ~
git submodule update --init --recursive

# Link things into ~/bin
cd ~/bin
ln -s submodules/git-svn-clone-externals/git-* .
ln -s submodules/CmdDirs/bin/cmddirs .

# Run vim movein
sh ~/.vim/movein.sh
