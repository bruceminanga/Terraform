# Reusable Terraform Modules Library

A collection of modular, production-ready Terraform modules for provisioning core AWS infrastructure (compatible with AWS and LocalStack).

These modules are designed to be imported into external projects directly via Git.

---

## 📦 Available Modules

| Module | Path | Description |
| :--- | :--- | :--- |
| **VPC** | `modules/vpc` | 2-AZ VPC with public/private subnets and optional NAT Gateway |
| **S3** | `modules/s3-secure-bucket` | Secure S3 bucket with versioning and encryption |
| **EC2** | `modules/ec2-app-server` | Application compute instance with IAM integration |
| **ALB** | `modules/alb` | Application Load Balancer with target groups and listeners |

---

## 🚀 How to Use in Other Projects

Call these modules directly in your environment's `main.tf` using the GitHub source syntax:

```hcl
module "vpc" {
  source = "github.com/bruceminanga/m-treat-project//terraform/modules/vpc?ref=main"

  environment           = "dev"
  vpc_cidr              = "10.0.0.0/16"
  public_subnet_a_cidr  = "10.0.1.0/24"
  public_subnet_b_cidr  = "10.0.2.0/24"
  private_subnet_a_cidr = "10.0.10.0/24"
  private_subnet_b_cidr = "10.0.20.0/24"
  enable_nat_gateway    = true
}

module "s3" {
  source = "github.com/bruceminanga/m-treat-project//terraform/modules/s3-secure-bucket?ref=main"

  environment = "dev"
  bucket_name = "my-app-storage-dev"
}