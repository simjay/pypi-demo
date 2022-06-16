# Setup PyPI Server

## Steps
1. Add the PyPI server repository to Helm
```bash
helm repo add owkin https://owkin.github.io/charts
```

2. Generate an encoded username/password
```bash
htpasswd -n -b $USERNAME $PASSWORD
```
Output will be in a format `$username:$encoded_password`. Add these values to `values.yaml`'s auth section.

3. Install the chart onto the Kubernetes cluster
```bash
kubectl create ns pypi-server
helm install pypi-server owkin/pypiserver --namespace pypi-server -f values.yaml
```

4. Perform port-forward to access the web UI
```bash
kubectl port-forward --namespace pypi-server $POD_NAME 8080:8080
```