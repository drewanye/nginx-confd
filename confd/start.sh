#!/bin/bash
set -eo pipefail

echo "Starting Nginx"
service nginx start

until confd -onetime -backend etcd -node $EtcdNode; do
    echo "[nginx] waiting for confd to create initial nginx configuration."
    sleep 5
done

/bin/confd -interval=$interval -backend etcd -node $EtcdNode &

tail -f /var/log/nginx/*.log
