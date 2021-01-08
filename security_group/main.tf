module "security_group" {
  #source = "../.terraform/modules/security_group"
  source = "terraform-aws-modules/security-group/aws"

  name        = var.name
  description = "Security group for http,https with http,https ports open within VPC"
  vpc_id      = data.aws_vpc.vpc.id

  use_name_prefix = false

  ingress_with_cidr_blocks = [
    {
      rule        = var.ingress_rules_http
      cidr_blocks = var.ingress_cidr_blocks
      description = var.ingress_description_http
    },
    {
      rule        = var.ingress_rules_https
      cidr_blocks = var.ingress_cidr_blocks
      description = var.ingress_description_http
    },
#    {
#      from_port   = var.ingress_from_port_api
#      to_port     = var.ingress_to_port_api
#      protocol    = var.ingress_protocol_api
#      cidr_blocks = var.ingress_cidr_blocks_api
#      description = var.ingress_description_custom_api
#    },
  ]
  
  egress_rules = ["all-all"]

  tags = {
    Name  = "sg-https"
    Environment = "Product"
    AllowSSH = "false"    
    TerraformManaged = "true"
  }
}


module "security_group_bastion" {
  #source = "../.terraform/modules/security_group"
  source = "terraform-aws-modules/security-group/aws"

  name        = var.name_bastion
  description = "Security group for ssh with SSH ports open within VPC"
  vpc_id      = data.aws_vpc.vpc.id

  use_name_prefix = false

  ingress_with_cidr_blocks = [
    {
      rule        = var.ingress_rules_ssh
      cidr_blocks = var.ingress_cidr_blocks_bastion
      description = var.ingress_description_ssh
    },
#    {
#      from_port   = var.ingress_from_port_api
#      to_port     = var.ingress_to_port_api
#      protocol    = var.ingress_protocol_api
#      cidr_blocks = var.ingress_cidr_blocks_api
#      description = var.ingress_description_custom_api
#    },
  ]
  
  egress_rules = ["all-all"]

  tags = {
    Name  = "sg-ssh"
    Environment = "Product"
    AllowSSH = "true"    
    TerraformManaged = "true"
  }
}