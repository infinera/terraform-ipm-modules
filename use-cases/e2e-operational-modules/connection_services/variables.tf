variable "networks" {
  type = list(object({ profile = optional(string),
                       network_name = optional(string), constellation_frequency = optional(number), modulation = optional(string), managed_by = optional(string), tc_mode = optional(string),  topology = optional(string),
                       hub_module = object({ identifier = object({module_name = optional(string), module_id = optional(string), serial_number = optional(string), 
                                                                 mac_address = optional(string), host_port_name = optional(string), host_name = optional(string),
                                                                host_chassis_id = optional(string), host_chassis_id_subtype = optional(string),
                                                                host_port_id = optional(string), host_port_id_subtype = optional(string),
                                                                host_sys_name  = optional(string), host_port_source_mac = optional(string)}),
                                            traffic_mode : optional(string), fiber_connection_mode : optional(string), managed_by : optional(string), 
                                            planned_capacity : optional(string), requested_nominal_psd_offset : optional(string), 
                                            fec_iterations : optional(string), tx_clp_target : optional(string) })
                      leaf_modules = optional(list(object({ identifier = object({module_name = optional(string), module_id = optional(string), 
                                                            serial_number = optional(string), mac_address = optional(string), 
                                                            host_port_name = optional(string), host_name = optional(string),
                                                            host_chassis_id = optional(string), host_chassis_id_subtype = optional(string),
                                                            host_port_id = optional(string), host_port_id_subtype = optional(string),
                                                            host_sys_name  = optional(string), host_port_source_mac = optional(string)}),
                                                            profile  = optional(string),
                                                            traffic_mode = optional(string), fiber_connection_mode = optional(string),  
                                                            managed_by = optional(string), planned_capacity = optional(string),
                                                            requested_nominal_psd_offset = optional(string),fec_iterations = optional(string),
                                                            tx_clp_target = optional(string) }))) 
  }))
  description = "List of constellation Network"
  default = [{ network_name = "XR Network1",
                profile = "network_profile1",
                hub_module      = { identifier = {module_name = "PORT_MODE_HUB"} },
                leaf_modules = [{ identifier = {module_name = "PORT_MODE_LEAF1" }}, { identifier = {module_name = "PORT_MODE_LEAF2"}}] }]
}


variable "transport-capacities" {
  type = list(object({ profile = optional(string),
                       name = string, capacity_mode = optional(string), labels = optional(map(string)),
                       endpoints = list(object({ identifier = object({module_name = optional(string), module_id = optional(string), serial_number = optional(string), 
                                                                mac_address = optional(string), host_port_name = optional(string), host_name = optional(string),
                                                                host_chassis_id = optional(string), host_chassis_id_subtype = optional(string),
                                                                host_port_id = optional(string), host_port_id_subtype = optional(string),
                                                                host_sys_name  = optional(string), host_port_source_mac = optional(string),
                                                                module_client_if_aid = optional(string)}),
                                                capacity = optional(number)}))
  }))
  description = "List of Transport Capacities"
  default = [{ name = "tc1", profile = "system_tc_profile1",
               endpoints = [ { identifier = {host_chassis_id = "192.168.101.1", host_chassis_id_subtype = "ipAddress", host_port_id = "192.168.101.1",
                host_port_id_subtype = "ipAddress"}}, { identifier = {host_chassis_id = "cb3b.783c.38db", host_chassis_id_subtype = "chassisComponent", 
                host_port_id = "bc3b.783c.38bd", host_port_id_subtype = "portComponent"}}] 
                }]
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

variable "system_data_path" {
  type = string
  default = "../../ipm-profiles"
}

variable "user_data_path" {
  type = string
  default = "../../ipm-profiles"
}
