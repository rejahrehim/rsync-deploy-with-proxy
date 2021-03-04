#!/bin/bash
set -eu

SSHPATH="$HOME/.ssh"
mkdir -p "$SSHPATH"
echo "$DEPLOY_KEY" > "$SSHPATH/id_rsa"
chmod 600 "$SSHPATH/id_rsa"
SERVER_DEPLOY_STRING="$USERNAME@$SERVER_IP:$SERVER_DESTINATION"
# sync it up"
sh -c "rsync $ARGS -e 'ssh -vvvvA  -i $SSHPATH/id_rsa -o StrictHostKeyChecking=no  -o ProxyCommand=\"ssh -o StrictHostKeyChecking=no  -i $SSHPATH/id_rsa -W %h:%p $PROXY_SERVER_USERNAME@$PROXY_SERVER_IP -p $PROXY_SERVER_PORT\"' $GITHUB_WORKSPACE/$FOLDER $SERVER_DEPLOY_STRING"
