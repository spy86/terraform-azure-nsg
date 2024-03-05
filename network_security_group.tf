resource "azurerm_network_security_group" "main" {
  name                = "${var.environment}-${var.network_security_group_name}-${var.region}-nsg"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  tags                = var.default_tags

  timeouts {
    create = "5m"
    delete = "10m"
  }
}

resource "azurerm_network_security_rule" "main" {
  for_each = var.network_security_group_list

  name                        = each.key
  priority                    = each.value.priority
  direction                   = each.value.direction
  access                      = each.value.access
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = data.azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.main.name

  depends_on = [azurerm_network_security_group.main]
}