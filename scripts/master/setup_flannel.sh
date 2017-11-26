#!/bin/bash

cat > flanneld-conf.json << EOF
{
  "Network": "172.16.0.0/12",
  "SubnetLen": 24,
  "Backend": {
    "Type": "vxlan"
  }
}
EOF

curl -L http://localhost:2379/v2/keys/atomic.io/network/config -XPUT --data-urlencode value@flanneld-conf.json
