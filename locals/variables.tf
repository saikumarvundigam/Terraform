
variable "ec2_tags" {
  default = {
    Name="fucntions-demo"
    Environment="prod"
      }
}

variable "sg_tags" {
  default = {
    Name="fucntions-demo"
      }
}




variable "name" {
  type = string
  default = "locals"
}

variable "environment" {
  type = string
  default = "DEV"
}

  # We should not call the one variable into another as mentioned below. We need to call the variables in locals.tf
  # default = "${var.name}-${var.environment}"