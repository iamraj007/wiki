
resource "aws_security_group" "Wiki-sg-http-allow" {
  vpc_id      = aws_vpc.Wiki_VPC.id
  name        = "http-allow"
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = var.http
    to_port     = var.http
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = var.http_secure
    to_port     = var.http_secure
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = var.database_port
    to_port     = var.database_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name    = "SG-web_Allow"
    Product = "Wiki"
  }
}


resource "aws_security_group" "Wiki-ssh-allow" {
  vpc_id = aws_vpc.Wiki_VPC.id
  name   = "ssh-allow"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name    = "SG-SSH-Allow"
    Product = "Wiki"
  }

}
