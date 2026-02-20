resource "aws_route53_record" "cloudmine" {
    count = 10
  zone_id = var.Hosted_Zone_ID
  name    = "${var.instances[count.index]}.${var.Domain}" #mongodb.cloudmine.co.in
  type    = "A"
  ttl     = 1
  records = [aws_instance.Terraform_Instance[count.index].private_ip]
}