locals {
    instance_type = var.environment == "prod" ? "t2.micro" :"t2.small"
  
}