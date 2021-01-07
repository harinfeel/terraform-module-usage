### AWS VPC
data "aws_vpc" "vpc" {
  tags = {
    TerraformManaged = "true"
  }
}

### Amazon Linux AMI
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name = "name"
    values = [
      "amzn-ami-hvm-*-x86_64-gp2",
    ]
  }

  filter {
    name = "owner-alias"
    values = [
      "amazon",
    ]
  }
}

data "aws_ami" "ubuntu_latest" {
    most_recent = true
    owners = ["099720109477"]

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }    
}

data "aws_ami" "windows_2016" {
    most_recent = true
    owners = ["099720109477"]

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }    
}

data "aws_security_groups" "security_group_linux" {
  tags = {
    Name = "SecurityGroupLinux"
    Environment = "Product"
  }
}

data "aws_security_groups" "security_group" {
  tags = {
    Name = "SecurityGroupWindows"
    Environment = "Product"
  }
}



