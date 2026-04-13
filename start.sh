#!/bin/sh
echo '=== Starting Nakama with Supabase ==='
/keepalive.sh &
echo 'Running migrations...'
/nakama/nakama migrate up --config /nakama/data/nakama.yml --database.address 'postgres.atojskxrxfsbpeefigtm:l6TuVaUiqmhWbbVO@aws-0-eu-west-1.pooler.supabase.com:5432/postgres?sslmode=require'
echo 'Starting Nakama server...'
exec /nakama/nakama --config /nakama/data/nakama.yml --database.address 'postgres.atojskxrxfsbpeefigtm:l6TuVaUiqmhWbbVO@aws-0-eu-west-1.pooler.supabase.com:5432/postgres?sslmode=require'
