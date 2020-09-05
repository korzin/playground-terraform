module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name = "VPC for ec2"
  cidr = var.vpc_cidr_block
}
