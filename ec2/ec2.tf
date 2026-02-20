resource "aws_instance" "Terraform_Instance" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  subnet_id     = "subnet-092ecd6324448c696"
#   vpc_security_group_ids = [aws_security_group.allow_tls.id]
  vpc_security_group_ids = aws_security_group.existing_sg.id
  tags = {
    Name = "Terraform_Instance"
    Project = "Roboshop"
  }
}

data "aws_vpc" "existing" {
  id = "vpc-0dec96dacd0d1cb26"
}

data "aws_security_group" "existing_sg" {
  id = "sg-095e187a502d135e1"
}


# resource "aws_security_group" "allow_tls" {
#   name        = "allow_all_terraform" 
#   description = "Allow TLS inbound traffic and all outbound traffic"
#   vpc_id      = "vpc-0dec96dacd0d1cb26"

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }

#   ingress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }

#   tags = {
#     Name = "allow_tls"
#   }
# }

