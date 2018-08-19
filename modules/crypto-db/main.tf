terraform {
  backend "s3" {
    bucket = "crypto-tf-state-stg"
    key    = "crypto-db"
    region = "ap-southeast-1"
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_security_group" "db_security_group" {
  name        = "${var.identifier}-${var.env}-sg"
  description = "Allow access to ${var.identifier}"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port       = "${var.database_port}"
    to_port         = "${var.database_port}"
    protocol        = "tcp"
    security_groups = ["${var.bastion_sg}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

module "rds" {
  source                  = "git@github.com:syhrz/tf-simple-rds.git?ref=v1.3"
  env                     = "${var.env}"
  service_name            = "${var.service_name}"
  service_type            = "${var.service_type}"
  name                    = "${var.identifier}"
  username                = "${var.username}"
  password                = "${var.password}"
  identifier              = "${var.identifier}"
  db_subnet_group_name    = "${var.db_subnet_group_name}"
  subnet_ids              = "${var.subnet_ids}"
  rds_vpc_id              = "${var.vpc_id}"
  zone_id                 = "${var.zone_id}"
  domain_name             = "${var.domain_name}"
  domain_sub_name         = "${var.domain_sub_name}"
  instance_class          = "${var.instance_class}"
  engine_version          = "${var.engine_version}"
  db_security_group       = "${aws_security_group.db_security_group.id}"
  multi_az                = "${var.multi_az}"
  allocated_storage       = "${var.allocated_storage}"
  backup_retention_period = "${var.backup_retention_period}"
  storage_encrypted       = "${var.storage_encrypted}"
  monitoring_role_arn     = "${var.monitoring_role_arn}"
}
