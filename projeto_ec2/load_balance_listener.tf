resource "aws_lb_listener" "Ruby-Http" {
  load_balancer_arn = aws_lb.Ruby.arn
  port = "80"
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.Ruby-Http.arn
  }

  tags = {
      Name = "Ruby-Http"
  }

  depends_on = [
    aws_lb.Ruby
  ]
}

resource "aws_lb_listener" "Ruby-3000" {
  load_balancer_arn = aws_lb.Ruby.arn
  port = "3000"
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.Ruby-3000.arn
  }

  tags = {
      Name = "Ruby-3000"
  }

  depends_on = [
    aws_lb.Ruby
  ]
}