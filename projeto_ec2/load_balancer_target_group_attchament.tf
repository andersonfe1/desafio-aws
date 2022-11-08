resource "aws_lb_target_group_attachment" "Ruby-Http" {
  target_group_arn = aws_lb_target_group.Ruby-Http.arn
  target_id = aws_instance.Ruby.id
  port = 80

  depends_on = [
    aws_instance.Ruby,
    aws_lb_target_group.Ruby-Http
  ]
}

resource "aws_lb_target_group_attachment" "Ruby-3000" {
  target_group_arn = aws_lb_target_group.Ruby-3000.arn
  target_id = aws_instance.Ruby.id
  port = 3000

  depends_on = [
    aws_instance.Ruby,
    aws_lb_target_group.Ruby-3000
  ]
}