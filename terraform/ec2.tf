
resource "aws_instance" "jpetstore_host" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.ami_key_pair_name

  security_groups = [aws_security_group.ingress-all-jpetstore.id]
  subnet_id       = local.app-subnet-id

  user_data = file("user_data.sh")

  tags =  {
    Name = "${var.project_name}-jpetstore-${var.project_owner}"
  }
}