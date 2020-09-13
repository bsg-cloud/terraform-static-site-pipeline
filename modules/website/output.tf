output "s3-bucket" {
  value = "${aws_s3_bucket.bucket_site.website_endpoint}"
}

output "s3-cdn" {
  value = "${aws_cloudfront_distribution.site_s3_distribution.domain_name}"
}

output "cdn-codepipeline-arn" {
  value = aws_codepipeline.prod_pipeline.arn
}


