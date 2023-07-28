function k8s-net-debug
    kubectl run --image wbitt/network-multitool --overrides='{ "apiVersion": "v1", "spec": { "containers": [{"name": "jeremy-test", "resources": {"limits": {"cpu": "500m", "memory": "256Mi"}}}] } }' --override-type="strategic" -i -t --rm=true jeremy-test -- /bin/bash
end

