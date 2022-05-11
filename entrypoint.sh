#!/bin/sh

if [ "${1}" = "node" ]; then
  sh -c  "${*}"
elif [ "${1}" = "npm" ]; then
  sh -c  "${*}"
else
  echo "错误：不提供 非node 或 非npm 的命令：${1}";
  exit;
fi;


