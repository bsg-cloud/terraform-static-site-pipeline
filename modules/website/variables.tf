variable "app_name" {
  description = "Website project name"
}

variable "aws_region" {
  description = "AWS Region for the VPC"
}

variable "git_repository_owner" {
  description = "Github Repository Owner"
}

variable "git_repository_name" {
  description = "Project name on Github"
}

variable "git_repository_branch" {
  description = "Github Project Branch"
}

variable "git_repository_dev_branch" {
  description = "Github Project Branch"
}

variable "github_token" {
  description = "Github Project Branch"
}

variable "account_id" {
  description = "AWS Account ID"
}

variable "cdn_domains" {
  description = "Domain alias"
  type = list
  default = []
}
variable "acm_certi_arn" {
  description = "ACM Certificate ARN"
  default = "" 
}
