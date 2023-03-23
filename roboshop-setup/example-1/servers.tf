# ZONE_ID="Z024480055QHLBAP2MTC"
# goto Route-53 >> select Hosted Zone >> Hosted zone details >> Hosted zone ID

resource "aws_instance" "frontend" {
  ami = "ami-0a017d8ceb274537d"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-03102337d5efe15a4"]
  tags = {
    Name = "frontend"
  }

}

resource "aws_route53_record" "frontend" {
  zone_id = "Z024480055QHLBAP2MTC"
  name    = "frontend-dev.nellore.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}
# ////////////////////////////////////////////////////////
resource "aws_instance" "cart" {
  ami = "ami-0a017d8ceb274537d"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-03102337d5efe15a4"]
  tags = {
    Name = "cart"
  }

}

resource "aws_route53_record" "cart" {
  zone_id = "Z024480055QHLBAP2MTC"
  name    = "cart-dev.nellore.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.cart.private_ip]
}

#/////////////////////////////////////////////////

resource "aws_instance" "catalogue" {
  ami = "ami-0a017d8ceb274537d"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-03102337d5efe15a4"]
  tags = {
    Name = "catalogue"
  }

}

resource "aws_route53_record" "catalogue" {
  zone_id = "Z024480055QHLBAP2MTC"
  name    = "catalogue-dev.nellore.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.catalogue.private_ip]
}