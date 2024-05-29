resource "aws_security_group" "ingress-all-jpetstore" {
    name = "allow-all-sg-jpetstore"
    vpc_id = local.test-env-vpc-id

    ingress{
        cidr_blocks = ["0.0.0.0/0"]
        from_port = 22
        to_port = 22
        protocol = "tcp"
    }

    ingress{
        cidr_blocks = ["0.0.0.0/0"]
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
    }

    ingress {
        protocol    = "icmp"
        from_port   = 8
        to_port     = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress{ 
        cidr_blocks = ["0.0.0.0/0"]
        from_port = 0
        to_port = 0
        protocol = "-1"
    }
}

    