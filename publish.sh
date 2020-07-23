#!/bin/bash -l
#

PUBLIC_WWW=/var/www/discochap.com/public_html
export JEKYLL_ENV=production

bundle install
bundle exec jekyll build -d $PUBLIC_WWW
