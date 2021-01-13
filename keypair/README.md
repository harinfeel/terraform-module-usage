# Terraform Keypair Module
본 문서는 Terraform Module을 활용한 AWS Keypair 구성 문서입니다.  
보유중인 Publickey를 기반으로 keypair를 등록해야 합니다.  
keypair가 없다면 AWS의 공식문서에서 SSH키를 생성하는 방법을 참고하세요.  

### Configuration
keypair.tfvars에 keypair의 이름과 public_key를 등록합니다.

```conf
# Your existing public key setting id_rsa.pub
key_name = "gitlab-keypair-external"

# 보유한 퍼블릭 키를 입력합니다.
public_key = "ssh-rsa bulabulabulabula"
```

### 사용법
```bash
cd keypair
terraform init

# 존재하는 퍼블릭키로 키페어 생성
terraform plan -var-file=keypair.tfvars
terraform apply -var-file=keypair.tfvars
```