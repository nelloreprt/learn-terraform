terraform {
  backend "s3" {
    bucket         = "terraform-b71"
    key            = " 05-s3-state/terraform.tfstate "   #"some_environment/terraform.tfstate"  # name of the file
    region         = "us-east-1"
  }
}

resource "aws_instance" "ec2" {
  ami = "ami-0a017d8ceb274537d"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-03102337d5efe15a4"]
  tags = {
    Name = "test"
  }

}