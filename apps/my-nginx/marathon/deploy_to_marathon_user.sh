#! /bin/bash
curl -H "Authorization: token=$(dcos config show core.dcos_acs_token)" -X POST m1.dcos/service/marathon-user/v2/apps -d @basic.json -H "Content-type: application/json"

