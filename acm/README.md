# Terraform ACM Module
본 문서는 Terraform Module을 활용한 AWS ACM 구성 문서입니다.

**`중요`**
ACM을 등록 할 때 Private, Public의 종류 관계없이 반드시 Route53 Hostedzone이 사전에 등록되어 있어야 합니다. 

### Configuration
acm.tfvars에 선언된 변수대로 VPC가 생성됩니다. 해당 파일만 수정하여 ACM을 생성하도록 합니다. 가능한 하나의 파일만 수정하길 권장합니다.

```
# DNS Hostzone name
zone_name = "cloudev.cf" # ACM을 등록할 Hosted zone 이름

# Check private zone 
private_zone = false # Publci, Private을 구분
```

