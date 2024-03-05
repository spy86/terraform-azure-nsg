###########################
# Common vars
###########################
variable "environment" {
  description = "Variable that defines the name of the environment."
  type        = string
  default     = "dev"
}
variable "default_tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
  default = {
    "ManagedByTerraform" = "True"
  }
}
variable "region" {
  description = "Region in which resources are deployed."
  type        = string
  default     = "weu"
}
############################
#Resource gropus vars
############################
variable "resource_group_location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  description = "The name of the resource group in which to create the network security group. Changing this forces a new resource to be created."
}
###############################
#Network scurity group variable
###############################
variable "network_security_group_name" {
  description = "Specifies the name of the network security group. Changing this forces a new resource to be created."
  type        = string
}
variable "network_security_group_list" {
  description = "List of security_rule objects representing security rules, as defined below."
  type        = map(any)
  default = {
    "AllowHTTPAndHTTPS" = { priority = "1001", direction = "Inbound", access = "Allow", protocol = "Tcp", source_port_range = "*", destination_port_range = "80,443", source_address_prefix = "*", destination_address_prefix = "*" },
  }
}
variable "associate_with_subnet" {
  description = "Controls whether the Network Security Group should be associated with a subnet. When set to true, an association with the specified subnet is created; when set to false, no subnet association is established."
  type        = bool
  default     = false
}
variable "subnet_id" {
  description = "The ID of the Subnet. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}