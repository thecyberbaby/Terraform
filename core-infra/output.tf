output "jenkins_instance_public_ip" {
  description = "The public IP address of the instance"
  value       = aws_instance.jenkins_server.public_ip
}

output "jenkins_instance_public_dns" {
  description = "The public DNS of the instance"
  value       = aws_instance.jenkins_server.public_dns
}
