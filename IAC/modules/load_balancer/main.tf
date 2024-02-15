resource "azurerm_public_ip" "lbpubip" {
  name                = "publicIPLB"
  location            = var.location
  resource_group_name = var.rg2
  allocation_method   = "Static"
  # domain_name_label   = element(var.domain_name_label, 0)[0]
  domain_name_label  = "assingment2"
}


resource "azurerm_lb" "assignment1" {
  name                = "lb-assignment1-6507"
  location            = var.location
  resource_group_name = var.rg2
  tags                  = local.common_tags
  frontend_ip_configuration {
    name                 = "PublicIPAddress-6507"
    public_ip_address_id = azurerm_public_ip.lbpubip.id
    
  }
}

resource "azurerm_lb_backend_address_pool" "bpepool" {
  # resource_group_name = var.rg2
  loadbalancer_id     = azurerm_lb.assignment1.id
  name                = "BackEndAddressPool-6507"
}

resource "azurerm_network_interface_backend_address_pool_association" "lb_pool_association" {
  network_interface_id    = element(var.network_interface_id, 0)[0]
  ip_configuration_name   = "linux-centos-vm-ipconfig1"
  backend_address_pool_id = azurerm_lb_backend_address_pool.bpepool.id
}

resource "azurerm_network_interface_backend_address_pool_association" "lb_pool_association2" {
  network_interface_id    = element(var.network_interface_id, 1)[1]
  ip_configuration_name   = "linux-centos-vm1-ipconfig1"
  backend_address_pool_id = azurerm_lb_backend_address_pool.bpepool.id
}


resource "azurerm_lb_rule" "lb_rule" {
  resource_group_name            = var.rg2
  loadbalancer_id                = azurerm_lb.assignment1.id
  name                           = "LBRule-6507"
  protocol                       = "tcp"
  frontend_port                  = 3389
  backend_port                   = 3389
  frontend_ip_configuration_name = "PublicIPAddress-6507"
}

resource "azurerm_lb_probe" "lb_prob" {
  resource_group_name = var.rg2
  loadbalancer_id     = azurerm_lb.assignment1.id
  # name                = "ssh-running-probe-6507"
  # port                = 22
  name                = "tcpProbe"
  protocol            = "http"
  request_path        = "/health"
  port                = 80
  interval_in_seconds = 5
  number_of_probes    = 2
}


resource "azurerm_lb_nat_rule" "example" {
  resource_group_name = var.rg2
  loadbalancer_id     = azurerm_lb.assignment1.id
  name                           = "RDPAccess"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicIPAddress-6507"
}