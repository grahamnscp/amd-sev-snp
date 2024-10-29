# Route53 for instances

resource "aws_route53_record" "sev-snp" {
  zone_id = "${var.route53_zone_id}"
  count = "${var.node_count}"
  name = "${var.prefix}-sev-snp${count.index + 1}.${var.route53_subdomain}.${var.route53_domain}"
  type = "A"
  ttl = "300"
  records = ["${element(aws_eip.sev-snp-eip.*.public_ip, count.index)}"]
}

