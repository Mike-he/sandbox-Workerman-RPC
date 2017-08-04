#!/bin/bash

if [ ! -z "$ENV" ]; then
    cp /root/config/config_${ENV}.yaml /root/config/config.yaml
fi

chmod +x /root/start.php

php /root/start.php start -d

ttyd bash