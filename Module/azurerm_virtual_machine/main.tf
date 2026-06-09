resource "azurerm_network_interface" "nic" {
  for_each            = var.vms
  name                = each.value.nic-name
  location            = each.value.nic-location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.snet_id[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_security_group" "nsg" {
  for_each            = var.vms
  name                = each.value.nsg-name
  location            = each.value.nsg-location
  resource_group_name = each.value.resource_group_name

  security_rule {
    name                       = "allow-ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "10.0.0.0/16"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface_security_group_association" "nsga" {
  for_each                  = var.vms
  network_interface_id      = azurerm_network_interface.nic[each.key].id
  network_security_group_id = azurerm_network_security_group.nsg[each.key].id
}

resource "azurerm_linux_virtual_machine" "vm" {
  for_each                        = var.vms
  name                            = each.value.vm-name
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.vm-location
  size                            = each.value.size
  custom_data                     = base64encode(file(each.value.script_name))
  admin_username                  = each.value.kvs_name
  admin_password                  = data.azurerm_key_vault_secret.kvs[each.key].value
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = each.value.source_image_reference.publisher
    offer     = each.value.source_image_reference.offer
    sku       = each.value.source_image_reference.sku
    version   = each.value.source_image_reference.version
  }
}
