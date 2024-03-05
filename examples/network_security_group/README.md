# Terraform Module: Azure Network Security Group

This Terraform module provisions an Azure Network Security Group (NSG) with associated security rules. It provides flexibility in configuring security rules for inbound and outbound traffic.

## Features

* Create an Azure Network Security Group.
* Define custom security rules for the NSG.
* Optionally associate the NSG with a subnet.

## Usage

### Example

```hcl
provider "azurerm" {
features {}
}

module "example_nsg" {
  source  = "Think-Cube/network-security-group/azure"
  version = "1.0.0"
  resource_group_name = "test"
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
```

### Variables

* `environment`: Name of the environment (default: "dev").
* `resource_group_name`: Name of the Azure Resource Group.
* `network_security_group_name`: Name of the Network Security Group.
* `network_security_group_list`: List of security rules.
* `associate_with_subnet`: Controls subnet association.
* `subnet_id`: ID of the subnet to associate with (if associate_with_subnet is set to true).

### Outputs

* `network_security_group_id`: ID of the NSG.
* `network_security_group_name`: Name of the NSG.
* `network_security_group_resource_group_name`: Name of the resource group containing the NSG.
* `network_security_group_rules`: List of network security rules.
* `network_security_group_subnet_association`: Subnet association information (if applicable).

## License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).

## Contribution

Feel free to contribute by opening issues or pull requests. Your feedback and improvements are highly appreciated!
