output global_vars_config_module_output {

  value = {
    aws_settings = local.aws_settings

    email_address_sns_subscription = local.email_for_sns_subscription

    shared_tags = local.shared_tags
  }
}