terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "my-organizations"

    workspaces {
      name = "my-vcs-example"
    }
  }
    required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

variable "ami" {

    type = string
    default = "ami-0cff7528ff583bf9a"
  
}

provider "aws" {
    region = "us-east-1"
    alias = "us-east-1"
}

resource "aws_instance" "my_instance" {
    instance_type = "t2.micro"
    ami = var.ami
    provider = aws.us-east-1
}

output "instance_public_ip" {
  value = aws_instance.my_instance.public_ip
}
