#!/bin/env bash

cd /tmp
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
mkdir -p /usr/bin
php composer-setup.php --filename=composer --install-dir=/usr/bin
php -r "unlink('composer-setup.php');"
