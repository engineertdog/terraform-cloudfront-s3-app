output "zone-id" {
  value = "${aws_cloudfront_distribution.myapp.hosted_zone_id}"
}

output "domain-name" {
  value = "${aws_cloudfront_distribution.myapp.domain_name}"
}
