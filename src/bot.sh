#!/bin/bash

BOT_TOKEN="7728592014:AAHsRXRhB0KHeVcq2H6lr_sv71V3KOyizBc"
CHAT_ID="-1002606444402"
MESSAGE="Deploy status: $CI_PIPELINE_STATUS%0A%0AProject:+
$CI_PROJECT_NAME%0AURL:+$CI_PROJECT_URL/pipelines/
$CI_PIPELINE_ID/%0ABranch:+$CI_COMMIT_REF_SLUG"

curl -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" \
     -H "Content-Type: application/json" \
     -d "{\"chat_id\": \"${CHAT_ID}\", \"text\": \"${MESSAGE}\"}" >/dev/null