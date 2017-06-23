#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
  set -x
fi

rm /etc/nginx/conf.d/default.conf

gotpl /etc/gotpl/drupal.conf.tpl > /etc/nginx/conf.d/drupal.conf

nginx -g 'daemon off;'
