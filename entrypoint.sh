#!/bin/sh
set -e

# no args, use default
if [ $# -eq 0 ]; then
	set -- derper -hostname=$DERPER_DOMAIN
fi 

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- derper "$@"
fi

exec "$@"
