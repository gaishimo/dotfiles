#!/bin/bash

# ricty font
echo "copy ricty fonts"
cp -frv /usr/local/Cellar/ricty/3.2.*/share/fonts/Ricty*.ttf ~/Library/Fonts/
fc-cache -vf

# git diff-highlight
echo "install diff-highlight"
curl https://raw.github.com/git/git/master/contrib/diff-highlight/diff-highlight -o /tmp/diff-highlight
chmod +x /tmp/diff-highlight
mv /tmp/diff-highlight $HOME/bin/diff-highlight
