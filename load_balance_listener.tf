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