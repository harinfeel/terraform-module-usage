# Terrafrom Module 사용하기
- 본 문서는 Terraform 모듈을 활용하여 반복 작업을 최대한 줄이기 위해 작성되었습니다.  
- 신규 고객에게 최초 AWS 인프라를 구성해 줄 때 (VPC, ALB, SecurityGroup 등) 본 문서에 사용된 모듈을 활용하여 손쉽게 구성할 수 있습니다.  
- CTC SA 누구나 해당 모듈 작업에 참여하실 수 있습니다.

## Module 작성 환경
Terraform 모듈 테스트는 Windows10 기반 WSL2-Ubuntu-20.04 에서 작업하였습니다.  

## 디렉토리 구성
vpc, security_group, alb, ec2 등으로 구성되어 있으며 계속 추가 될 예정입니다.
```
├── alb
├── ec2
├── security_group
└── vpc
```

## 사전 환경 구성
### Terraform Provider Cache 설정
Terraform을 사용하여 인프라를 구성할 때 terraform init 명령어를 사용하게 되고 provider를 매번 다운받아야 합니다. 매번 다운받는 수고로움을 cache설정으로 덜어낼 수 있습니다.  

다음과 같이 진행합니다.
```bash
rm -f ~/.terraformrc
touch ~/.terraformrc
echo -e "plugin_cache_dir = \"$HOME/.terraform.d/plugins\"" > ~/.terraformrc
mkdir -pv ~/.terraform.d/plugins/
```
세팅이 끝나면 필요한 provider는 `$HOME/.terraform.d/plugins` 디렉토리 하위에 생성이 되고 소스가 있는 디렉토리에는 링크파일이 생성됩니다.

```bash
harin@DESKTOP-0HHEF4L:/mnt/h/Source/mzc/git_awx$ tree ~/.terraform.d/plugins/
/home/harin/.terraform.d/plugins/

0 directories, 0 files

harin@DESKTOP-0HHEF4L:/mnt/h/Source/mzc/git_awx$ tf init

Initializing the backend...
Initializing provider plugins...
- Finding latest version of hashicorp/aws...
.

harin@DESKTOP-0HHEF4L:/mnt/h/Source/mzc/git_awx$ tree ~/.terraform.d/plugins/
/home/harin/.terraform.d/plugins/
└── registry.terraform.io
    └── hashicorp
        └── aws
            └── 3.23.0
                └── linux_amd64
                    └── terraform-provider-aws_v3.23.0_x5

harin@DESKTOP-0HHEF4L:/mnt/h/Source/mzc/git_awx$ ls -al .terraform/plugins/registry.terraform.io/hashicorp/aws/3.23.0/
lrwxrwxrwx 1 harin harin  87 Jan  8 13:11 linux_amd64 -> /home/harin/.terraform.d/plugins/registry.terraform.io/hashicorp/aws/3.23.0/linux_amd64
```
해당 작업을 완료하면 terraform init 세팅후 provider를 한번 받아놓은 후에는 저장된 디렉토리에 링크를 걸고 사용하게 됩니다.

### 사용법
모든 모듈을 디렉토리별로 구성해 두었습니다. AWS 인프라 구성시 VPC가 없으면 Security Group을 생성 할 수 없듯이 Terraform Module도 생성 순서가 있습니다. 추후 추가되는 모듈들은 본 문서에 업데이트 될 예정입니다.

1. VPC
2. IAM
3. SecurityGroup
4. ALB, NLB
5. EC2
6. RDS



### Tip
Terraform 모듈 사용시 git이나 gitlab의 저장소에서 다운받아 사용하게 구성되어 있습니다. Terraform 모듈중 SecurityGroup을 반복해서 사용해야 하는 경우를 가정합니다. 이 경우에 같은 SecurityGroup의 모듈을 사용하지만 모듈 이름을 name1, name2라고 지정해야 합니다. 이러한 경우 해당 이름별로 git저장소에서 다운로드를 받아 name1, name2의 디렉토리별로 저장하여 중복된 소스를 저장하게 됩니다.  

다음과 같이 모듈소스의 경로를 별도로 저장한 모듈 디렉토리로 지정하면 디렉토리별로 저장하지 않고 하나의 디렉토리만 참조하여 사용할 수 있습니다.
```diff
--- main.tf     2021-01-08 14:55:57.253152600 +0900
+++ main.tf.new 2021-01-08 14:57:17.542905500 +0900
@@ -1,6 +1,6 @@
 module "security_group" {
-  source = "terraform-aws-modules/security-group/aws"
+  source = "../.terraform/modules/security_group"

@@ -40,8 +40,8 @@
 module "security_group_bastion" {
-  source = "terraform-aws-modules/security-group/aws"
+  source = "../.terraform/modules/security_group"
```


