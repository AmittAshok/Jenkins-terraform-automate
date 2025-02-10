terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "server" {
    instance_type = "t2.micro"
    ami = "ami-00bb6a80f01f03502"
    associate_public_ip_address = true
    key_name = "new-mumbai-account"
    tags = {
      Name = "WebServer1"
    }
  
}

output "IpAddress" {
    description = "This is Ip address of instance"
    value = aws_instance.server.public_ip
  
}