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

## Debug

### Debug jobs
```
JOBS=$(kubectl get jobs -o jsonpath='{range .items[*]}{@.metadata.name}{";"}{@.metadata.ownerReferences[*].name}{"\n"}{end}'); \
echo "$JOBS" | while IFS= read -r JOB; do \
    JOB_NAME=$(echo "$JOB" | awk -F ';' '{print $1}'); \
    CRONJOB_NAME=$(echo "$JOB" | awk -F ';' '{print $2}'); \
    echo "${JOB_NAME} ${CRONJOB_NAME}"; \
    POD_NAMES=$(kubectl get pod -o jsonpath='{range .items[*]}{@.metadata.name}{"\n"}{end}'); \
    echo "$POD_NAMES" | while IFS= read -r POD_NAME; do \
        echo "${POD_NAME}"; \
        echo "${POD_NAME}" | grep -q "$JOB_NAME"; \
        if [ $? -eq 0 ]; then \
            kubectl logs pod/$POD_NAME --all-containers; \
        fi; \
    done; \
done
```

## Test

### Test images
```
kubectl run test-pod --image=registry.k8s.io/busybox:1.27 --restart=Never --rm -it -- /bin/sh -c 'echo "HelloWorld $(date)"'
# /usr/local/bin/kubectl version
kubectl run test-pod --image=registry.k8s.io/kubectl:v1.36.1 --restart=Never --rm -it -- version
```
