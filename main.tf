resource "azurerm_resource_group" "main" {
  name     = "${var.prefix}-rg"
  location = var.location

}
# Create virtual network 
resource "azurerm_virtual_network" "main" {
  name                = "${var.prefix}-virtual-network"
  address_space       = ["10.10.0.0/16"]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}
# Create subnet

resource "azurerm_subnet" "main" {
  name                 = "${var.prefix}-subnet"
  resource_group_name  = azurerm_resource_group.main.name
  address_prefixes     = ["10.10.5.0/24"]
  virtual_network_name = azurerm_virtual_network.main.name


}

# Create Network Security Group and rule



resource "azurerm_network_security_group" "main" {
  name                = "${var.prefix}-network-security-group"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name


  security_rule {
    name                       = "Allow-SSH-access"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"

  }

}
