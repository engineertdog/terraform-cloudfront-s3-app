output "certificate-arn" {
    value = "${aws_acm_certificate.mydomain-certificate.arn}"
}