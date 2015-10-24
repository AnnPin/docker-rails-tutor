#!/bin/bash

service mysql start
a2enmod rewrite
a2enmod cgi
a2enmod proxy

source /etc/apache2/envvars
exec /usr/sbin/apache2 -e info -D FOREGROUND

