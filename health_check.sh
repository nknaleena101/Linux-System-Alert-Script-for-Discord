#!/bin/bash
source .env

curl -H "Content-Type: application/json" \
-X POST \
-d "{\"content\": \"Test from Env\"}" \
$DISCORD_WEBHOOK_URL

