resource "azurerm_managed_disk" "data_disk1" {
  for_each             = var.windows_name
  name                 = "${each.key}-data-disk"
  location             = var.location
  resource_group_name  = var.rg2
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "10"
  # depends_on = [azurerm_windows_virtual_machine.vmwindows]
  tags = local.common_tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "data_disk_attach1" {
  for_each           = var.windows_name
  managed_disk_id    = azurerm_managed_disk.data_disk1[each.key].id
  virtual_machine_id = element(var.window_virtual_machine_ids, 0)[0]
  lun                = 0
  caching            = "ReadWrite"
  #   caching            = var.data_disk_attr["data_disk_caching"]
  depends_on = [azurerm_managed_disk.data_disk1]
}

resource "azurerm_managed_disk" "data_disk2" {
  # for_each             = var.linux_name
  # name                 = "${each.key}-data-disk2"
  name                 = "linux-centos-vm1-data-disk2"
  location             = var.location
  resource_group_name  = var.rg2
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "10"
  # depends_on = [azurerm_linux_virtual_machine.linux_name]
  tags = local.common_tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "data_disk_attach2" {
  # for_each = var.linux_name
  managed_disk_id    = azurerm_managed_disk.data_disk2.id
  virtual_machine_id = element(var.linux_virtual_machine_ids, 0)[0]
  lun                = 5
  caching            = "ReadWrite"
  depends_on         = [azurerm_managed_disk.data_disk2]


}


resource "azurerm_managed_disk" "data_disk3" {
  # for_each             = var.linux_name
  name                 = "linux-centos-vm2-data-disk3"
  location             = var.location
  resource_group_name  = var.rg2
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "10"
  # depends_on = [azurerm_linux_virtual_machine.linux_name]
  tags = local.common_tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "data_disk_attach3" {
  # for_each = var.linux_name
  // might be defined as variable an called from main module. Siblings cannot refer each other
  // linux name can be defined in linux output and main output then we can use here as variable.
  managed_disk_id    = azurerm_managed_disk.data_disk3.id
  virtual_machine_id = element(var.linux_virtual_machine_ids, 1)[1]
  lun                = 10
  caching            = "ReadWrite"
  depends_on         = [azurerm_managed_disk.data_disk3]
}



