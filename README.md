# AWS Dynamic Web App Hosting with Terraform modules, Docker, Amazon ECR, and ECS

This project serves as a practical demonstration of my abilities in developing Terraform modules for deploying dynamic web applications on Amazon Web Services (AWS) while embracing modern DevOps practices. By using Terraform for infrastructure provisioning, Docker for containerization, Amazon ECR for image storage, and ECS for container orchestration, this project showcases a robust and scalable solution for hosting web applications on AWS.

![diagram.png](https://github.com/pdnt/rz-infrastructure-ecs/blob/main/diagram.png?raw=true)

## How to deploy the web application

First, create your docker image. If you want to test the deployment without creating an image, you can pull a car rental booking template I dockerized and pushed to DockerHub:
```
docker pull pdnt/rentzone:1.0.0
```


Create an Amazon ECR repository using the aws cli
```
aws ecr create-repository --repository-name <repository-name> --region <region>
```

Tag the image
```
docker tag <image-tag> <repository-uri>
```

Login to Amazon ECR
```
aws ecr get-login-password | docker login --username AWS --password-stdin <aws_account_id>.dkr.ecr.<region>.amazonaws.com
```

Push the image to Amazon ECR
```
docker push <repository-uri>
```

Next, clone this repository and the necessary modules. The Terraform modules used in this project are stored in a separate repository located at [pdnt/terraform-modules](https://github.com/pdnt/terraform-modules).

Finally, you need to create 2 files that will contain environment variables. They should be created in the folder where you cloned this repository.
The first file will be named ***rentzone.env*** and it's associated with the S3 bucket that will contain our template and the necessary information to connect to the RDS instance.
Fill in the empty variables with the values specific to your deployment.

```
PERSONAL_ACCESS_TOKEN=[Replace me with a GitHub access token]
GITHUB_USERNAME=[Replace me with your github username]
REPOSITORY_NAME=[Replace me with the name of your repository containing the files from this repository]
WEB_FILE_ZIP=rentzone.zip
WEB_FILE_UNZIP=rentzone
DOMAIN_NAME=[Replace me with your domain name. For example: www.pablodip.me]
RDS_ENDPOINT=[Replace me with the RDS Endpoint]
RDS_DB_NAME=[Replace me with the name of the RDS Database]
RDS_MASTER_USERNAME=azeezs
RDS_DB_PASSWORD=azeezs123
```
> Note: The RDS password is insecure. This Docker image was built just for demonstration purposes.
> Credential Access consists of techniques for stealing credentials like account names and passwords. Read more about the techniques used to obtain credentials here: [MITRE ATT&CK](https://attack.mitre.org/tactics/TA0006/)

The second file will be named ***terraform.tfvars*** and will assign values to all of our Terraform variables.
Fill in the empty variables with the values specific to your deployment. 

```
# VPC variables
region                       = "[Replace me with your prefered region]"
project_name                 = "rentzone"
environment                  = "dev"
vpc_cidr                     = "10.0.0.0/16"
public_subnet_az1_cidr       = "10.0.0.0/24"
public_subnet_az2_cidr       = "10.0.1.0/24"
private_app_subnet_az1_cidr  = "10.0.2.0/24"
private_app_subnet_az2_cidr  = "10.0.3.0/24"
private_data_subnet_az1_cidr = "10.0.4.0/24"
private_data_subnet_az2_cidr = "10.0.5.0/24"

# Security group variables
ssh_ip = "[Replace me with your IP]"

# RDS variables
database_snapshot_identifier = "dev-rds-instance"
database_instance_class      = "db.t2.micro"
database_instance_identifier = "dev-rds-db"
multi_az_deployment          = "false"

# acm variables
domain_name       = "[Replace me with your domain name]"
alternative_names = "[Replace me with your domain name with a wildcard as a subdomain. For example: *.pablodip.me]"

# alb variables
target_type = "ip"

# s3 variables
env_file_bucket_name    = "ecs-env-file-bucket"
env_file_name           = "rentzone.env"
block_public_acls       = true
block_public_policy     = true
ignore_public_acls      = true
restrict_public_buckets = true
# ecs variables
architecture    = "X86_64"
container_image = "[Replace me with the ARN of the image you pushed to AWS in the previous steps]"

# Route 53 variables
record_name = "www"

```
