variable "aws_region" {
  default = "us-east-1"  
}

variable "default_tags" {
  default  = {
      Provider = "Terraform",
      Description = "Build by terraform"
  }
}

#Amazon Linux 2
#variable "ami_ec2_ruby" {
#  default = "ami-089a545a9ed9893b6"
#}

#EC2 Ubuntu 20.04
variable "ami_ec2_ruby" {
  default = "ami-0149b2da6ceec4bb0" 
}