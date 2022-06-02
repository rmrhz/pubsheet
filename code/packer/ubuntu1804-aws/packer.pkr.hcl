variable "aws_account_id" {
  type = string
  default = ""
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "region" {
  type    = string
  default = "{{env `PACKER_REGION`}}"
}

variable "ssh_username" {
  type    = string
  default = "ubuntu"
}

variable "subnet_id" {
  type    = string
  default = "{{env `PACKER_SUBNET_ID`}}"
}

variable "ssh_keypair_name" {
  type = string
  default = "{{env `PACKER_KEYPAIR_NAME`}}"
}

# "timestamp" template function replacement
locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}

source "amazon-ebs" "ubuntu1804" {
  assume_role {
    role_arn     = "arn:aws:iam::${var.aws_account_id}:role/packer"
    session_name = "PackerBuilder-${local.timestamp}"
    external_id  = "PackerBuilder"
  }

  ami_name                    = "ubuntu1804-base-${local.timestamp}"
  associate_public_ip_address = true
  communicator                = "ssh"
  instance_type               = "${var.instance_type}"
  profile                     = "default"
  region                      = "${var.region}"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-bionic-18.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"] // canonical id
  }
  ssh_keypair_name     = "${var.ssh_private_key_file}"
  # ssh_private_key_file = "~/.ssh/id_rsa" # The default value
  ssh_username         = "${var.ssh_username}"
  subnet_id            = "${var.subnet_id}"
  tags = {
    Name = "ubuntu1804-base-${local.timestamp}"
  }
}

build {
  sources = ["source.amazon-ebs.ubuntu1804"]

  provisioner "ansible" {
    # extra_arguments = ["-vvvv"]
    playbook_file   = "./playbook.yml"
    user            = "ubuntu"
  }
}
