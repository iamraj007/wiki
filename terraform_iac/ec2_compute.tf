provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "Wiki-web-host" {
  ami             = var.ami_id
  instance_type   = lookup(var.ec2_instance_type, "small")
  subnet_id       = aws_subnet.Wiki-subnet.id
  security_groups = [aws_security_group.Wiki-sg-http-allow.id, aws_security_group.Wiki-ssh-allow.id]
  key_name        = "infra-home"
  user_data       = "${data.template_file.user_data.rendered}"
  #  key_name = "Wiki_keypair"
  tags = {
    Name    = "${var.app}-Web-Node"
    Product = "Wiki"
  }
}

data "template_file" "user_data" {
  template = "${file("userdata.sh")}"
}

#resource "aws_key_pair" "Wiki_keypair" {
#  key_name   = "Wiki_keypair"
#  public_key = file(var.key_path)
#}

output "Wiki-Node-IP" {
  value = aws_instance.Wiki-web-host.public_ip
}

