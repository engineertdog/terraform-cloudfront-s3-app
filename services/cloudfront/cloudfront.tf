resource "aws_cloudfront_distribution" "myapp" {
  origin {
    domain_name = "${var.s3-website-endpoint}"
    origin_id   = "${var.cloudfront-origin}"

    # Use the following so that you can use the S3 website endpoint from CloudFront.
    custom_origin_config {
      http_port                = 80
      https_port               = 443
      origin_protocol_policy   = "http-only"
      origin_ssl_protocols     = ["TLSv1", "TLSv1.1", "TLSv1.2"]
      origin_read_timeout      = 30
      origin_keepalive_timeout = 5
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"
  price_class         = "PriceClass_All"
  aliases             = ["${var.cloudfront-alias}"]

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "${var.cloudfront-origin}"
    compress         = true

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = {
    Name        = "${var.cloudfront-description}"
    Environment = "${var.deployment-env}"
  }

  viewer_certificate {
    ssl_support_method  = "sni-only"
    acm_certificate_arn = "${var.acm-certificate-arn}"
    minimum_protocol_version = "TLSv1.1_2016"
  }
}
