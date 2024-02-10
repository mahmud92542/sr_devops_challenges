provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "web-server" {
  ami           = "" // specify your desired AMI
  instance_type = "" // specify your desired instance type
  key_name      = "" // specify your existing key pair name

  subnet_id     = "" // specify your desired subnet ID
  vpc_security_group_ids = [""] // specify your desired security group IDs
}
