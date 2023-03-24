variable "sample" {
  default = "hello World"
}

output "sample" {
  value = var.sample
}
///////////////////////////////////////////////////////////////

# variable_name = value of variable >> is declared in terraform.tfvars file

variable "sample1" {}

output "sample1" {
  value = var.sample1
}
///////////////////////////////////////////////////////////////////////
# variable_name = value of variable >> is declared in CLI
variable "cli" {}

output "cli" {
  value = var.cli
}
# >> $ terraform apply -auto-approve -var cli="hello from cli"
////////////////////////////////////////////////////////////////////////////


# rearly used option
# variables input from shell environment

# >> $ export TF_VAR_cli="hello from shell envirment variable"
note >> TF_VAR is compulsory syntax

//////////////////////////////////////////////////////////////////
# variable types >> Default, List , Map

#   variable types >> Default
variable "sample5" {
        default = "hello world"
}

# variable types >> List
variable "sample6" {
  default = [
        "hello world",
        true,
        100,
        "usa"
]
}

# variable types >> Map
variable "sample7" {
  default = {
    string = "hello world",
    boolean = true ,
    number = 100 ,
    country = "usa"
}
}

#COMBINATION OF OTHER STRINGS >> " "   +  ${VARIABLE_NAME}
# "variable sample5 is - ${var.sample5}"
output "variable_types" {
        value = "variable sample5 is - ${var.sample5} ,
        first value in List is - ${var.sample6[0]},
        boolean value of Map is  - ${var.sample7["boolean"]}"
}

//////////////////////////////////////////////////////////////
# list variable
# When you use COUNT, all the attributes (output) will come as a list
# when you use count loop, terraform will convert into LIST of resources as below
variable "d1" {
    default =
    [

    {
    subject = "aws"
    trainer = "jeff"
    },

    {
    subject = "devops"
    trainer = "raghu"
    },

    {
    subject = "terraform"
    trainer = "shiva"
    },

]
}

# to get list of all subject
output "d1" {
        value = var.d1.*.subject
}

# to get list of first subject in the list, which is INDEX no.1
output "d1" {
value = var.d1.[0].subject
}

//////////////////////////////////////////////////////////////////////







