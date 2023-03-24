resource "aws_instance" "ec2" {
  ami = "ami-0a017d8ceb274537d"
  instance_type = var.instance_type
  vpc_security_group_ids = ["sg-03102337d5efe15a4"]
  tags = {
    Name = var.component
  }

}

resource "aws_route53_record" "record" {
  zone_id = "Z024480055QHLBAP2MTC"
  name    = "${var.component}-dev.nellore.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.ec2.private_ip]
}

variable "component" {}

variable "instance_type" {}