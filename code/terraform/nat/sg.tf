resource "aws_security_group" "nat" {
  name = "nat"
  description = "SG for NAT Instance"
  vpc_id = aws_vpc.duh.id

  ingress {
    description = "Ingress Port 80 Traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.duh.cidr_block]
  }

  ingress {
    description = "Ingress Port 443 Traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.duh.cidr_block]
  }

  ingress {
    description = "Access from Bastion"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["{some bastion ip}"]
  }

  egress {
    description = "Egress Port 80 Traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Egress Port 443 Traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nat"
  }
}
