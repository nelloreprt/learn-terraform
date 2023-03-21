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















