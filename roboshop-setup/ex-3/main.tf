resource "aws_instance" "instances" {
  for_each                  = var.instances
  ami                    = "ami-0a017d8ceb274537d"
  instance_type          = each.value["type"]
  vpc_security_group_ids = ["sg-03102337d5efe15a4"]

  tags = {
    name = each.value["name"]
  }

}

# always give inputs as map of maps, so referencing back later will be easy
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

# when map of maps >> output shall also be looped
output "ec2" {
  value = [for k,v in aws_instance.instances : v.public_ip  ]
}

# when map of maps >> output shall also be looped
output "ec2" {
  value = [for k,v in aws_instance.instances : " ${k} - {v.public_ip} "  ]
}