
variable "vpc_cidr" {
  type = string
  default = "100.0.0.0/16"

}

variable "sub_cidr_a" {
  type    = string
  default = "100.0.1.0/24"
}


variable "sub_cidr_b" {
  type    = string
  default = "100.0.2.0/24"
}

variable "av_zone" {
  type    = string
  default = "us-east-1a"
}


