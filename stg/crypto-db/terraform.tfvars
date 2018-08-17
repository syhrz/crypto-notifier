service_name = "cryptonotifier"

env = "stg"

service_type = "rds"

identifier = "cryptonotifier"

db_subnet_group_name = "db-subnet-group"

subnet_ids = ["subnet-a362f5ea", "subnet-76731511", "subnet-b80558fe"]

vpc_id = "vpc-f8c91a9f"

domain_sub_name = "cryptonotifier"

zone_id = "Z20XKIJ4Y1OD4C"

domain_name = "db.stg.srzx.xyz"

instance_class = "db.t2.medium"

engine_version = "9.6.6"

database_port = "5432"

multi_az = "true"

allocated_storage = "20"

backup_retention_period = "7"

storage_encrypted = "true"

username = "postgres"

monitoring_role_arn = "arn:aws:iam::595285105917:role/RDSMonitoringRole"

bastion_sg = "sg-093be95dc170f5d6c"
