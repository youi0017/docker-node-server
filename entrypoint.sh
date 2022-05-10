#!/bin/sh

# /usr/bin/php /www/http.php

if [ "${1}" = "node" ]; then
  # biner="node";
  sh -c  "${*}"
elif [ "${1}" = "npm" ]; then
  # biner="npm"
  sh -c  "${*}"
else
  echo "错误：不提供 非node 或 非npm 的命令：${1}";
  exit;
fi;


