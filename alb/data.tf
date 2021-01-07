## VPC
data "aws_vpc" "vpc" {
  tags = {
    TerraformManaged = "true"
    Gitlab = "true"
  }
}

## Security Group for ssh
data "aws_security_group" "sg-ssh" {
  tags = {
    TerraformManaged = "true"
    Name = "sg-ssh"
  }
}

## Security group for https
data "aws_security_group" "sg-https" {
  tags = {
    TerraformManaged = "true"
    Name = "sg-https"
  }
}