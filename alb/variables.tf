## Domain name
variable "domain_name" {
  description = "The resource name and Name tag of the domain name."
  type        = string
  default     = null
}
## Security Group Variables
variable "lb_name" {
  description = "The resource name and Name tag of the load balancer."
  type        = string
  default     = null
}

variable "listener_ssl_policy_default" {
  description = "The security policy if using HTTPS externally on the load balancer. [See](https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-security-policy-table.html)."
  type        = string
  default     = "ELBSecurityPolicy-2016-08"
}

variable "internal" {
  description = "Boolean determining if the load balancer is internal or externally facing."
  type        = bool
  default     = false
}

variable "load_balancer_type" {
  description = "The type of load balancer to create. Possible values are application or network."
  type        = string
  default     = "application"
}

variable "access_logs" {
  description = "Map containing access logging configuration for load balancer."
  type        = map(string)
  default     = {}
}

variable "target_groups" {
  description = "A list of maps containing key/value pairs that define the target groups to be created. Order of these maps is important and the index of these are to be referenced in listener definitions. Required key/values: name, backend_protocol, backend_port"
  type        = any
  default     = []
}

variable "name_prefix" {
  description = "The resource name prefix and Name tag of the load balancer. Cannot be longer than 6 characters"
  type        = string
  default     = null
}

variable "backend_protocol" {
  description = ""
  type        = string
  default     = ""
}

variable "backend_port" {
  description = ""
  type        = number
  default     = 80
}

variable "target_type" {
  description = ""
  type        = string
  default     = ""
}

variable "interval" {
  description = ""
  type        = number
  default     = 30
}


variable "path" {
  description = ""
  type        = string
  default     = ""
}


variable "port" {
  description = ""
  type        = string
  default     = ""
}


variable "healthy_threshold" {
  description = ""
  type        = string
  default     = ""
}

variable "unhealthy_threshold" {
  description = ""
  type        = string
  default     = ""
}

variable "timeout" {
  description = ""
  type        = string
  default     = ""
}

variable "protocol" {
  description = ""
  type        = string
  default     = "HTTP"
}

variable "matcher" {
  description = ""
  type        = string
  default     = ""
}

