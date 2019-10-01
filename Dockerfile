FROM php:7.2-fpm-alpine3.9

COPY --from=composer:1.7 /usr/bin/composer /usr/bin

WORKDIR /app

RUN apk add --no-cache bash libxml2-dev nodejs-current nodejs-npm php7-bcmath zlib-dev
RUN docker-php-ext-install -j"$(nproc)" zip

RUN npm install -g yarn

ENV PATH="/app:/app/node_modules/.bin:/app/vendor/bin:${PATH}"

EXPOSE 8000
EXPOSE 9000

