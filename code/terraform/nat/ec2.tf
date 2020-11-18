resource "aws_instance" "nat" {
  ami = data.aws_ami.ubuntu1804.image_id # Latest Ubuntu 18.04 AMI as of posting
  instance_type = "t3a.nano"
  key_name = "{your key here}"
  subnet_id = aws_subnet.c.id
  vpc_security_group_ids = [aws_security_group.nat.id]

  disable_api_termination = false
  associate_public_ip_address = true
  source_dest_check = false

  credit_specification {
    cpu_credits = "standard"
  }

  root_block_device {
    delete_on_termination = false
    volume_size = 8
    volume_type = "gp2"
  }

  user_data = file("nat.sh")

  tags = {
    Name = "NAT Instance"
  }
}