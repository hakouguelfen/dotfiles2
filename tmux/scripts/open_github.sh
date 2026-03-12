#!/usr/bin/env bash

for remote in $(git remote); do
  path=$(git remote get-url "$remote" | awk -F":" '{printf $NF}')
  /usr/bin/xdg-open "https://$remote.com/$path"
done
