resource "aws_instance" "bastion" {
  ami                      = "var.ocp3_ami"
  instance_type            = "var.instance_type_bastion"
  vpc_security_group_ids   = aws_security_group.allow_ssh.*.id

  tags = {
    Name = "OCP3 Bastion"
  }
}

