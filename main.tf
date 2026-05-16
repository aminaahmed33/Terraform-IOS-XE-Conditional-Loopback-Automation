terraform {
  required_providers {
    iosxe ={
        source = "CiscoDevnet/iosxe"
        version = "0.17.0"
    }
  }
}

provider "iosxe" {
    alias = "R1"
    username = var.username
    password = var.password
    host = var.r1_IP
    protocol = "restconf"
}
provider "iosxe" {
    alias = "R2"
    username = var.username
    password = var.password
    host = var.r2_IP
    protocol = "restconf"
}

resource "iosxe_interface_loopback" "r1_loopback" {
  provider = iosxe.R1
  name = 105
  ipv4_address = "10.10.105.1"
  ipv4_address_mask = "255.255.255.255"
  description = "R1 Terraform Loopback"
  
}

resource "iosxe_interface_loopback" "r2_loopback"{
  provider= iosxe.R2
  name = 106
  ipv4_address = "10.10.106.1"
  ipv4_address_mask = "255.255.255.255"
  description = "R2 Terraform Loopback"
  
}

resource "iosxe_interface_loopback" "r2_secondary_loopback" {
  provider = iosxe.R2
  count = var.enable_secondary_loopback? 1:0
  name = 107
  ipv4_address = "10.10.107.1"
  ipv4_address_mask = "255.255.255.0"
  description = "Secondary loopback (conditional) on R2"
  
}
  
