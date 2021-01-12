# Terraform Module Github
# https://github.com/terraform-aws-modules/terraform-aws-acm

## Create ACM
module "acm" {
  source = "../.terraform/modules/acm"
  #source  = "terraform-aws-modules/acm/aws"
  #  version = "~> v2.0"

  domain_name = var.zone_name
  zone_id     = data.aws_route53_zone.selected.zone_id

  subject_alternative_names = [
    "*.${data.aws_route53_zone.selected.name}",
    data.aws_route53_zone.selected.name,
  ]

  tags = {
    Name             = var.zone_name
    TerraformManaged = "true"
  }
}
