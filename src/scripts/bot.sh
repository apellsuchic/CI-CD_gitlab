#!/bin/bash

BOT_TOKEN="7728592014:AAHsRXRhB0KHeVcq2H6lr_sv71V3KOyizBc"

CHAT_ID="-1002606444402"

MESSAGE="'$CI_JOB_NAME' status 🦾: $CI_JOB_STATUS
Project name: $CI_PROJECT_NAME
ID pipeline: $CI_PIPELINE_ID"

URL="https://api.telegram.org/bot${BOT_TOKEN}/sendMessage"

#curl -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" \
#     -H "Content-Type: application/json" \
#     -d "{\"chat_id\": \"${CHAT_ID}\", \"text\": \"${MESSAGE}\"}" >/dev/null
curl -s -d  "chat_id=$CHAT_ID&disable_web_page_preview=1&text=$MESSAGE" $URL >/dev/null