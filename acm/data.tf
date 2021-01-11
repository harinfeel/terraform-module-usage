## VPC
data "aws_route53_zone" "selected" {
  name         = var.zone_name
  private_zone = var.private_zone
}