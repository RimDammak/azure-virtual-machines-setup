# VMs
resource "azurerm_linux_virtual_machine" "vm" {
  count                           = var.nodecount
  name                            = "${var.prefix}-vm${count.index + 1}"
  location                        = azurerm_resource_group.main.location
  resource_group_name             = azurerm_resource_group.main.name
  size                            = "Standard_DS1_v2" 
  #about the specs of the machine, i choose dsv1-v2 : 3.5 GiB of memory
  disable_password_authentication = false

  network_interface_ids = [azurerm_network_interface.nic[count.index].id]

  admin_username = var.username
  admin_password = var.password
  admin_ssh_key {
    username   = var.username  # Ensure this matches the admin username
    public_key = file("~/.ssh/id_rsa.pub")
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    name                 = "${var.prefix}-osdisk-${count.index + 1}"
  }

  source_image_reference {
    offer     = "0001-com-ubuntu-server-focal"
    publisher = "Canonical"
    sku       = "20_04-lts-gen2"
    version = "latest"
  }
    
	connection {
        host = self.public_ip_address
        user = "rim"
        type = "ssh"
        private_key = "${file("~/.ssh/id_rsa")}"
        timeout = "4m"
        agent = false
    }
    provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y ansible",
      "sudo mkdir -p /etc/ansible"
    ]
  }
  

}