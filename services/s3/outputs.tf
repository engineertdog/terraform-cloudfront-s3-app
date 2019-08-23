# Outputs
output "s3-website-endpoint" {
  value = "${aws_s3_bucket.myapp.bucket_regional_domain_name}"
}
