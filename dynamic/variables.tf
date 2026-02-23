variable "ingress_rules" {
default= [
    {
        port=22
        cidr_blocks=["0.0.0.0/0"]
        description="allowing port nyumber 22 frm internet"
    },
    {
        port=443
        cidr_blocks=["0.0.0.0/0"]
        description="allowing port nyumber 443 frm internet"
    },
    {
        port=3306
        cidr_blocks=["0.0.0.0/0"]
        description="allowing port nyumber 3306 frm internet"
    }
]  
}