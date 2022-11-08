resource "aws_lb" "Ruby" {
  name = "Ruby"
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.LB-Ruby.id]
  subnets = [data.aws_subnet.subnet1.id, data.aws_subnet.subnet2.id]

  enable_deletion_protection = false    # Colocar true para habilitar o protection termination

  tags = {
    Name = "Ruby"
  }

  depends_on = [
    aws_security_group.LB-Ruby
  ]
}