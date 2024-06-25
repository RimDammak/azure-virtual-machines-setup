output "public_ips" {
  description = "These are the Virtual Machines s public keys: "
  value = [azurerm_linux_virtual_machine.vm[*].public_ip_address]
}

output "public_ips_commands" {
  description = "These are the commands needed to enter the machines"
  value = [for idx in range(length(azurerm_public_ip.vm)) : "ssh rim@${azurerm_public_ip.vm[idx].ip_address}"]
}
