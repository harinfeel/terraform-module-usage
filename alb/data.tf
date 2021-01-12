## Random func
resource "random_pet" "this" {
  length = 2
}

## VPC
data "aws_vpc" "seleted" {
  tags = {
    TerraformManaged = "true"
    Gitlab           = "true"
  }
}

## DNS name
data "aws_route53_zone" "this" {
  name = var.domain_name
}

## Subnet Group public ids
data "aws_subnet_ids" "public" {
  vpc_id = data.aws_vpc.seleted.id

  tags = {
    Name = "*public*"
  }
}

## Subnet Group private ids
data "aws_subnet_ids" "private" {
  vpc_id = data.aws_vpc.seleted.id

  tags = {
    Name = "*private*"
  }
}

## Security Group for ssh
data "aws_security_group" "sg-ssh" {
  tags = {
    TerraformManaged = "true"
    Name             = "sg-ssh"
  }
}

## Security group for https
data "aws_security_group" "sg-https" {
  tags = {
    TerraformManaged = "true"
    Name             = "sg-https"
  }
}

## ACM 
data "aws_acm_certificate" "selected" {
  domain = var.domain_name
}

# Find a 