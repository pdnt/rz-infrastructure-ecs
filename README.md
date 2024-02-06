# AWS Dynamic Web App Hosting with Terraform modules, Docker, Amazon ECR, and ECS

## Overview

This project aims to demonstrate how to deploy a dynamic web application on Amazon Web Services (AWS) infrastructure using modern DevOps practices. By leveraging Terraform for infrastructure provisioning, Docker for containerization, Amazon ECR for image storage, and ECS for container orchestration, this project showcases a robust and scalable solution for hosting web applications on AWS.

![diagram.png](https://github.com/pdnt/rz-infrastructure-ecs/blob/main/diagram.png?raw=true)

## Features

- Infrastructure as Code (IaC) using Terraform modules
- Docker containerization for application deployment
- ECS for managing application workloads
- Scalable and resilient architecture for hosting dynamic web applications

## Terraform Modules

The Terraform modules used in this project are stored in a separate repository located at [pdnt/terraform-modules](https://github.com/pdnt/terraform-modules). These modules provide reusable infrastructure components for provisioning AWS resources.

## Project Structure

- `main.tf`: Main Terraform configuration file containing infrastructure provisioning code.
- `backend.tf`: Defines the backend configuration for storing Terraform state.
- `providers.tf`: Specifies the providers used in the project.
- `variables.tf`: Defines input variables for the project.

## Contributing

Contributions to this project are welcome! If you have any suggestions, bug fixes, or enhancements, please feel free to open an issue or submit a pull request.


## Acknowledgements

This project is part of a course taught by [Azeez Salu](https://github.com/aosnotes77)
