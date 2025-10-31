variable "vpc_id" {
  type = string
  description = "VPC ID where the security group will be created"
}

variable "name" {
  type = string
}

variable "description" {
  type = string
  default = "Managed by Terraform"
}

variable "ingress" {
  type = list(object({
    description      = string
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = optional(list(string))
    ipv6_cidr_blocks = optional(list(string))
    security_groups  = optional(list(string))
  }))
  default = []
}

variable "egress" {
  type = list(object({
    description      = string
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = optional(list(string))
    ipv6_cidr_blocks = optional(list(string))
    security_groups  = optional(list(string))
  }))
  default = []
}

variable "tags" {
  type = map(string)
  default = {}
}
