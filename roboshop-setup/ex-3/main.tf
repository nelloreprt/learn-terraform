resource "aws_instance" "instances" {
  for_each                  = var.instances
  ami                    = "ami-0a017d8ceb274537d"
  instance_type          = each.value["type"]
  vpc_security_group_ids = ["sg-03102337d5efe15a4"]

  tags = {
    name = each.value["name"]
  }

}

variable "instances" {
  default = {
    catalogue = {             # key
      name = "catalogue"      # value
      type = "t3.micro"       # value
    }

    cart = {                  # key
      name = "cart"           # value
      type = "t3.small"       # value
    }

  }

}