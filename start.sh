#!/bin/sh
echo '=== Starting Nakama with Supabase ==='
grep 'address' /nakama/data/nakama.yml
/keepalive.sh &
exec /nakama/nakama --config /nakama/data/nakama.yml --database.address 'postgres.atojskxrxfsbpeefigtm:l6TuVaUiqmhWbbVO@aws-0-eu-west-1.pooler.supabase.com:6543/postgres?sslmode=require'
