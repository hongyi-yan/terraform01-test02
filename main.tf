provider "aws" {
  region = "us-east-1"
}

variable "cidr_block" {
  description = "cidr blocks and name tags for vpc and subnets"
  type = list(object({
    cidr_block = string 
    name = string
  }))
}

variable "env" {
  description = "environment"
}

resource "aws_vpc" "devops-vpc" {
  cidr_block = var.cidr_block[0].cidr_block

  tags = {
    Name = var.cidr_block[0].name
    vpc_env: var.env
  }
}

resource "aws_subnet" "devops-subnet-1" {
  vpc_id     = aws_vpc.devops-vpc.id
  cidr_block = var.cidr_block[1].cidr_block
  availability_zone = "us-east-1a"
  tags = {
    Name = var.cidr_block[1].name
  }
}

resource "aws_subnet" "devops-subnet-2" {
  vpc_id     = aws_vpc.devops-vpc.id
  cidr_block = var.cidr_block[2].cidr_block
  availability_zone = "us-east-1b"
  tags = {
    Name = var.cidr_block[2].name
  }
}

resource "aws_subnet" "devops-subnet-3" {
  vpc_id     = aws_vpc.devops-vpc.id
  cidr_block = var.cidr_block[3].cidr_block
  availability_zone = "us-east-1a"
  tags = {
    Name = var.cidr_block[3].name
  }
}

resource "aws_subnet" "devops-subnet-4" {
  vpc_id     = aws_vpc.devops-vpc.id
  cidr_block = var.cidr_block[4].cidr_block
  availability_zone = "us-east-1b"
  tags = {
    Name = var.cidr_block[4].name
  }
}

output "devops-vpc-id" {
  value = aws_vpc.devops-vpc.id
}

output "devops-subnet-id" {
  value = aws_subnet.devops-subnet-1.id
}