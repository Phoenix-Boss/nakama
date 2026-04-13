#!/bin/sh

echo "=== Starting Nakama with Supabase Database ==="
echo "Database host: db.atojskxrxfsbpeefigtm.supabase.co:5432"
echo "Database: postgres"
echo "User: postgres"
echo "=============================================="

# Start keep-alive in background
/keepalive.sh &

# Start Nakama
echo "Starting Nakama server..."
exec nakama --config /nakama/data/nakama.yml