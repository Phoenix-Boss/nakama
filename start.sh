#!/bin/sh

# Start the keep-alive pinger in background
/keepalive.sh &

# Start Nakama
envsubst < /nakama/data/nakama.yml.tmpl > /nakama/data/nakama.yml
exec nakama --config /nakama/data/nakama.yml
