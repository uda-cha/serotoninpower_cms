# serotoninpower_cms

## これはなに？

Rails 製の CMSです。コメントの CURD 操作を提供します。

静的ファイルジェネレータなどで生成された html ファイルに iframe でコメント機能を埋め込むことを想定して作られています。

コメントを管理するための管理画面があります。

## エンドポイント

* コメント機能へのURL: `/posts/:post_id/comments/wrapper`
* 管理画面へのURL: `/cms_admin/login`

## Requirements

* Ruby 2.6.4
* Rails 5.2.4
* MySQL 5.7

## 開発環境の構築

以下のコマンドを実行した後で、`localhost:3000`にアクセスすると開発環境が見れます。

```sh
$ docker-compose build
$ docker-compose up -d
$ docker-compose run --rm rails bundle exec rails db:create
$ docker-compose run --rm rails bundle exec rails db:migrate
$ docker-compose run --rm rails bundle exec rails db:seed
```

管理画面へは以下のアカウントでログインできます(開発環境のみ)。

* メールアドレス: `admin@example.com`
* パスワード: `password`

## 再起動

データベースのデータは永続化されているため、再起動では消えません。

```sh
$ docker-compose down
$ docker-compose up -d
```

## Gemfile をいじったとき

```sh
$ docker-compose run --rm rails bundle install
$ docker-compose build
# そして再起動
```

## Rspec

```sh
$ docker-compose run --rm rails bundle exec rspec
```

## デプロイに必要な設定

iframe での表示を許可するオリジンを設定するため、環境変数`allow_iframe_from`を設定した上でデプロイします。

* 例

```sh
$ export allow_iframe_from=https://hoge.sample.com/
```
