
# This is for map
    # variable "instances" {
    #     type = map
    #     default = {
    #         mongodb= "t3.micro"
    #         mysql="t3.small"
    #         user="t3.micro"
    #         shipping="t3.small"
    #     }      
    # }

    variable "instances" {
    type = list
    default = ["mongodb", "redis"]
}
  
    variable "Hosted_Zone_ID" {
    default = "Z0095171DCHOSBNY5RZZ"
}

    variable "Domain" {
    default = "cloudmine.co.in"
  
}