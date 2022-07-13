terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "my-organizations"

    workspaces {
      name = "my-vcs-example"
    }
  }
}

provider "aws" {
    region = "us-east-1"
    alias = "us-east-1"
}

resource "aws_instance" "my_instance" {
    instancetype = "t2.micro"
    ami = "ami-0cff7528ff583bf9a"
    provider = aws.us-east-1
}

output "instance_public_ip" {
  value = aws_instance.my_instance.public_ip
}
