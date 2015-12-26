#!/bin/bash

# ricty font
echo "copy ricty fonts"
cp -frv /usr/local/Cellar/ricty/3.2.*/share/fonts/Ricty*.ttf ~/Library/Fonts/
fc-cache -vf

# git diff-highlight
echo "install diff-highlight"
curl https://raw.githubusercontent.com/git/git/master/contrib/diff-highlight/diff-highlight -o /tmp/diff-highlight
chmod +x /tmp/diff-highlight
mv /tmp/diff-highlight $HOME/bin/diff-highlight

# settings repository
mkdir -p $HOME/src/settings
SETTINGS_PATH=$HOME/src/settings/my_settings
git clone git@bitbucket.org:gaishimo/my_settings.git $SETTINGS_PATH

# ssh
cp $SETTINGS_PATH/ssh/keys/id* ~/.ssh/
chmod 600 ~/.ssh/id_*
cat $SETTINGS_PATH/ssh/configs/* >> ~/.ssh/config

# aws
mkdir ~/.aws
cp $SETTINGS_PATH/aws/credentials/gaishimo/* ~/.aws/
sudo pip install aws-shell

# ruby
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

# Clone repositories
git clone git@bitbucket.org:gaishimo/snippets.git $HOME/src/snippets
mkdir -p $HOME/src/study
git clone git@github.com:gaishimo/tech-study.git $HOME/src/study/tech-study
git clone git@github.com:gaishimo/lang-study.git $HOME/src/study/lang-study
