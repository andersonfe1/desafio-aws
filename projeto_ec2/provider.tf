terraform {
  required_providers {
      aws = {
          source = "hashicorp/aws"      # Adicionando o módulo AWS
          version = "~> 3.0"
      }

      tls = {
          source = "hashicorp/tls"      # Adicionando o módulo TLS
      }

      docker = {
          source = "kreuzwerker/docker"    # Adicionando o módulo Docker 
          version = "2.23.0"
      }
  }
}

provider "aws" {
    region = var.aws_region             # Configurando região default

    default_tags {
      tags = var.default_tags           # Configurando tags default
    }
}

provider "docker" {
    host = "unix:///var/run/docker.sock"  
    # Configuration options
}