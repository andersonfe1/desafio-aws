resource "aws_lb_target_group_attachment" "Ruby-Http" {
  target_group_arn = aws_lb_target_group.Ruby-Http.arn
  target_id = aws_instance.Ruby.id
  port = 80

  depends_on = [
    aws_instance.Ruby,
    aws_lb_target_group.Ruby-Http
  ]
}