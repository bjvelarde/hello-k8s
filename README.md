## Build and Deploy

```bash
# Build Docker image
docker build -t bvelarde/hello-k8s:latest ./app

# Push to Docker Hub
docker push bvelarde/hello-k8s:latest

# Deploy with Terraform
cd terraform
terraform apply
```

### or Using make
```bash
make build
make push
make deploy
make all
