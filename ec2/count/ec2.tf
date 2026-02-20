resource "aws_instance" "Terraform_Instance" {

  count = 10
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  subnet_id     = "subnet-092ecd6324448c696"

  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  tags = {
    Name = var.instances[count.index]
    Project = "Roboshop"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_all_roboshop" 
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = "vpc-0dec96dacd0d1cb26"

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}
