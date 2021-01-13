###### Security Group Variables
variable "key_name" {
  description = "The resource name and Name tag of the key pair name."
  type        = string
  default     = null
}

variable "public_key" {
  description = "The public key material."
  type        = string
  default     = ""
}