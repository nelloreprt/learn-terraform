////////////////////////////////////
# DEFAULT variable types (input from variables)

variable "d1" {
  default = 5
}

resource "null_resource" "nothing" {
  count = var.d1
}

////////////////////////////////////
# List values (input from variables)
COUNT LOOP

variable "d2" {
  default = ["apple", "banana"]
}

resource "null_resource" "nothing" {
  count = length(var.d2)
}

/////////////////////////////////////////
# Map values (input from variables)
# here count loop will not work,
# >>>>>>> for_each will be used here
scenario >> suppose for every component, different AMI_ID, different INSTANCE_TYPE is needed, then below approach is used
variable "d3" {
  default =
    apple = {
        name = "apple"
        count = 5
        }

    banana = {
        name = "banana"
        count = 3
         }

}

resource "null_resource" "nothing" {
  for_each = var.d3
}