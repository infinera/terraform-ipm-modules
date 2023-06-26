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

data "ipm_lcs" "lcs" {
  1
  2
  3
}

output "lcs" {
  value = data.ipm_lcs.lcs
}