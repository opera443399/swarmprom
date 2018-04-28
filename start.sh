#!/bin/bash
#

ADMIN_USER='admin' \
ADMIN_PASSWORD='admin' \
docker stack deploy -c docker-compose.yml mon
