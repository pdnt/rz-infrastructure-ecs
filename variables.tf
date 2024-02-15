# Environment variables
variable "region" {}
variable "project_name" {}
variable "environment" {}

# VPC variables
variable "vpc_cidr" {}
variable "public_subnet_az1_cidr" {}
variable "public_subnet_az2_cidr" {}
variable "private_app_subnet_az1_cidr" {}
variable "private_app_subnet_az2_cidr" {}
variable "private_data_subnet_az1_cidr" {}
variable "private_data_subnet_az2_cidr" {}

# Security groups variable
variable "ssh_ip" {}

# RDS variables
variable "database_snapshot_identifier" {}
variable "database_instance_class" {}
variable "database_instance_identifier" {}
variable "multi_az_deployment" {}

# acm variables
variable "domain_name" {}
variable "alternative_names" {}

# alb variables
variable "target_type" {}

# s3 variables
variable "env_file_bucket_name" {}
variable "env_file_name" {}
variable "block_public_acls" {}
variable "block_public_policy" {}
variable "ignore_public_acls" {}
variable "restrict_public_buckets" {}

# ecs variables
variable "architecture" {}
variable "container_image" {}

# Route 53 variables
variable "record_name" {}

