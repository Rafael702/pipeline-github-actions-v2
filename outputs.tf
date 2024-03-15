output "vm-aws-ip" {
  description = "IP da maquina virtual criada na aws"
  value       = aws_instance.vm.public_ip
}

output "vm-azure-ip" {
  description = "IP da maquina virtual criada na azure"
  value       = azurerm_linux_virtual_machine.vm.public_ip_address
}