terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }
}

module "profiles"  {
  source   = "../../profiles"
  
  ipm_profile_path = var.ipm_profile_path
  ipm_tc_profile_name = var.ipm_tc_profile_name
}

module "transport-capacities" {
  source                   = "../../tasks/transport-capacities"

  transport-capacities = var.transport-capacities
  tc_profiles         = module.profiles.tc_profiles

}

output "transport-capacities" {
  value = module.transport-capacities
}


