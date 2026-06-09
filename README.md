# helm-gh-actions-runner

## Dependencies
```
# Download
helm dependency update

# Extract
tar -xzkvf charts/gha-runner-scale-set-controller-0.13.1.tgz -C /tmp
tar -xzkvf charts/gha-runner-scale-set-0.13.1.tgz -C /tmp

# Copy
cp -rv /tmp/gha-runner-scale-set-controller/values.yaml values.gha-runner-scale-set-controller.yaml
cp -rv /tmp/gha-runner-scale-set/values.yaml values.gha-runner-scale-set.yaml
```

## Test

### Test images
```
kubectl run test-pod --image=registry.k8s.io/busybox:1.27 --restart=Never --rm -it -- /bin/sh -c 'echo "HelloWorld $(date)"'
# /usr/local/bin/kubectl version
kubectl run test-pod --image=registry.k8s.io/kubectl:v1.36.1 --restart=Never --rm -it -- version
```
