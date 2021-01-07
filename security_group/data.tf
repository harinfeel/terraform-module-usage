data "aws_vpc" "vpc" {
  tags = {
    TerraformManaged = "true"
  }
}
