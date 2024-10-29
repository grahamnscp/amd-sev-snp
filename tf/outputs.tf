# Output Values:

# Domain
output "domainname" {
  value = "${var.route53_subdomain}.${var.route53_domain}"
}

# Instances
output "instance-private-ips" {
  value = ["${aws_instance.sev-snp.*.private_ip}"]
}
output "instance-public-eips" {
  value = ["${aws_eip.sev-snp-eip.*.public_ip}"]
}
output "instance-names" {
  value = ["${aws_route53_record.sev-snp.*.name}"]
}

