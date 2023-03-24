# count loop >> simple count
resource "aws_instance" "frontend" {
  count                  = 3
  ami                    = "ami-0a017d8ceb274537d"
  instance_type          = "t3.micro"
  vpc_security_group_ids = ["sg-03102337d5efe15a4"]

}
////////////////////////////////////////////////////////////////////////////////
# count loop >> with input from variables >> LENGTH Function is used
resource "aws_instance" "frontend" {
  count                  = length(var.instances)
  ami                    = "ami-0a017d8ceb274537d"
  instance_type          = "t3.micro"
  vpc_security_group_ids = ["sg-03102337d5efe15a4"]

}

variable "instances" {
  default = [
    "frontend",
    "cart",
    "catalogue"
  ]
}

#since the output of above code will have index number like this >> [0]

output "instances" {
  value = aws_instance.frontend.*.public_ip
}
# * >> indicates ALL
////////////////////////////////////////////////////////////////////////////

# count loop will give index no, to access the index number
# >>>> var.instances[count.index]
first iteration will be 0 >> index is 0
2nd iteration will be 1 >> index is 1
3rd iteration will be 2 >> index is 2


resource "aws_instance" "frontend" {
  count                  = length(var.instances)
  ami                    = "ami-0a017d8ceb274537d"
  instance_type          = "t3.micro"
  vpc_security_group_ids = ["sg-03102337d5efe15a4"]

  tags = {
    name = var.instances[count.index]
  }

}

variable "instances" {
  default = [
    "frontend",
    "cart",
    "catalogue"
  ]
}





