
networks = [{ network_name = "XR Network1",
              profile = "network_profile1",
              hub_module = { identifier = {module_name = "PORT_MODE_HUB"} },
              leaf_modules = [{identifier = { module_name = "PORT_MODE_LEAF1" }}] 
            },
            { network_name = "XR Network2",
              profile = "network_profile1",
              hub_module = { identifier = {module_name = "VTI_MODE_HUB"} },
              leaf_modules = [{identifier = { module_name = "PORT_MODE_LEAF3" }}] 
            }]
