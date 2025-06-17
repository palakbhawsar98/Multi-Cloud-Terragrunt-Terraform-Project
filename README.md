# Multi-Cloud Multi-Environment Terraform Infrastructure with Terragrunt

This repository demonstrates a modular, environment-specific infrastructure-as-code setup using **Terraform**, **Terragrunt**, and **TFLint**, designed to provision resources across **AWS** and **Azure**. It promotes scalable, maintainable, and DRY (Don't Repeat Yourself) infrastructure across multiple cloud environments (`dev`, `test`, `prod`).

---

## Prerequisites

Make sure you have the following tools installed:

- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- [Terragrunt](https://terragrunt.gruntwork.io/docs/getting-started/install/)
- [TFLint](https://github.com/terraform-linters/tflint)
- [Pre-commit](https://pre-commit.com/)

---

## Root Configuration

The `root.hcl` file contains shared configuration (like remote state backend and common settings), which is included in all environment-specific `terragrunt.hcl` files using:

```hcl
include "root" {
  path = find_in_parent_folders()
}


📁 Project Structure

multi-cloud-terraform/
├── aws/ # Top-level Terraform config for AWS
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf
├── azure/ # Top-level Terraform config for Azure
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf
├── modules/ # Reusable modules for both providers
│ ├── aws/
│ │ └── compute/ # EC2 instance module for AWS
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ └── azure/
│ └── storage/ # Storage account module for Azure
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf
├── envs/ # Environment-specific configurations
│ ├── dev/
│ │ ├── aws/
│ │ │ └── terragrunt.hcl
│ │ └── azure/
│ │ └── terragrunt.hcl
│ ├── test/
│ │ ├── aws/
│ │ │ └── terragrunt.hcl
│ │ └── azure/
│ │ └── terragrunt.hcl
│ └── prod/
│ ├── aws/
│ │ └── terragrunt.hcl
│ └── azure/
│ └── terragrunt.hcl
├── scripts/ # Shell scripts for automation
│ ├── deploy.sh
│ ├── validate.sh
│ └── plan.sh
├── .tflint.hcl # TFLint configuration file
├── .pre-commit-config.yaml # Pre-commit hook config
├── root.hcl # Common Terragrunt configuration
└── README.md
````

## Usage guide

### 1. Navigate to Environment Directory

```bash
cd envs/dev/aws
cd envs/test/azure
cd envs/prod/aws
````

### 2. Run Terragrunt Commands

```bash
terragrunt init       # Initialize remote backend
terragrunt validate   # Validate configuration
terragrunt plan       # Show planned changes
terragrunt apply      # Apply infrastructure changes
````

### 3. Code Linting with TFLint
To check Terraform code quality using TFLint:

```bash
tflint --init
tflint
````
### 4. Pre-Commit Checks

```bash
pre-commit install
pre-commit run --all-files
````
