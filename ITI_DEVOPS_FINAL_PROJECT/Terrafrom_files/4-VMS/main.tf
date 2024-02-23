resource "aws_instance" "public-ec2" {
  ami                         = var.ec2_ami
  instance_type               = var.ec2_type
  vpc_security_group_ids      = var.SG_id
  subnet_id                   = var.ec2_subnet_ID
  associate_public_ip_address = var.associate_public_ip_address
  key_name                    = var.key_pair
  tags = {
    Name = var.ec2_name
  }
    provisioner "local-exec" {
    command = "echo '${aws_instance.public-ec2.public_ip}' > instance_ip.txt"
  }
}

resource "aws_iam_instance_profile" "test_profile1" {
  name = "test_profile1"
  role = "nodes_role1"
}