# Terraform Module Github
# https://github.com/terraform-aws-modules/key-pair/aws"
module "key_pair_external" {
  #source = "../.terraform/modules/key_pair"
  source = "terraform-aws-modules/key-pair/aws"

  key_name   = var.key_name
  public_key = var.public_key

  tags = {
    TerraformManaged = "true"
    External = "true"
  }
}