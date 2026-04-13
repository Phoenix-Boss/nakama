#!/bin/sh
echo "=== Starting Nakama with Supabase ==="
grep "address" /nakama/data/nakama.yml
/keepalive.sh &
exec nakama --config /nakama/data/nakama.yml --database.address "postgres:l6TuVaUiqmhWbbVO@db.atojskxrxfsbpeefigtm.supabase.co:5432/postgres?sslmode=require"