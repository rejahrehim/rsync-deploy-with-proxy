#!/bin/bash
set -eu

SSHPATH="$HOME/.ssh"
mkdir -p "$SSHPATH"
echo "$DEPLOY_KEY" > "$SSHPATH/key"
chmod 600 "$SSHPATH/key"
SERVER_DEPLOY_STRING="$USERNAME@$SERVER_IP:$SERVER_DESTINATION"
# sync it up"
sh -c "rsync $ARGS -e 'ssh -i $SSHPATH/key -o StrictHostKeyChecking=no -o "ProxyCommand ssh -p$PROXY_SERVER_PORT $PROXY_SERVER_USERNAME@$PROXY_SERVER_IP exec nc %h %p 2>/dev/null"' $GITHUB_WORKSPACE/$FOLDER $SERVER_DEPLOY_STRING"
