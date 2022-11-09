#!/bin/bash
function replace {
  if [ -e ~/$1 ]; then
    mv ~/$1 ~/$1.bak
  fi

  ln -s $(readlink -f `dirname $0`)/$1 ~/$1
}

replace .vim
replace .vimrc
replace .bashrc
replace .promptline.sh
replace .zshrc

