# Setup PyPI Cloud

## Steps
1. Generate hashed password with `ppc-gen-password`
```bash
pip3 install pypicloud
ppc-gen-password
```   

2. Modify `server.ini`
```yaml
# Storage backend
pypi.storage = s3
storage.bucket = pypi-cloud-demo
storage.region_name = us-east-1
storage.prepend_hash = false

# Cache backend
pypi.db = dynamo
db.region_name = us-east-1
db.tablenames = pypi-package pypi-summary

auth.admins =
  testuser

user.testuser = $6$rounds=20500$5GrBCElVhi7NkUh7$lKwhrX14RijbD2D8DLLEe8ARM3OGKSruTnNWbzDDsjeB7a15bnoK3jg5gemQLmKgUxrvUA4OMnMfE5FOmdkJ2/
```

3. Build Docker image for PyPI Cloud
```bash
cd docker
bash build.sh -v $VERSION
```

4. Deploy to Kubernetes cluster
```bash
kubectl create ns pypi-cloud
cd chart
helm upgrade pypi-cloud ./pypi-cloud -n pypi-cloud
```

4. Perform port-forward to access the web UI
```bash
kubectl port-forward --namespace pypi-cloud $POD_NAME 8080:8080
```

