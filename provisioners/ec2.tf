resource "aws_instance" "Terraform_Instance" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  subnet_id     = "subnet-092ecd6324448c696"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
#   vpc_security_group_ids = aws_security_group.existing_sg.id

# self is the special variable
  provisioner "local-exec" {
    command = "echo ${self.public_ip} > inventory.ini"
  }
    provisioner "local-exec" {
    command = "exit 1"
    on_failure = continue
  }
      provisioner "local-exec" {
    command = "echo 'This is local-exec'"
  }
    provisioner "local-exec" {
    when    = destroy
    command = "echo 'When deletion of infra'"
  }

# Here is remote-exec. To make sure remote-exec works fine, please add connection block

connection {
  type = "ssh"
  user = "ec2-user"
  password = "DevOps321"
  host = self.public_ip
  }


provisioner "remote-exec" {
inline = [ 
  "sudo dnf install nginx -y",
  "sudo systemctl start nginx"
 ]
}

provisioner "remote-exec" {
inline = [ 
  "sudo systemctl stop nginx"
 ]
}

  tags = {
    Name = "provisioners-demo"
    Project = "Roboshop"
  }
}

data "aws_vpc" "existing" {
  id = "vpc-0dec96dacd0d1cb26"
}

# data "aws_security_group" "existing_sg" {
#   id = "sg-095e187a502d135e1"
# }


resource "aws_security_group" "allow_tls" {
  name        = "allow_all_terraform" 
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

