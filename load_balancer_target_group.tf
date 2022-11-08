resource "aws_lb_target_group" "Ruby-Http" {
  name = "Ruby-Http"
  port = 80
  protocol = "HTTP"
  vpc_id = data.aws_vpc.default.id

  health_check {
    protocol = "HTTP"
    path = "/"
  }

  tags = {
      Name = "Ruby-Http"
  }
}