# Terraform security_group Module
본 문서는 Terraform Module을 활용한 AWS Security Group 구성 문서입니다.
본 모듈에서는 두개의 Security Group만 생성하게 되어있으나 variable.tf 를 수정하여 추가 Security Group을 생성할 수 있습니다.

### Configuration
sg.tfvars에 선언된 변수대로 SecurityGroup이 생성됩니다. 해당 파일만 수정하여 SecurityGroup를 수정하도록 합니다. 가능한 하나의 파일만 수정하길 권장합니다.

```conf
###### SecurityGroup Variables
name = "sg_alb_gitlab" # SecurityGroup 이름
name_bastion = "gitlab-bastion" # 두번째 SecurityGroup 이름

ingress_cidr_blocks = "0.0.0.0/0" # 인바운드 허용 아이피
ingress_cidr_blocks_bastion = "125.129.43.142/32,221.148.35.240/32" # Bastion 인바운드 허용 아이피
```

### 사용법
```bash
cd security_group
terraform init
terraform plan -var-file=sg.tfvars
terraform apply -var-file=sg.tfvars
```