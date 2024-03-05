resource "azurerm_subnet_network_security_group_association" "main" {
  count                     = var.associate_with_subnet ? 1 : 0
  subnet_id                 = var.subnet_id
  network_security_group_id = azurerm_network_security_group.main.id

  timeouts {
    create = "5m"
    delete = "10m"
  }

  depends_on = [azurerm_network_security_group.main]
}