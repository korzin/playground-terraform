
provider aws {
  profile = local.module_global_vars.aws_settings.aws_profile
  region  = local.module_global_vars.aws_settings.aws_region
}


terraform {
  backend s3 {
    bucket         = "terraform-state-play-ground"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-play-ground-lock"
    profile        = "tfplayground-own"
    encrypt        = true

    key = "infrastructure/networking/terraform.tfstate"
  }
}
