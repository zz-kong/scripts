#!/bin/bash
cookies='Cookie: lip_uid=123456; lip_channelid=131; lip_token=1ab2cd3ef4gh5ij6kl7mn8op9qr10st1uv2wx3yz; lip_openid=12345678912345678912'

read OUTPUT < <(curl "https://pass.levelinfinite.com/api/rewards/proxy/lipass/Points/DailyCheckIn"  -X POST -H "$cookies" --data-raw '{"task_id":"15"}' 2>/dev/null | jq .msg)
message_username="LevelInfinite"
message='{"username": "'$message_username'", "content": '$OUTPUT'}'
webhook_url=""
curl -H "Content-Type: application/json" -d "$message" $webhook_url