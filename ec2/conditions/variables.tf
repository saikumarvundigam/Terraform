variable "Environment" {
    default = "PROD"
}

variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
    description = "RHEL_AMI"
}

variable "instance_type" {
    type = string
  default = "t3.micro"
  description = "instance_type"
}

variable "Tags" {
    type = map
    default = {
    Name = "Terraform_Instance"
    Project = "Roboshop"
    Terraform = "True"
    Environment = "DEV"
  }
}

variable "EC2_SG" {
default = "allow-all-terraform"
type = string
}

variable "SG_Description" {
    type = string
    default = "Allow TLS inbound traffic and all outbound traffic"
}

variable "sg_fromport" {
    type = number
    default = 0
}

variable "sg_toport" {
    type = number
  default = 0
}

variable "ec2_cidr" {
    type = list
    default = ["0.0.0.0/0"]
  
}

variable "sg_tags" {
  type = map
  default = {
    name = "allow-all-terraform"
    Project = "Roboshop"
    Terraform = "True"
    Environment = "DEV"
  }
}