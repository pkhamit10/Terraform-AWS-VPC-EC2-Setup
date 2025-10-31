data "aws_ami" "selected" {
  most_recent = true
  filter {
    name   = "name"
    values = [var.ami_filters.name]
  }
  owners = var.ami_filters.owners
}


resource "aws_instance" "this" {
  ami                    = data.aws_ami.selected.id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  key_name               = var.key_name != "" ? var.key_name : null
  vpc_security_group_ids = var.security_group_ids


  tags = merge({ Name = var.name }, var.tags)
}
