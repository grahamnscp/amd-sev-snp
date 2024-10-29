# Instances:

# Rancher Cluster Instances:
#
resource "aws_instance" "sev-snp" {

  instance_type = "${var.aws_instance_type}"
  ami           = "${var.aws_ami}"
  key_name      = "${var.aws_key_name}"

  # Enable AMD-SEV-SNP cpu option at boot
  cpu_options {
    amd_sev_snp = "enabled"
  }

  root_block_device {
    volume_size = "${var.volume_size}"
    volume_type = "gp2"
    delete_on_termination = true
  }

  iam_instance_profile = "${aws_iam_instance_profile.sev-snp_instance_profile.id}"

  vpc_security_group_ids = ["${aws_security_group.dc-instance-sg.id}"]
  subnet_id = "${aws_subnet.dc-subnet1.id}"

  user_data = "${file("userdata.sh")}"

  count = "${var.node_count}"

  tags = {
    Name = "${var.prefix}-sev-snp${count.index + 1}"
  }
}

