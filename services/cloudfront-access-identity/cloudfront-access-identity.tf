resource "aws_cloudfront_origin_access_identity" "my-app" {
  comment = "${var.access-identity-description}"
}
