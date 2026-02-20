variable "instances" {
    type = list
    default = ["mongodb", "redis", "mysql", "rabbitmq", "cart", "catalogue", "user", "shipping", "payment", "frontend"]
}

variable "Hosted_Zone_ID" {
  default = "Z0095171DCHOSBNY5RZZ"
}

variable "Domain" {
    default = "cloudmine.co.in"
  
}