# Ingestion Module Database

## Prerequisite
- AWS Account
- db-subnet-group for RDS

## How to deploy
Some variables in `terraform.tfvars` might need to be tweaked based on the AWS
environment where this script executed.
First, initialize the terraform.
```
terraform init
```
then to create the RDS stack.
```
Terraform plan
```
