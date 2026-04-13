#!/bin/sh

echo "=== Starting Nakama with Supabase Database ==="
echo "Host: db.atojskxrxfsbpeefigtm.supabase.co:5432"
echo "=============================================="

# Verify config file exists
echo "Config check:"
grep "address" /nakama/data/nakama.yml || echo "WARNING: nakama.yml not found!"

# Start keep-alive in background
/keepalive.sh &

# Pass DB address via CLI flag — this OVERRIDES any default config
echo "Starting Nakama server..."
exec nakama \
  --config /nakama/data/nakama.yml \
  --database.address "postgres:l6TuVaUiqmhWbbVO@db.atojskxrxfsbpeefigtm.supabase.co:5432/postgres?sslmode=require"