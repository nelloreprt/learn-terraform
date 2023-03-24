module "ec2" {
  source = " ./ec2"
  for_each = var.instances
  component = each.value["name"]
  instance_type = each.value["type"]
}

# VARIABLE IS DECLARED
# variable_name >> component  , value of variable >> each.value["name"]
# in general call the declared variable using "variable_name" >> ${component}

step-1
# but in terraform call the declared variable using ${var.component} in resource_block

step-2
# and immediately under resource_block >> variable "component" {}
//////////////////////////////////////////////////////////////////////////////////////////


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