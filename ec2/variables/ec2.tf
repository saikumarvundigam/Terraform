resource "aws_instance" "Terraform_Instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = "subnet-092ecd6324448c696"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  tags = var.Tags
}

resource "aws_security_group" "allow_tls" {
  name        = var.EC2_SG
  description = var.SG_Description
  vpc_id      = "vpc-0dec96dacd0d1cb26"

  egress {
    from_port        = var.sg_fromport
    to_port          = var.sg_toport
    protocol         = "-1"
    cidr_blocks      = var.ec2_cidr
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = var.sg_fromport
    to_port          = var.sg_toport
    protocol         = "-1"
    cidr_blocks      = var.ec2_cidr
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = var.sg_tags
}

