resource "aws_elb" "elb" {
  name               = "wiki-elb"
  security_groups = [aws_security_group.Wiki-sg-http-allow.id]
  subnets = ["${aws_subnet.Wiki-subnet.id}"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }
  instances                   = [aws_instance.Wiki-web-host.id, aws_instance.Wiki-web-host-2.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400
  tags = {
    Name = "${var.app}-wiki-elb"
  }
}


output "lb_endpoint" {
  value = "${aws_elb.elb.dns_name}"
}
