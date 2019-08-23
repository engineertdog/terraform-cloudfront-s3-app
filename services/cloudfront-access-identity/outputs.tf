output "myapp-access-identity-arn" {
  value = "${aws_cloudfront_origin_access_identity.my-app.iam_arn}"
}

output "myapp-access-identity-cloudfront" {
  value = "${aws_cloudfront_origin_access_identity.my-app.cloudfront_access_identity_path}"
}
