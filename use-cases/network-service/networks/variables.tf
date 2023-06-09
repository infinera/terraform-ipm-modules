variable "networks" {
  type = list(object({ profile = optional(string),
    network_name = optional(string), constellation_frequency = optional(number), modulation = optional(string), managed_by = optional(string), tc_mode = optional(string), topology = optional(string),
    hub_module = object({ identifier = object({ module_name = optional(string), module_id = optional(string), serial_number = optional(string),
      mac_address     = optional(string), host_port_name = optional(string), host_name = optional(string),
      host_chassis_id = optional(string), host_chassis_id_subtype = optional(string),
      host_port_id    = optional(string), host_port_id_subtype = optional(string),
      host_sys_name = optional(string), host_port_source_mac = optional(string) }),
      traffic_mode : optional(string), fiber_connection_mode : optional(string), managed_by : optional(string),
      planned_capacity : optional(string), requested_nominal_psd_offset : optional(string),
    fec_iterations : optional(string), tx_clp_target : optional(string) })
    leaf_modules = optional(list(object({ identifier = object({ module_name = optional(string), module_id = optional(string),
      serial_number   = optional(string), mac_address = optional(string),
      host_port_name  = optional(string), host_name = optional(string),
      host_chassis_id = optional(string), host_chassis_id_subtype = optional(string),
      host_port_id    = optional(string), host_port_id_subtype = optional(string),
      host_sys_name = optional(string), host_port_source_mac = optional(string) }),
      profile                      = optional(string),
      traffic_mode                 = optional(string), fiber_connection_mode = optional(string),
      managed_by                   = optional(string), planned_capacity = optional(string),
      requested_nominal_psd_offset = optional(string), fec_iterations = optional(string),
    tx_clp_target = optional(string) })))
  }))
  description = "List of constellation Network"
  default = [{ network_name = "XR Network1",
    profile    = "network_profile1",
    hub_module = { identifier = { module_name = "PORT_MODE_HUB" } },
  leaf_modules = [{ identifier = { module_name = "PORT_MODE_LEAF1" } }] }]
}

variable "ipm_user" {
  type = string
}

variable "ipm_password" {
  type      = string
  sensitive = true
}

variable "ipm_host" {
  type = string
}

// System profiles has three parts: Network Profile, Network Config Profile and Module Confif Profile
// Network- Profile : type = map(object({network_config_profile = optional(string), hub_config_profile= optional(string), leaf_config_profile= optional(string)}))
//Network Config Profile - type = map(object({constellation_frequency= optional(number), modulation = optional(string), managed_by=optional(string), tc_mode=optional(string)}))
//Module-config profile: type = map(object({traffic_mode= optional(string),fiber_connection_mode= optional(string), managed_by= optional(string), planned_capacity= optional(string), requested_nominal_psd_offset= optional(string), fec_iterations= optional(string), tx_clp_target= optional(string)}))
variable "system_profile" {
  type = string
  default = "../../system-profiles/network_profiles.json"
}

// Please see System Profile
variable "user_profile" {
  type = string
  default = "network_profiles.json"
}

