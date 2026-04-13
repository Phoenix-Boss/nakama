#!/bin/sh

echo "=== Starting Nakama with Supabase Database ==="
echo "Database Host: [2a05:d018:135e:16b9:e768:f0f3:e337:4a0]"
echo "Database User: postgres"
echo "Database Port: 5432"
echo "=============================================="

# Generate nakama.yml from template
echo "Generating nakama.yml from template..."
envsubst < /nakama/data/nakama.yml.tmpl > /nakama/data/nakama.yml

# Display generated config (hide password)
echo "Generated database config:"
grep -A 5 "database:" /nakama/data/nakama.yml | grep -v "password"

# Start keep-alive in background
/keepalive.sh &

# Start Nakama
echo "Starting Nakama server..."
exec nakama --config /nakama/data/nakama.yml
