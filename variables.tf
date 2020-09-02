
variable "aws_region" {
  type = string
}
variable "cred_file_path" {
  type = string
}
variable "vpc_cidr_block" {
  type = string
}
variable "av_zones" {
  type = list(string)
}
variable "private_subnets" {
  type = list(string)
}
variable "public_subnets" {
  type = list(string)
}
variable "image_id" {
  type = string
  description = "Should be ubuntu, or at least from debian family"
}
