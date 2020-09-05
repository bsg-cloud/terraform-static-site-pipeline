variable "app_name" {
  description = "Website project name"
  default     = "raj-personal-site"
}

variable "account_id" {
  description = "account id"
  default     = ""
}
variable "aws_region" {
  description = "AWS Region for the VPC"
  default     = "us-east-1"
}

variable "git_repository_owner" {
  description = "Github Repository Owner"
  default     = "msfidelis"
}

variable "git_repository_name" {
  description = "Project name on Github"
  default     = "msfidelis.github.io"
}

variable "git_repository_branch" {
  description = "Github Project Branch"
  default     = "master"
}

variable "github_token" {
  description = "Github Token"
  default     = ""
}
variable "git_repository_dev_branch" {
  description = "Github Project Branch"
  default     = "develop"
}

variable "cdn_domains" {
  description = "Domain alias"
  type        = list
  default     = []
}

variable "acm_certi_arn" {
  default = ""
}
