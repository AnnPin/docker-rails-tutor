#!/bin/bash

# RVM (Ruby Version Manager)をインストール
curl -L https://get.rvm.io | bash -s
	#source $HOME/.rvm/scripts/rvm
source /etc/profile.d/rvm.sh
echo "source /etc/profile.d/rvm.sh" > $HOME/.bashrc
curl -sSL https://rvm.io/mpapis.asc | gpg --import -
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
rvm get stable

# 依存関係の解消
rvm requirements

# Ruby 2.0.0をインストール
rvm install 2.0.0
	#rvm install 2.0.0 --with-openssl-dir=$HOME/.rvm/usr

# RVMのデフォルト設定を作成
rvm use 2.0.0@railstutorial_rails_4_0 --create --default

# RubyGemsのドキュメント作成を無効化するために、プロファイルを作成
echo -e "install: --no-rdoc --no-ri\nupdate:  --no-rdoc --no-ri" > $HOME/.gemrc

# RubyGemsのバージョンを2.0.3に固定化
gem update --system 2.0.3

# Railsをインストールする
gem install rails --version 4.0.5

# Heroku Toolbeltインストール
wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh

echo "Instllation completed."

