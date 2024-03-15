terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.16.2"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.72.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-terraform-state-v2"
    storage_account_name = "rafaelsterraformstatev2"
    container_name       = "remote-state-v2"
    key                  = "pipeline-azure-devops/terraform.tfstate"
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      owner      = "rafaalmeidaterraformer"
      managed-by = "terraform"
    }
  }
}

provider "azurerm" {
  features {}
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "rafael-bucket-remote-state"
    key    = "aws-vpc/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "vnet" {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg-terraform-state-v2"
    storage_account_name = "rafaelsterraformstatev2"
    container_name       = "remote-state-v2"
    key                  = "azure-vnet-2/terraform.tfstate"
  }
}
