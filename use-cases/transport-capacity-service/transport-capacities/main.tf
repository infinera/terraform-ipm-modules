terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }

}

provider "ipm" {
  username = var.ipm_user
  password = var.ipm_password
  host     = var.ipm_host
}

module "transport-capacities" {
  //source   = "git::https://github.com/infinera/terraform-ipm_modules.git//transport-capacity-service/workflows/transport-capacities"
  source = "../../../transport-capacity-service/workflows/transport-capacities"

  transport-capacities = var.transport-capacities
  system_profile       = var.system_profile
  user_profile         = var.user_profile
}

output "transport-capacities" {
  value = module.transport-capacities
}

