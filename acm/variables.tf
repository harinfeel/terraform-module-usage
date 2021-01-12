###### Security Group Variables
variable "zone_name" {
  description = "The resource name and Name tag of the Route53 Hostzone name."
  type        = string
  default     = null
}

variable "private_zone" {
  description = "Boolean determining if the private zone false or true."
  type        = bool
  default     = false
}
