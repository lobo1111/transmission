#!/bin/bash

sed -i "s/rpc-authentication-required.*/\"rpc-authentication-required\": "$ENABLE_AUTH",/" $CONFIG_PATH
sed -i "s/rpc-username.*/\"rpc-username\": "$USER",/" $CONFIG_PATH
sed -i "s/rpc-password.*/\"rpc-password\": "$PASSWORD",/" $CONFIG_PATH
sed -i "s/rpc-whitelist-enabled.*/\"rpc-whitelist-enabled\": "$ENABLE_WHITELIST",/" $CONFIG_PATH
sed -i "s/rpc-whitelist.*/\"rpc-whitelist\": "$ENABLE_WHITELIST",/" $CONFIG_PATH
sed -i "s/incomplete-dir-enabled.*/\"incomplete-dir-enabled\": "$ENABLE_INCOMPLETE_DIR",/" $CONFIG_PATH
sed -i "s/incomplete-dir.*/\"incomplete-dir\": "$INCOMPLETE_DIR",/" $CONFIG_PATH
sed -i "s/download-dir.*/\"download-dir\": "$COMPLETE_DIR",/" $CONFIG_PATH
sed -i "s/download-dir.*/\"download-dir\": "$COMPLETE_DIR",/" $CONFIG_PATH
sed -i "s/watch-dir.*/\"watch-dir\": "$TORRENTS_WATCHDIR",/" $CONFIG_PATH

service transmissiond start

while :
do
	sleep 600
done
