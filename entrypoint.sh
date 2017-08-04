#!/bin/bash

if [ -z "$TZ" ]; then
   TZ=Asia/Shanghai
fi
ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo "${TZ}" > /etc/timezone

cd /root

git pull

if [ ! -z "$ENV" ]; then
    cp /root/config/config_${ENV}.yaml /root/config/config.yaml
fi

chmod +x /root/start.php

php /root/start.php start -d

tail -f /dev/null