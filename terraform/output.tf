output "ssh_command" {
  value = "ssh -i ${var.ami_key_pair_name}.pem ec2-user@${aws_instance.jpetstore_host.public_ip}"
  description = "SSH command to connect to the EC2 instance"
}

output "jpetstore_url" {
  value = "${aws_instance.jpetstore_host.public_ip}:8080/jpetstore"
  description = "The URL of the JPetStore app"
}

output "private_ip" {
  value = aws_instance.jpetstore_host.private_ip
  description = "The private IP address of the jpetstore EC2 instance."
}