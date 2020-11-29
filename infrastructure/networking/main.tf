module global_vars {
  source = "../../modules/global_vars"
}

resource aws_vpc development_vpc {
  cidr_block = local.module_global_vars.development_vpc.cidr
  instance_tenancy = "default"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"

  tags = merge(local.module_global_vars.shared_tags, {
    Name = "Development VPC"
  })
}