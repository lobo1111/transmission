#!/bin/bash

sed -i "s/\"rpc-authentication-required.*/\"rpc-authentication-required\": $ENABLE_AUTH,/" $CONFIG_PATH
sed -i "s/\"rpc-username.*/\"rpc-username\": \"$USER\",/" $CONFIG_PATH
sed -i "s/\"rpc-password.*/\"rpc-password\": \"$PASSWORD\",/" $CONFIG_PATH
sed -i "s/\"rpc-whitelist-enabled.*/\"rpc-whitelist-enabled\": $ENABLE_WHITELIST,/" $CONFIG_PATH
sed -i "s/\"rpc-whitelist:.*/\"rpc-whitelist\": \"$WHITELIST\",/" $CONFIG_PATH
sed -i "s/\"incomplete-dir-enabled.*/\"incomplete-dir-enabled\": $ENABLE_INCOMPLETE_DIR,/" $CONFIG_PATH

/usr/bin/transmission-daemon --foreground --config-dir /var/lib/transmission

