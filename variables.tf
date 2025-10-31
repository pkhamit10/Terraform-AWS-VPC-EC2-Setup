variable "aws_region" {
  type    = string
  default = "us-east-1"
}


variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}


variable "az_count" {
  type    = number
  default = 2
}


variable "public_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}


variable "private_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.101.0/24", "10.0.102.0/24"]
}


variable "ssh_allowed_cidr" {
  type    = string
  default = "0.0.0.0/0"
}


variable "instance_type" {
  type    = string
  default = "t3.micro"
}


variable "key_name" {
  type        = string
  description = "Existing EC2 key pair name to use (create in AWS or import)"
  default     = ""
}