# Outputs
output "s3-website-endpoint" {
  value = "${aws_s3_bucket.myapp.website_endpoint}"
}
