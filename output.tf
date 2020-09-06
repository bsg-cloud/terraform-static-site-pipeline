output "website-s3-endpoint" {
  value = "${module.production.s3-bucket}"
}

output "website-cdn-endpoint" {
  value = "${module.production.s3-cdn}"
}

output "website-cdn-pipeline-arn" {
  value = "${module.production.cdn-codepipeline-arn}"
}
