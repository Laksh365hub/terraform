terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.13.0"
    }
  }

  backend "s3" {
    bucket = "aws81-mln"
    key = "remote-state-demo"
    region = "us-east-1"
  }
}


provider "aws" {
    region = "us-east-1"
}