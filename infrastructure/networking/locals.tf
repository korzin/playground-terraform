locals {
  module_global_vars = module.global_vars.output

  tags = merge(local.module_global_vars.shared_tags, {
    Environment     = "development-vpc"
    TerraformModule = "networking"
  })
}