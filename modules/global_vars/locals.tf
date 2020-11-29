locals {

  aws_settings = {
    aws_region = "us-east-1"
    # to get aws private/public keys
    aws_profile = "tfplayground-own"
  }

  email_for_sns_subscription = "samkorzin@gmail.com"

  shared_tags = {
    Project = "Terraform_Playground"
  }

  development_vpc = {
    cidr = "10.10.0.0/16"
  }
}