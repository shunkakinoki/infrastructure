variable "azs" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
  default     = []
}
