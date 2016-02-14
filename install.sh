#!/bin/bash

mode=$1

repodir=$(dirname $0)
cd $repodir
repopath=$(pwd)

setup() {
    from=$1
    to=$2
    echo "setup $from $to"

    if [ -f $to ]; then
	mv $to $to_$(date +%Y%m%d%H%M%S)
    fi
    ln -s $from $to
}

if [ "$mode" = "full" ]; then
    sudo apt-get install zsh
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

setup $repopath/home/dot_vimperatorrc ~/.vimperatorrc
setup $repopath/home/dot_Xmodmap ~/.Xmodmap
setup $repopath/home/dot_zshrc ~/.zshrc

setup $repopath/home/dot_oh-my-zsh/custom/robbyrussell.zsh-theme ~/.oh-my-zsh/custom/robbyrussell.zsh-theme
# # 【sourceでシンボリックリンクを解決できない(?)環境用】
# # ~/.oh-my-zsh/oh-my-zsh.sh 110行目で source コマンドの引数として渡しているので、
# # シンボリックリンクではなく実体をコピーする
# echo "cp $repopath/home/dot_oh-my-zsh/custom/robbyrussell.zsh-theme ~/.oh-my-zsh/custom/robbyrussell.zsh-theme"
# cp $repopath/home/dot_oh-my-zsh/custom/robbyrussell.zsh-theme ~/.oh-my-zsh/custom/robbyrussell.zsh-theme
