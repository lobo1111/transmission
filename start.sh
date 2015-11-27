#!/bin/bash

sed -i "s/\"rpc-authentication-required.*/\"rpc-authentication-required\": $ENABLE_AUTH,/" $CONFIG_PATH
sed -i "s/\"rpc-username.*/\"rpc-username\": \"$USER\",/" $CONFIG_PATH
sed -i "s/\"rpc-password.*/\"rpc-password\": \"$PASSWORD\",/" $CONFIG_PATH
sed -i "s/\"rpc-whitelist-enabled.*/\"rpc-whitelist-enabled\": $ENABLE_WHITELIST,/" $CONFIG_PATH
sed -i "s/\"rpc-whitelist:.*/\"rpc-whitelist\": \"$WHITELIST\",/" $CONFIG_PATH
sed -i "s/\"incomplete-dir-enabled.*/\"incomplete-dir-enabled\": $ENABLE_INCOMPLETE_DIR,/" $CONFIG_PATH

if [ $SMB_ENABLE == "true" ]; then
    mount -t cifs -o username=$SMB_USER,password=$SMB_PWD $SMB_PATH /opt/complete
fi

/usr/bin/transmission-daemon --foreground --config-dir /var/lib/transmission

