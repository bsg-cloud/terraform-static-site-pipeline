resource "aws_cloudfront_distribution" "site_s3_distribution" {

  aliases             = var.cdn_domains
  price_class         = "PriceClass_All"
  depends_on          = [aws_s3_bucket.bucket_site]
  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"

  comment = "${var.app_name}-${var.git_repository_branch}-cdn"

  origin {
    domain_name = aws_s3_bucket.bucket_site.website_endpoint
    origin_id   = aws_s3_bucket.bucket_site.id

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1"]
    }
  }

  default_cache_behavior {

    allowed_methods = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods  = ["GET", "HEAD", "OPTIONS"]

    target_origin_id = aws_s3_bucket.bucket_site.id

    forwarded_values {
      headers = [
        "Accept",
        "Origin",
      ]
      query_string = true

      cookies {
        forward = "all"
      }
    }

    //viewer_protocol_policy = "allow-all"
    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 0
    max_ttl                = 0

  }

  ordered_cache_behavior {

    path_pattern    = "*.js"
    allowed_methods = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods  = ["GET", "HEAD", "OPTIONS"]

    target_origin_id = aws_s3_bucket.bucket_site.id

    forwarded_values {
      headers = [
        "Accept",
        "Origin",
      ]
      query_string = true

      cookies {
        forward = "all"
      }

    }

    min_ttl     = 0
    default_ttl = 3600
    max_ttl     = 86400
    compress    = true
    //    viewer_protocol_policy = "allow-all"
    viewer_protocol_policy = "redirect-to-https"

  }


  ordered_cache_behavior {

    path_pattern    = "*.css"
    allowed_methods = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods  = ["GET", "HEAD" ]

    target_origin_id = aws_s3_bucket.bucket_site.id

    forwarded_values {
      query_string = true
      cookies {
        forward = "all"
      }
    }

    min_ttl     = 0
    default_ttl = 3600
    max_ttl     = 86400
    compress    = true
    //viewer_protocol_policy = "allow-all"
    viewer_protocol_policy = "redirect-to-https"

  }

  ordered_cache_behavior {

    path_pattern    = "*.png"
    allowed_methods = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods  = ["GET", "HEAD"]

    target_origin_id = aws_s3_bucket.bucket_site.id

    forwarded_values {
      query_string = true
      cookies {
        forward = "all"
      }
    }

    min_ttl     = 0
    default_ttl = 3600
    max_ttl     = 86400
    compress    = true
    //viewer_protocol_policy = "allow-all"
    viewer_protocol_policy = "redirect-to-https"


  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = {
    Environment = "${var.app_name}-${var.git_repository_branch}"
  }

  viewer_certificate {
    acm_certificate_arn            = var.acm_certi_arn
    cloudfront_default_certificate = false
    ssl_support_method             = "sni-only"
  }

}
