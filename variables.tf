
variable "prefix" {
  description = "Prefix "
  type        = string
  # Replace prefix "example" with your compangy name
  default     = "example"
}
variable "location" {
  type    = string
  # Replace with the closest region 
  default = "West Europe"

}

variable "nodecount" {
  default     = 3
  description = "Number of virtual machines"
}
variable "username" {
  description = "Admin username for the virtual machines"
  type        = string
  default     = "rim"
}

variable "password" {
  description = "Admin password for the virtual machines"
  type        = string
  default     = "Rim1235"
}
