###### Security Group Variables
variable "name" {
  description = "Name of security group"
  type        = string
  default     = ""
}

variable "name_bastion" {
  description = "Name of security group"
  type        = string
  default     = ""
}

variable "name_elb_to_ec2" {
  description = "Name of security group"
  type        = string
  default     = ""
}

variable "ingress_with_cidr_blocks" {
  description = "List of IPv4 CIDR ranges to use on all ingress rules"
  type        = string
  default     = ""
}

variable "sg_rule_alb_gitlab" {
  description = "List of Security Group ingress rules"
  type        = string
  default     = ""
}

variable "ingress_description_http" {
  description = "Ingress rule description"
  type        = string
  default     = "List of IPv4 CIDR ranges to use on all ingress rules"
}

variable "ingress_description_ssh" {
  description = "Ingress rule description"
  type        = string
  default     = "Security group for ssh connection 22 port open"
}

variable "ingress_cidr_blocks" {
  description = "List of IPv4 CIDR ranges to use on all ingress rules"
  type        = string
  default     = ""
}

variable "ingress_cidr_blocks_bastion" {
  description = "List of IPv4 CIDR ranges to use on all ingress rules"
  type        = string
  default     = ""
}

variable "ingress_rules_http" {
  description = "List of ingress rules to create by name"
  type        = string
  default     = "http-80-tcp"
}

variable "ingress_rules_https" {
  description = "List of ingress rules to create by name"
  type        = string
  default     = "https-443-tcp"
}

variable "ingress_rules_ssh" {
  description = "List of ingress rules to create by name"
  type        = string
  default     = "ssh-tcp"
}

variable "ec2_instance_name_linux" {
  description = "Name to be used on all resources as prefix"
  type        = string
  default     = ""
}

variable "instance_count_linux" {
  description = "Number of instances to launch"
  type        = number
  default     = 0
}
