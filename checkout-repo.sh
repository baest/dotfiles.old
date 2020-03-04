#!/usr/bin/env bash
git clone --bare git@github.com:baest/dotfiles.git $HOME/.cfg
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

git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
mkdir .zsh_history

rm .ssh/config*
echo .ssh/config >> .cfg/info/exclude
echo .ssh/config.mac >> .cfg/info/exclude
cfg update-index --assume-unchanged .ssh/config .ssh/config.mac

#curl -Lks https://raw.githubusercontent.com/baest/dotfiles/master/checkout-repo.sh | zsh
#cfg fetch --all; cfg reset --hard ; cfg rebase FETCH_HEAD; rm .ssh/config*
