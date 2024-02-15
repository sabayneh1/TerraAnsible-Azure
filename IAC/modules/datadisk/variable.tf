variable "rg2" {}

variable "location" {}

locals {

  common_tags = {
    Project        = "AutomationProject-Assignment2"
    Name           = "samander.abayneh"
    ExpirationDate = "2022-04-19"
    ContactEmail   = "n01516507@humber.ca"
    Environment    = "Lab"
  }
}
variable "linux_name" { 
  type    = map(string)
  default = {}

}
variable "windows_name" {

}

variable "linux_virtual_machine_ids" {

}

variable "window_virtual_machine_ids" {

}
# variable "data_disk_attr" {
#   type = map(string)
#   default = {
#     wos_disk_caching         = "ReadWrite"
#     data_disk_type          = "Standard_LRS"
#     wos_disk_size            = "127"
#   }
# }

# variable "create_option" {
#   type = string
# }

variable "disk_iops_read_write" {
  type    = number
  default = null
}

variable "disk_mbps_read_write" {
  type    = number
  default = null
}

variable "disk_size_gb" {
  type    = number
  default = null
}



# variable "location" {
#   type = string
# }

# variable "name" {
#   type = string
# }

variable "os_type" {
  type    = string
  default = null
}

# variable "resource_group_name" {
#   type = string
# }

variable "source_resource_id" {
  type    = string
  default = null
}

variable "source_uri" {
  type    = string
  default = null
}

variable "storage_account_id" {
  type    = string
  default = null
}

# variable "storage_account_type" {
#   type = string
# }

variable "tags" {
  type    = map(string)
  default = null
}

variable "zones" {
  type    = list(string)
  default = null
}

variable "encryption_settings" {
  type = set(object(
    {
      disk_encryption_key = list(object(
        {
          secret_url      = string
          source_vault_id = string
        }
      ))
      enabled = bool
      key_encryption_key = list(object(
        {
          key_url         = string
          source_vault_id = string
        }
      ))
    }
  ))
  default = []
}

variable "timeouts" {
  type = set(object(
    {
      create = string
      delete = string
      read   = string
      update = string
    }
  ))
  default = []
}