#!/bin/bash

mode=$1

repodir=$(dirname $0)

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

setup $repodir/home/dot_vimperatorrc ~/.vimperatorrc
setup $repodir/home/dot_Xmodmap ~/.Xmodmap
setup $repodir/home/dot_zshrc ~/.zshrc

# ~/.oh-my-zsh/oh-my-zsh.sh 110行目で source コマンドの引数として渡しているので、
# シンボリックリンクではなく実体をコピーする
echo "cp $repodir/home/dot_oh-my-zsh/themes/robbyrussell_custom.zsh-theme ~/.oh-my-zsh/themes/robbyrussell_custom.zsh-theme"
cp $repodir/home/dot_oh-my-zsh/themes/robbyrussell_custom.zsh-theme ~/.oh-my-zsh/themes/robbyrussell_custom.zsh-theme
