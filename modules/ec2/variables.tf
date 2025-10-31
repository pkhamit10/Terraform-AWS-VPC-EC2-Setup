variable "name" { type = string }
variable "subnet_id" { type = string }
variable "ami_filters" {
  type = object({
    name   = string
    owners = list(string)
  })
}
variable "instance_type" {
  type    = string
  default = "t3.micro"
}
variable "key_name" {
  type    = string
  default = ""
}
variable "security_group_ids" {
  type    = list(string)
  default = []
}
variable "tags" {
  type    = map(string)
  default = {}
}