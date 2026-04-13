variable "bucket_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "versioning_enabled" {
  type    = bool
  default = true
}

variable "enable_logging" {
  type    = bool
  default = false
}

variable "logging_target_bucket" {
  type    = string
  default = ""
}

variable "lifecycle_days" {
  type    = number
  default = 90
}
