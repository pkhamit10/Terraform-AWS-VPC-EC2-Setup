terraform {
  required_version = ">= 1.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}


provider "aws" {
  region = var.aws_region
}


data "aws_availability_zones" "available" {}


module "vpc" {
  source               = "./modules/vpc"
  name                 = "pk-vpc"
  cidr_block           = var.vpc_cidr
  azs                  = slice(data.aws_availability_zones.available.names, 0, var.az_count)
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}


module "sg" {
  source = "./modules/security-group"
  name   = "pk-sg"
  vpc_id = module.vpc.vpc_id


  ingress = [
    {
      description = "SSH"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = [var.ssh_allowed_cidr]
    }
  ]


  egress = [
    {
      description = "All Out"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}


module "ec2" {
  source = "./modules/ec2"


  name               = "pk-ec2"
  subnet_id          = module.vpc.public_subnet_ids[0]
  ami_filters        = { name = "amzn2-ami-hvm-*-x86_64-gp2", owners = ["amazon"] }
  instance_type      = var.instance_type
  key_name           = var.key_name
  security_group_ids = [module.sg.security_group_id]
}