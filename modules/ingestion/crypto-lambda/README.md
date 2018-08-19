# How to Deploy

Since AWS Lambda don't have support with Go editor, we need to build the main.go
and create binary that run on linux.

```
GOOS=linux go build -o main
```

Archive the result
```
zip -r main.zip main
```

Execute the terraform
```
terraform init
terraform apply
```
