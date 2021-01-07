###### VPC Variables
azs = ["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c", "ap-northeast-2d"]

vpc_name = "Gitlab-ee-mzc"
cidr     = "10.30.0.0/16"

public_subnets   = ["10.30.10.0/24", "10.30.11.0/24"]
private_subnets  = ["10.30.20.0/24", "10.30.21.0/24"]
database_subnets = ["10.30.30.0/24", "10.30.31.0/24"]

enable_dns_hostnames   = true
enable_dns_support     = true
enable_nat_gateway     = false
enable_vpn_gateway     = false
single_nat_gateway     = true
one_nat_gateway_per_az = false

create_database_subnet_group           = true
create_database_subnet_route_table     = true
create_database_internet_gateway_route = true