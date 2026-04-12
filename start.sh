#!/bin/sh
envsubst < /nakama/data/nakama.yml.tmpl > /nakama/data/nakama.yml
exec nakama --config /nakama/data/nakama.yml
