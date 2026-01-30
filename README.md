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
