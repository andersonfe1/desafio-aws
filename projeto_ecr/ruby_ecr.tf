provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}

resource "aws_ecrpublic_repository" "ruby" {

  repository_name = "ruby"

  catalog_data {
    about_text        = "ECR Ruby"
    architectures     = ["ARM", "ARM 64"]
    description       = "ECR da imagem Ruby Hello World"
    operating_systems = ["Linux"]
    usage_text        = "Teste de Ruby"
  }
}