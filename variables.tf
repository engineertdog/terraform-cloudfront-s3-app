# Auth
variable "aws-region" {
  default = "us-east-2"
}

# ENV
variable "deployment-env" {
  default = "prod"
}

# ACM
variable "domain" {
  default = "mydomain.com"
}

variable "alerternative-domains" {
  default = ["sub.domain.com", "sub2.domain.com"]
}

# S3
variable "bucket-name" {
  default = "myunique-bucket-name"
}

variable "bucket-description" {
  default = "My unique app storage"
}

# Cloudfront
variable "acm-certificate-arn" {
  default = "arn:aws:acm:us-east-1:account:certificate/id"
}

variable "cloudfront-description" {
  default = "My unique app CDN"
}

variable "cloudfront-origin" {
  default = "origin-identifier"
}

variable "cloudfront-alias" {
  default = "subdomain-name.domain-for-app.io"
}


# Route 53
variable "route53-zone-id" {
  default = "domain-hosted-zone-id"
}

variable "route53-record-name" {
  default = "subdomain-name"
}
