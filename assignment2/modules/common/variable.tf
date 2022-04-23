variable "location" {}
variable "rg2" {}

locals {

  common_tags = {
    Name         = "Samander.Abayneh"
    project      = "Automation Project-Assignment2"
    ContactEmail = "n01516507@humber.ca"
    ExpirationDate = "2022-04-19"
    Environment  = "Lab"
  }
}
