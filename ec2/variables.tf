variable "ec2_instance_name_linux" {
  description = "Name to be used on all resources as prefix"
  type        = string
  default     = "Ubuntu-20.04-p3.2xlarge"
}

variable "instance_count_linux" {
  description = "Number of instances to launch"
  type        = number
  default     = 1
}

variable "instance_type_linux" {
  description = "The type of instance to start"
  type        = string
  default     = "t3.micro"
}

variable "adminkey_name" {
  description = "The key name to use for the instance"
  type        = string
  default     = "culturemakers_adminkey"
}

variable "userkey_name" {
  description = "The key name to use for the instance"
  type        = string
  default     = "culturemakers_userkey"
}

variable "ec2_instance_linux" {
  description = "List of IPv4 CIDR ranges to use on all ingress rules"
  type        = string
  default     = "0.0.0.0/0"
}

#variable "instance_type_windows" {
#  description = "The type of instance to start"
#  type        = string
#  default
#}