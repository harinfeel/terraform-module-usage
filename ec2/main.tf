
#module "ec2_windows" {
#  source = "terraform-aws-modules/ec2-instance/aws"

#  name                   = var.ec2_instance_name_linux
#  ami                    = data.aws_ami.ubuntu_latest.id
#  instance_count         = var.instance_count_linux
#  instance_type          = var.instance_type_linux
#  key_name               = var.userkey_name
#  monitoring             = false
#  vpc_security_group_ids = [data.aws_security_group.security_group_linux.id]
#  subnet_ids             = data.aws_vpc.vpc.public_subnets

#  tags = {
#    Terraform   = "true"
#    Environment = "dev"
#  }
#}

module "ec2_private" {
  source  = "./.terraform/modules/ec2_public"
  version = "~> 2.0"

  name           = "ec2-priv-instance"
  instance_count = 1

  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t3.micro"
  key_name               = "harin-private-key"
  monitoring             = false
  vpc_security_group_ids = [module.security_group.this_security_group_id]
  subnet_ids             = module.vpc.private_subnets

  tags = {
    Terraform   = "true"
    Environment = "dev"
    ec2_private = "true"
    ec2_public = "false"
  }
}
