variable "r1_IP" {
    default = "10.255.1.102"
    description = "The management IP ro R1"
  
}
variable "r2_IP" {
    default = "10.255.1.103"
    description = "The management IP for R2"
  
}
variable "username" {
    default = "admin"
}

variable "password" {
    sensitive = true
  
}
variable "enable_secondary_loopback" {
    description = "Whether to configure a second loopback on R2"
    type = bool
    default = true
  
}