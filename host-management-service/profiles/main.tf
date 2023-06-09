terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }
}

locals {
  system_profiles = fileexists("${var.system_data_path}/host_profiles.json") ? jsondecode(file("${var.system_data_path}/host_profiles.json")) : { host_profiles : {} }

  user_profiles = fileexists("${user_data_path}/host_profiles.json") ? jsondecode(file("${user_data_path}/host_profiles.json")) : fileexists("${path.root}/host_profiles.json") ? jsondecode(file("${path.root}/host_profiles.json")) : { host_profiles : {} }

  host_profiles = merge(local.user_profiles.host_profiles, local.system_profiles.host_profiles)
}

output "host_profiles" {
  value = local.host_profiles
}
