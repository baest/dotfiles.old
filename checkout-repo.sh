#!/usr/bin/env bash
git clone --bare https://github.com/baest/dotfiles.git $HOME/.cfg
function cfg {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir .cfg-backup
cfg checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
else
    echo "Backing up pre-existing dot files.";
    cfg checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .cfg-backup/{}
fi;
cfg checkout
cfg config status.showUntrackedFiles no
touch ~/.gitconfig.local

git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --bin
mkdir .zsh_history
mkdir .psql_history
mkdir -p .vim/swap

rm .ssh/config*
echo .ssh/config >> .cfg/info/exclude
echo .ssh/config.mac >> .cfg/info/exclude
echo .ssh/config.newer_ssh >> .cfg/info/exclude
cfg update-index --assume-unchanged .ssh/config .ssh/config.mac .ssh/config.newer_ssh

#run this with:
#curl -Lks https://raw.githubusercontent.com/baest/dotfiles/master/checkout-repo.sh | zsh

#for updates:
#cfg_update
