#!/bin/bash

# PostgreSQL
apk add --no-cache postgresql-libs postgresql-dev
/usr/local/bin/docker-php-ext-configure pgsql pdo_pgsql
/usr/local/bin/docker-php-ext-install pgsql pdo_pgsql

# Application Set Up
cd /var/www/html
git submodule init && git submodule update
composer dumpautoload
php artisan config:cache

# Restart supervisor
supervisorctl restart all