#!/bin/bash
#

ADMIN_USER='admin' \
ADMIN_PASSWORD='admin' \
API_SECRET='xxx' \
CORP_ID='xxx' \
AGENT_ID='111' \
TO_PARTY='111' \
docker stack deploy -c docker-compose.yml mon
