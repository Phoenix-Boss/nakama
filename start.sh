#!/bin/sh

echo "=== Starting Nakama with Supabase Database ==="
echo "Database: [2a05:d018:135e:16b9:e768:f0f3:e337:4a0]:5432/postgres"
echo "User: postgres"
echo "=============================================="

# Display the config (hide password)
echo "Database configuration:"
grep -A 5 "database:" /nakama/data/nakama.yml | grep -v "password"

# Start keep-alive in background
/keepalive.sh &

# Start Nakama directly
echo "Starting Nakama server..."
exec nakama --config /nakama/data/nakama.yml
