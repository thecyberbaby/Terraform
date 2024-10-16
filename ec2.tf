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

  user_data = <<-EOF
    #!/bin/bash
    # Install updates and required packages
    sudo yum update -y
    sudo amazon-linux-extras install java-openjdk11 -y

    # Add Jenkins repository and key
    wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
    rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
    
    # Install Jenkins
    sudo yum install jenkins -y
    
    # Start and enable Jenkins service
    sudo systemctl start jenkins
    sudo systemctl enable jenkins
  EOF
}
