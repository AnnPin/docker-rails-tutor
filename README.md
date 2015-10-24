Docker Image for Rails Tutorial
===============================

### これは何？
*  Railsチュートリアル (<http://railstutorial.jp/>) を読み進めていく時にサンプルを動かすために使えるDockerイメージ
*  RVM、Ruby、Ruby Gems、Rails、git、Heroku Toolbeltインストール済み
*  コンテナ起動後、`/www/`ディレクトリ下に`rails_projects`ディレクトリを作ってすぐにRailsプロジェクト開発が始められると思います

### 使い方
*  Vagrant環境下でDockerを動かしていることを想定しているので、Vagrantが使える場合には`/vagrant`の中にこのリポジトリをgit cloneしてください
*  Vagrantを使っていない場合には、コンテナ起動用の設定を書いている`Makefile`の設定を書き換えてください
*  イメージを作ってコンテナの起動をさせます

```bash
make
あるいは
make setup-nc    (makeでビルド中にエラーが出る場合) 
```

*  コンテナが無事に起動したら、コンテナの中に入ります

```bash
make bash
```

*  セットアップ完了！`/www/`に移動して`rails_project`ディレクトリを作ったら開発を始められます (gitとHerokuのユーザー登録は忘れないで下さい)

