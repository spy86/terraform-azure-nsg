provider "azurerm" {
features {}
}

module "example_nsg" {
  source  = "Think-Cube/network-security-group/azure"
  version = "1.0.0"
  resource_group_name = "dev-test-weu-rg"
  environment = "dev" 
  region = "weu"
  resource_group_location = "West Europe"
  network_security_group_name = "test"
  network_security_group_list = {
    "AllowHTTPAndHTTPS" = {
      priority                   = "1001"
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80,443"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
    # Add additional security rules as needed
  }
  associate_with_subnet = true
  subnet_id             = "example-subnet-id"  
  default_tags = {
      Administrator     = "John Doe"
      Department        = "IT"
      CostCentre        = "CC123"
      ContactPerson     = "Jane Smith"
      ManagedByTerraform = "True"
}
}
