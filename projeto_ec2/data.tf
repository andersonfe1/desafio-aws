data "aws_vpc" "default" {
    filter {
      name = "tag:Name"
      values = ["default"]
    }
}

data "aws_subnet" "subnet1" {
  filter {
    name = "tag:Name"
    values = ["subnet1"]
  }
}

data "aws_subnet" "subnet2" {
  filter {
    name = "tag:Name"
    values = ["subnet2"]
  }
}