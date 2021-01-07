# Configure the AWS Provider
provider "aws" {
  shared_credentials_file = "/home/harin/.aws/credentials"
  region                  = "ap-northeast-2"
}