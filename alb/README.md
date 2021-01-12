# Terraform VPC Module
본 문서는 Terraform Module을 활용한 AWS ALB 구성 문서입니다.

### Configuration
alb.tfvars에 선언된 변수대로 VPC가 생성됩니다. 해당 파일만 수정하여 vpc를 수정하도록 합니다. 가능한 하나의 파일만 수정하길 권장합니다. ALB를 등록하기전 반드시 ACM을 등록하셔야 합니다. domain_name에는 등록된 hostedzone의 domain을 입력하게 되고 해당 DNS에 등록되어있는 ACM을 찾아서 ALB에 등록하게 됩니다.

```conf
###### VPC Variables
## DNS Name
domain_name        = "cloudev.cf" # 등록할 1차 도메인
lb_name            = "alb-gitlab-public" # ELB 네임
load_balancer_type = "application" # ELB 타입
internal = false # 인터넷연결, 내부연결


## Target Groups
name_prefix      = "tg-443" # Target Group 네임 - 6글자가 넘어가면 실패
backend_protocol = "HTTP" # 백엔드로 넘겨줄 프로토콜
backend_port     = 80 # 백엔드로 넘겨줄 포트 넘버
target_type      = "instance" # Target 타입

## Target Group health check
interval            = 30  
path                = "/" 
port                = "80" 
healthy_threshold   = "5"  
unhealthy_threshold = "2"
timeout             = "5"
protocol            = "HTTP"
matcher             = "200"

```

### 사용법
```bash
cd alb
terraform init
terraform plan -var-file=alb.tfvars
terraform apply -var-file=alb.tfvars
```