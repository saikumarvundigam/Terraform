resource "aws_route53_record" "cloudmine" {
for_each = aws_instance.Terraform_Instance
  zone_id = var.Hosted_Zone_ID
  #interpolation
  name    = "${each.key}.${var.Domain}" #mongodb.cloudmine.co.in
  type    = "A"
  ttl     = 1
  records = [each.value.private_ip]
  allow_overwrite = true
}

# Here is the example for map datatype  

resource "aws_route53_record" "cloudmine" {
  zone_id = var.Hosted_Zone_ID

  name    = "roboshop.${var.Domain}" #mongodb.cloudmine.co.in
  type    = "A"
  ttl     = 1
  //records = [aws_instance.Terraform_Instance[index(var.instances, "frontend")].public_ip]
  records = lookup(aws_instance.Terraform_Instance, "frontend").public_ip
  allow_overwrite = true
}