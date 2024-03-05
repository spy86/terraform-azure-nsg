output "network_security_group_id" {
  value       = azurerm_network_security_group.main.id
  description = "The ID of the NSG"
}

output "network_security_group_name" {
  value       = azurerm_network_security_group.main.name
  description = "The name of the NSG"
}

output "network_security_group_resource_group_name" {
  value       = azurerm_network_security_group.main.resource_group_name
  description = "The name of the resource group the nsg is in"
}

output "network_security_group_rules" {
  description = "List of network security rules"
  value = {
    for rule in var.network_security_group_list : rule.key => {
      name                        = rule.key
      priority                    = rule.priority
      direction                   = rule.direction
      access                      = rule.access
      protocol                    = rule.protocol
      source_port_range           = rule.source_port_range
      destination_port_range      = rule.destination_port_range
      source_address_prefix       = rule.source_address_prefix
      destination_address_prefix  = rule.destination_address_prefix
      resource_group_name         = data.azurerm_resource_group.rg.name
      network_security_group_name = azurerm_network_security_group.main.name
    }
  }
}

output "network_security_group_subnet_association" {
  description = "Information about the subnet association with the Network Security Group."
  value = var.associate_with_subnet ? {
    subnet_id                 = azurerm_subnet_network_security_group_association.main[0].subnet_id
    network_security_group_id = azurerm_subnet_network_security_group_association.main[0].network_security_group_id
  } : null
}