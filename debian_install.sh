#!/bin/bash

sudo apt remove --assume-yes vim.tiny
sudo apt autoremove --assume-yes
sudo apt install --assume-yes ack bash-completion locate ctags curl git gcc info man mc net-tools p7zip-full progress rsync subversion telnet tig unzip vim vim-doc vim-scripts
