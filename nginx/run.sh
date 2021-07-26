#!/bin/sh

set -e

sed -i "s/FULLCHAINREPLACE/$SSL_FULLCHAIN/g" /etc/nginx/conf.d/default.conf
sed -i "s/PRIVKEYREPLACE/$SSL_PRIVKEY/g"     /etc/nginx/conf.d/default.conf

nginx -g 'daemon off;'