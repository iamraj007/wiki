
variable "ami_id" {
  default = "ami-0affd4508a5d2481b"
}

variable "ec2_instance_type" {
  type = map
  default = {
    "small"  = "t3.micro"
    "medium" = "t3.medium"
    "large"  = "t3.large"
  }
}

variable app {
  default = "Wiki"
}


