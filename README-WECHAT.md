**Tips**: this repo just replaced receiver from `slack` to `wechat` for Chinese users when using `Alertmanager`
**howto**: please take a look at the end of the file for `wechat` settings.

## Configure alertmanager receiver - wechat

* wechat related PR
  - prometheus/alertmanager
    - [#1059](https://github.com/prometheus/alertmanager/pull/1059)
  - prometheus/docs
    - [#977](https://github.com/prometheus/docs/pull/977)

* what I've changed in this repo:
  - alertmanager/conf/alertmanager.yml
  - alertmanager/conf/docker-entrypoint.sh
  - docker-compose.yml
  - docker image: opera443399/swarmprom-alertmanager:v0.14.0

The Alertmanager swarmprom image is configured with the `wechat` receiver.

```yaml
alertmanager:
  image: opera443399/swarmprom-alertmanager:v0.14.0
  networks:
    - net
  environment:
    - API_SECRET=${API_SECRET}
    - CORP_ID=${CORP_ID}
    - AGENT_ID=${AGENT_ID}
    - TO_PARTY=${TO_PARTY}

```

In order to receive alerts on `wechat` you have to provide the API_SECRET,
CORP_ID, AGENT_ID and TO_PARTY via environment variables in `start.sh` later:

```bash
$ git clone https://github.com/opera443399/swarmprom.git
$ cd swarmprom
$ cat start.sh
#!/bin/bash
#

ADMIN_USER='admin' \
ADMIN_PASSWORD='admin' \
API_SECRET='xxx' \
CORP_ID='xxx' \
AGENT_ID='111' \
TO_PARTY='111' \
docker stack deploy -c docker-compose.yml mon

```

*make sure `DOCKER_GWBRIDGE_IP` and `/var/lib/docker` in `docker-compose.yml` are matching the values as in your environment*
##### run the swarmprom
```bash
$ sh start.sh

```
