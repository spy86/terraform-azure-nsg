<!-- BEGIN_TF_DOCS -->
#### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.4 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 4.14.0 |

#### Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.14.0 |

#### Resources

| Name | Type |
|------|------|
| [azurerm_network_security_group.main](https://registry.terraform.io/providers/hashicorp/azurerm/4.14.0/docs/resources/network_security_group) | resource |
| [azurerm_network_security_rule.main](https://registry.terraform.io/providers/hashicorp/azurerm/4.14.0/docs/resources/network_security_rule) | resource |
| [azurerm_subnet_network_security_group_association.main](https://registry.terraform.io/providers/hashicorp/azurerm/4.14.0/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/4.14.0/docs/data-sources/client_config) | data source |
| [azurerm_resource_group.main](https://registry.terraform.io/providers/hashicorp/azurerm/4.14.0/docs/data-sources/resource_group) | data source |

#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_associate_with_subnet"></a> [associate\_with\_subnet](#input\_associate\_with\_subnet) | Controls whether the Network Security Group should be associated with a subnet. When set to true, an association with the specified subnet is created; when set to false, no subnet association is established. | `bool` | `false` | no |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | A mapping of tags to assign to the resource. | `map(any)` | <pre>{<br/>  "ManagedByTerraform": "True"<br/>}</pre> | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Variable that defines the name of the environment. | `string` | `"dev"` | no |
| <a name="input_network_security_group_list"></a> [network\_security\_group\_list](#input\_network\_security\_group\_list) | List of security\_rule objects representing security rules, as defined below. | `map(any)` | <pre>{<br/>  "AllowHTTPAndHTTPS": {<br/>    "access": "Allow",<br/>    "destination_address_prefix": "10.1.0.0/16",<br/>    "destination_port_range": "80,443",<br/>    "direction": "Inbound",<br/>    "priority": "1001",<br/>    "protocol": "Tcp",<br/>    "source_address_prefix": "192.168.1.0/24",<br/>    "source_port_range": "*"<br/>  }<br/>}</pre> | no |
| <a name="input_network_security_group_name"></a> [network\_security\_group\_name](#input\_network\_security\_group\_name) | Specifies the name of the network security group. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region in which resources are deployed. | `string` | `"weu"` | no |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | `any` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the network security group. Changing this forces a new resource to be created. | `any` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The ID of the Subnet. Changing this forces a new resource to be created. | `string` | `""` | no |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_security_group_id"></a> [network\_security\_group\_id](#output\_network\_security\_group\_id) | The ID of the NSG |
| <a name="output_network_security_group_name"></a> [network\_security\_group\_name](#output\_network\_security\_group\_name) | The name of the NSG |
| <a name="output_network_security_group_resource_group_name"></a> [network\_security\_group\_resource\_group\_name](#output\_network\_security\_group\_resource\_group\_name) | The name of the resource group the nsg is in |
| <a name="output_network_security_group_rules"></a> [network\_security\_group\_rules](#output\_network\_security\_group\_rules) | List of network security rules |
| <a name="output_network_security_group_subnet_association"></a> [network\_security\_group\_subnet\_association](#output\_network\_security\_group\_subnet\_association) | Information about the subnet association with the Network Security Group. |
<!-- END_TF_DOCS -->