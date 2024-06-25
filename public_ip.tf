# Public IPs
resource "azurerm_public_ip" "vm" {
  count               = var.nodecount
  name                = "${var.prefix}-public-ip-vm${count.index + 1}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  allocation_method   = "Static"
}
# Network interfaces
resource "azurerm_network_interface" "nic" {
  count               = var.nodecount
  name                = "${var.prefix}-interface-vm${count.index + 1}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "${var.prefix}-interface-vm${count.index + 1}-config"
    subnet_id                     = azurerm_subnet.main.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm[count.index].id
  }
}
# Network interface security group associations
resource "azurerm_network_interface_security_group_association" "nsg-nic" {
  count                     = var.nodecount
  network_interface_id      = azurerm_network_interface.nic[count.index].id
  network_security_group_id = azurerm_network_security_group.main.id
}

