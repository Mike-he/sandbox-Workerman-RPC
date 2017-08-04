#!/bin/bash

if [ ! -z "$ENV" ]; then
    cp /root/config/config_${ENV}.yaml /root/config/config.yaml
fi

php start.php start -d

ttyd bash