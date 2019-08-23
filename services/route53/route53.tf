resource "aws_route53_record" "www" {
  zone_id = "${var.zone-id}"
  name    = "${var.record-name}"
  type    = "A"

  alias {
    name                   = "${var.domain-name}"
    zone_id                = "${var.record-zone-id}"
    evaluate_target_health = true
  }
}
