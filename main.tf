# First we have to define a provider
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
  region = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

# Create a VPC
resource "aws_vpc" "my-first-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "HelloWorld"
  }
}

# Create a subnet
resource "aws_subnet" "my-first-subnet" {
  vpc_id     = aws_vpc.my-first-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_instance" "my-first-server" {
  ami           = "ami-020cba7c55df1f615"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}

variable "aws_access_key" {}
variable "aws_secret_key" {}

