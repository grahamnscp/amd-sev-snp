# elastic ips

# Associate Elastic IPs to Instances
resource "aws_eip" "sev-snp-eip" {

  count = "${var.node_count}"
  instance = "${element(aws_instance.sev-snp.*.id, count.index)}"

  tags = {
    Name = "${var.prefix}_sev-snp${count.index + 1}"
  }

  depends_on = [aws_instance.sev-snp]
}
