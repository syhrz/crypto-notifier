variable "service_name" {}
variable "env" {}
variable "service_type" {}
variable "db_subnet_group_name" {}

variable "availability_zone" {
  default = "ap-southeast-1a,ap-southeast-1b,ap-southeast-1c"
}

variable "identifier" {}

variable "subnet_ids" {
  type = "list"
}

variable "vpc_id" {}
variable "zone_id" {}
variable "domain_name" {}
variable "domain_sub_name" {}
variable "instance_class" {}
variable "engine_version" {}
variable "database_port" {}
variable "bastion_sg" {}
variable "multi_az" {}
variable "allocated_storage" {}
variable "backup_retention_period" {}
variable "storage_encrypted" {}
variable "username" {}

variable "password" {}

variable "monitoring_role_arn" {}
