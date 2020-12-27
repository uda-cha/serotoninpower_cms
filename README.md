# serotoninpower_cms

## これはなに？

Rails 製の CMSです。コメントの CURD 操作を提供します。

コメントを管理するための管理画面があります。

## エンドポイント

* コメント機能へのURL: `/v1/posts/:post_id/comments`
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
## デプロイ前にやること

```sh
$ RAILS_ENV=production docker-compose run --rm rails bundle exec rails assets:precompile
```

## デプロイ後にやること

```sh
$ bundle exec rails db:migrate
```

## デプロイ後に必要な設定

管理画面へアクセスするアカウントを作成します。

```sh
$ bundle exec rake admin_user:create[yourmail@sample.com,yourpassword]
```
