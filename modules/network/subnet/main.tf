
resource "azurerm_subnet" "subnet" {
  name                                           = var.subnet_name
  resource_group_name                            = var.resource_group
  virtual_network_name                           = var.network_name
  address_prefixes                               = [var.subnet_cidr]
}
