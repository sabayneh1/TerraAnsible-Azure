variable "rg2" {}
variable "location" {}

variable "public_ip_address_id" {

}
# variable "domain_name" { 
#     # default = null 
#  }

variable "linux_nic" {

    default = null 
}


variable "network_interface_id" {
  
}

locals {

  common_tags = {
    Name         = "Samander.Abayneh"
    project      = "Automation Project-Assignment2"
    ContactEmail = "n01516507@humber.ca"
    ExpirationDate = "2022-04-19"
    Environment  = "Lab"
  }
}
