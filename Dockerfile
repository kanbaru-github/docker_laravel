FROM php:8.2.3-apache
RUN apt-get update && apt-get install -y \
    libzip-dev \
    zip \
    && docker-php-ext-install zip \
    && docker-php-ext-enable zip
COPY ./docker_laravel /var/www/html/
RUN chown -R www-data:www-data /var/www/html/

# FROM: Dockerイメージのベースとなるイメージを指定します。この場合、公式のPHP 8.2.3 Apacheイメージを指定しています。
# RUN: コマンドを実行します。この場合、apt-getを使用して必要なライブラリをインストールしています。
# COPY: ローカルファイルをDockerイメージにコピーします。この場合、./docker_laravelを/var/www/html/にコピーしています。
# RUN: コマンドを実行します。この場合、chownコマンドを使用して、プロジェクトフォルダにwww-dataユーザーのアクセス権を付与しています。