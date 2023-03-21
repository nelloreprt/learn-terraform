data "aws_ami" "example" {

  most_recent      = true
  name_regex       = "Centos-8-Devops-Practice"
  owners           = ["589381508895"]

}

output "ami_id" {
  value = data.aws_ami.example.image_id
}