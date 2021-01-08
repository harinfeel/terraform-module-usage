### Terraform Module 
Terraform 모듈 사용시 git이나 gitlab의 저장소에서 다운받아 사용하게 구성 되어있다.
Terraform 모듈중 Security Group을  반복해서 사용해야 하는 경우를 가정한다. 이 경우에 같은 SecurityGroup의 모듈을 사용하지만 모듈 이름을 name1, name2라고 지정해야한다. 이러한 경우 해당 이름별로 git저장소에서 다운로드를 받아 name1, name2의 디렉토리별로 저장하여 중복된 소스를 저장하게 된다.

### Terraform Provider Cache 설정
Terraform을 이용하여 인프라를 구성할 때 terraform init 명령어를 사용하게되고 provider를 매번 다운받아야 한다. 매번 다운받는 수고로움을 cache설정으로 덜어낼 수 있다.  

다음과 같이 진행한다.
```bash
rm -f ~/.terraformrc
touch ~/.terraformrc
echo -e "plugin_cache_dir = \"$HOME/.terraform.d/plugins\"" > ~/.terraformrc
mkdir -pv ~/.terraform.d/plugins/
```
세팅이 끝나면 필요한 provider는 `$HOME/.terraform.d/plugins` 디렉토리 하위에 생성이 되고 소스가 있는 디렉토리에는 링크파일이 생성된다.

```bash
harin@DESKTOP-0HHEF4L:/mnt/h/Source/mzc/git_awx$ tree ~/.terraform.d/plugins/
/home/harin/.terraform.d/plugins/

0 directories, 0 files

harin@DESKTOP-0HHEF4L:/mnt/h/Source/mzc/git_awx$ ll
total 4
-rwxrwxrwx 1 harin harin    0 Jan  8 10:59 README.md*
drwxrwxrwx 1 harin harin  512 Jan  7 15:40 alb/
drwxrwxrwx 1 harin harin  512 Jan  6 11:24 ec2/
-rwxrwxrwx 1 harin harin 2369 Nov 13 14:45 outputs.tf*
-rwxrwxrwx 1 harin harin  155 Nov 13 14:45 provider.tf*
drwxrwxrwx 1 harin harin  512 Jan  7 17:45 security_group/
drwxrwxrwx 1 harin harin  512 Jan  7 16:38 vpc/
harin@DESKTOP-0HHEF4L:/mnt/h/Source/mzc/git_awx$ tf init

Initializing the backend...

Initializing provider plugins...
- Finding latest version of hashicorp/aws...
.
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
total 0
drwxrwxrwx 1 harin harin 512 Jan  8 13:11 .
drwxrwxrwx 1 harin harin 512 Jan  8 13:11 ..
lrwxrwxrwx 1 harin harin  87 Jan  8 13:11 linux_amd64 -> /home/harin/.terraform.d/plugins/registry.terraform.io/hashicorp/aws/3.23.0/linux_amd64
```



## 구성

```
├── provider.tf*
├── README.md
├── alb
│   ├── alb.tf
│   ├── data.tf
│   ├── main.tf
│   └── variables.tf
├── ec2
│   ├── data.tf
│   ├── main.tf
│   ├── provider.tf -> ../provider.tf
│   └── variables.tf
├── outputs.tf
├── provider.tf
├── security_group
│   ├── data.tf
│   ├── main.tf
│   ├── outputs.tf
│   ├── provider.tf -> ../provider.tf
│   ├── sg.tfvars
│   └── variables.tf
└── vpc
    ├── main.tf
    ├── outputs.tf
    ├── provider.tf -> ../provider.tf
    ├── variables.tf
    └── vpc.tfvars
```