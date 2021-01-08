# Terraform VPC Module
본 문서는 Terraform Module을 활용한 AWS VPC 구성 문서입니다.

### Configuration
vpc.tfvars에 선언된 변수대로 VPC가 생성됩니다. 해당 파일만 수정하여 vpc를 수정하도록 합니다. 가능한 하나의 파일만 수정하길 권장합니다.

```conf
###### VPC Variables

# Availability Zones 생성. 최소 2개이상을 작성.
azs = ["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c", "ap-northeast-2d"] 

vpc_name = "Gitlab-ee-mzc" # 생성할 VPC 이름
cidr     = "10.30.0.0/16"  # VPC CIDR Block

public_subnets   = ["10.30.10.0/24", "10.30.11.0/24"] # 퍼블릭 서브넷 CIDR (2개 작성시 2개의 AZ활용)
private_subnets  = ["10.30.20.0/24", "10.30.21.0/24"] # 프라이빗 서브넷 CIDR
database_subnets = ["10.30.30.0/24", "10.30.31.0/24"] # Database 서브넷

enable_dns_hostnames   = true  # Public DNS Enable
enable_dns_support     = true  # DNS 확인 활성화
enable_nat_gateway     = false # NAT Gateway 구성 
enable_vpn_gateway     = false # VPN Gateway 구성
single_nat_gateway     = true # 하나의 NAT Gateway 를 구성할 것인지 확인
one_nat_gateway_per_az = false # 하나의 NAT Gateway 구성시 생성될 Availability Zone

create_database_subnet_group           = true # DB Subnet Group 생성
create_database_subnet_route_table     = true # DB Subnet Route Table 생성
create_database_internet_gateway_route = true # DB Internet Gateway Route 생성
```

### 사용법
```bash
cd vpc
terraform init
terraform plan -var-file=vpc.tfvars
terraform apply -var-file=vpc.tfvars
```