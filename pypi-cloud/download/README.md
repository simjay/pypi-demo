# Download (Install) Packages

## Steps
1. Install a package
```bash
pip3 install cloudopen --index-url=http://$username:$password@localhost:8080/simple --trusted-host=http://localhost
```

2. Verify if the package is installed
```bash
python -c "import cloudopen;cloudopen.greet()"
```
