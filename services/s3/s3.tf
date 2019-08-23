# S3 Bucket
resource "aws_s3_bucket" "myapp" {
  region = "${var.aws-region}"
  bucket = "${var.bucket-name}"

  website {
    index_document = "index.html"
    error_document = "index.html"
  }

  tags = {
    Name        = "${var.bucket-description}"
    Environment = "${var.deployment-env}"
  }
}

# Policy
data "aws_iam_policy_document" "myapp" {
  statement {
    actions = [
      "s3:GetObject",
      "s3:ListBucket"
    ]

    resources = [
      "${aws_s3_bucket.myapp.arn}",
      "${aws_s3_bucket.myapp.arn}/*"
    ]

    principals {
      type        = "AWS"
      identifiers = ["${var.access-identity}"]
    }
  }
}

# Bucket Policy
resource "aws_s3_bucket_policy" "myapp" {
  bucket = "${aws_s3_bucket.myapp.id}"
  policy = "${data.aws_iam_policy_document.myapp.json}"
}
