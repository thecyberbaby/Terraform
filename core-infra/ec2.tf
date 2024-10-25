resource "aws_instance" "jenkins_server" {
  ami                         = var.bastion_ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.public-subnet-1.id
  vpc_security_group_ids      = [aws_security_group.dev-sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "dev-jenkins_server"
  }

  user_data = file("../scripts/install-tools.sh")
}
