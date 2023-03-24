# terraform_Conditions >> in terraform conditions is all about PICKING a particular value
# condition can be used for any key

resource "aws_instance" "test" {
  ami = "ami-0a017d8ceb274537d"
  instance_type = var.instance_type == "" ? "t2.micro" : var.instance_type

}

variable "instance_type" {}
# variable is empty, so value of variable will be given as an input during terraform apply
////////////////////////////////////////////////////

resource "aws_instance" "test" {
  count = var.create_instance == "true" ? 1 : 0
  ami = "ami-0a017d8ceb274537d"
  instance_type = var.instance_type == "" ? "t2.micro" : var.instance_type

}

variable "create_instance" {}

variable "instance_type" {}
# variable is empty, so value of variable will be given as an input during terraform apply
////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////
# if input to a condition comes " as a string " FOR A BOOLEAN
>> use string to boolean terraform function>> tobool

# for boolean condition can be as follows >> var.create_instance ? 1 : 0
tobool(var.create_instance) ? 1 : 0


resource "aws_instance" "test" {
  count = tobool(var.create_instance) ? 1 : 0
  ami = "ami-0a017d8ceb274537d"
  instance_type = var.instance_type == "" ? "t2.micro" : var.instance_type

}

variable "create_instance" {}

variable "instance_type" {}
# variable is empty,
# so value of variable will be given
as " a string " FOR A BOOLEAN as " true or false " an input during terraform apply
