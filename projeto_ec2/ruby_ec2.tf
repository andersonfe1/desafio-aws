resource "aws_instance" "Ruby" {
    ami = var.ami_ec2_ruby
    instance_type = "t2.micro"
    disable_api_termination = false     # Colocar true para habilitar o protection termination
    key_name = "Ruby"
    security_groups = [
      aws_security_group.EC2-Ruby.id
    ]
    subnet_id = data.aws_subnet.subnet1.id

    user_data_base64 = base64encode(templatefile("userdata.tpl", {}))

    tags = {
      Name = "Ruby"
    }

    depends_on = [
      aws_key_pair.Ruby,
      aws_security_group.EC2-Ruby
    ]
}