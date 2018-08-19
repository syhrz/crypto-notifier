# How to Deploy

Since AWS Lambda don't have support with Go editor, we need to build the main.go
```
GOOS=linux go build -o main
```

Archive the result
```
zip -r main.zip main
```

Execute the terraform
```
terraform apply
```
