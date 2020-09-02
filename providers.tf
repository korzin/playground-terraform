provider "aws" {
  source = "hashicorp/aws"
  version = "~> 2.0"
  region = var.aws_region
  profile = "default"
  shared_credentials_file = var.cred_file_path
}
