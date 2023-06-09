variable "network_id" {
  type    = string
  default = "48b8610a-2a6b-491f-a71c-5fd12345be14"
}

variable "leaf_config_profile" {
  type        = string
}

variable "leaf_modules" {
  type = list(object({ identifier = object({module_name = optional(string), module_id = optional(string), serial_number = optional(string), 
                                            mac_address = optional(string), host_port_name = optional(string), host_name = optional(string),
                                            host_chassis_id = optional(string), host_chassis_id_subtype = optional(string),
                                            host_port_id = optional(string), host_port_id_subtype = optional(string),
                                            host_sys_name  = optional(string), host_port_source_mac = optional(string)}),
                        profile  = optional(string),
                        traffic_mode = optional(string), fiber_connection_mode = optional(string),  managed_by = optional(string),
                        planned_capacity = optional(string), requested_nominal_psd_offset = optional(string),fec_iterations = optional(string),
                        tx_clp_target = optional(string) }))
  description = "Leaf modules for specified network name "
  /*default     = [{ identifier = {module_name = "PORT_MODE_LEAF1" }}, { identifier = {module_name = "PORT_MODE_LEAF2"}, traffic_mode : "VTIMode" }]*/
}

variable "module_config_profiles" {
  type        = map(object({ traffic_mode = optional(string), fiber_connection_mode = optional(string), managed_by = optional(string), 
                             planned_capacity = optional(string), requested_nominal_psd_offset = optional(string), fec_iterations = optional(string),
                             tx_clp_target = optional(string) }))
  description = "Map of modules' config profiles"
}
