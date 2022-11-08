resource "aws_security_group" "EC2-Ruby" {
  name = "EC2-Ruby"
  description = "EC2 Ruby"
  vpc_id = data.aws_vpc.default.id

  ingress {
    description = "Allow SSH connections"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP Load Balancer"
    from_port = 80
    to_port = 80
    protocol = "TCP"
    security_groups = [aws_security_group.LB-Ruby.id]
  }

  ingress {
    description = "Allow 3000 Load Balancer"
    from_port = 3000
    to_port = 3000
    protocol = "TCP"
    security_groups = [aws_security_group.LB-Ruby.id]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "EC2-Ruby"
  }

  depends_on = [
    aws_security_group.LB-Ruby
  ]
}

resource "aws_security_group" "LB-Ruby" {
  name = "LB-Ruby"
  description = "LB Ruby"
  vpc_id = data.aws_vpc.default.id

  ingress {
    description = "Allow HTTP Load Balancer"
    from_port = 80
    to_port = 80
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow 3000 Load Balancer"
    from_port = 3000
    to_port = 3000
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "LB-Ruby"
  }
}