#!/bin/sh -e

## receivers
# wechat
cat /etc/alertmanager/alertmanager.yml |\
  sed "s@#api_secret: <api_secret>#@api_secret: '$API_SECRET'@g" |\
  sed "s@#corp_id: <corp_id>#@corp_id: '$CORP_ID'@g" |\
  sed "s@#agent_id: <agent_id>#@agent_id: '$AGENT_ID'@g" |\
  sed "s@#to_party: <to_party>#@to_party: '$TO_PARTY'@g" >/tmp/alertmanager.yml

cat /tmp/alertmanager.yml >/etc/alertmanager/alertmanager.yml

set -- /bin/alertmanager "$@"

exec "$@"
