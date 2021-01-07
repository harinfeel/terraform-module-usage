# Create VPC
module "vpc" {
  #source = "../.terraform/modules/vpc"
  source = "terraform-aws-modules/vpc/aws"
  name   = var.vpc_name
  cidr   = var.cidr
  azs    = var.azs

  public_subnets   = var.public_subnets
  private_subnets  = var.private_subnets
  database_subnets = var.database_subnets # Create Database Subnets Two

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_vpn_gateway     = var.enable_vpn_gateway
  enable_nat_gateway     = var.enable_nat_gateway
  single_nat_gateway     = var.single_nat_gateway
  one_nat_gateway_per_az = var.one_nat_gateway_per_az

  create_database_subnet_group           = var.create_database_subnet_group           #RDS용 서브넷 구성
  create_database_subnet_route_table     = var.create_database_subnet_route_table     #RDS용 서브넷의 라우팅 테이블 구성
  create_database_internet_gateway_route = var.create_database_internet_gateway_route #RDS용 라우팅 테이블에 인터넷 게이트웨이 연결 설정 여부

  vpc_tags = {
    Name = "gitlab-ee-mzc"
  }

  tags = {
    "TerraformManaged" = "true"
    "Ansible"          = "true"
    "Gitlab"           = "true"
  }
}