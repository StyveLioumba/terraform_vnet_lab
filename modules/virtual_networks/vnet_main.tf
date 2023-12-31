# Primary Resource Group's Virtual Network and LinuxVM
resource "azurerm_virtual_network" "tf-vnetwork-01" {
  name                = "tf-vnetwork-01"
  location            = var.location
  resource_group_name = var.rg-Exercise-5-name
  address_space       = var.vnet1_address_space

  tags                = {
    environment-5 = var.environment-5
    "Network"     = "tf-network-01"
  }
}

# Subnet for rg5 / tf-vnetwork-01
resource "azurerm_subnet" "rg5-subnet-1" {
  name                 = "rg5-subnet-1"
  resource_group_name  = var.rg-Exercise-5-name
  virtual_network_name = azurerm_virtual_network.tf-vnetwork-01.name
  address_prefixes     = var.rg5-subnet-1-address
}

# Public ip address for rg5 / tf-vnetwork-01
resource "azurerm_public_ip" "tf-linux-vm-01-publicIP" {
  name                      = "tf-linux-vm-01-publicIP"
  location                  = var.location
  resource_group_name       = var.rg-Exercise-5-name
  sku                       = var.firewall_sku
  allocation_method         = var.firewall_allocation_method
  idle_timeout_in_minutes   = "10"

  tags = {
    environment-5 = var.environment-5
  }
}

resource "azurerm_network_interface" "linuxVM_private_ip_nw_interface" {
  name                = "linuxVM_private_ip_nw_interface"
  location            = var.location
  resource_group_name = var.rg-Exercise-5-name

  ip_configuration {
    name                          = "linuuxVM_NIC_ipConfig"
    subnet_id                     = azurerm_subnet.rg5-subnet-1.id
    public_ip_address_id          = azurerm_public_ip.tf-linux-vm-01-publicIP.id
    private_ip_address_allocation = "Dynamic"
    private_ip_address            = "10.0.2.5"
  }

    tags = {
        environment-5 = var.environment-5
    }
}

# Secondary Resource Group's Virtual Network and WindowsVM
resource "azurerm_virtual_network" "tf-vnetwork-02" {
  name                = "tf-vnetwork-02"
  location            = var.location
  resource_group_name = var.rg-Exercise-5a-name
  address_space       = var.vnet2_address_space

  tags                = {
    environment-5a = var.environment-5a
    "Network"     = "tf-network-02"
  }
}

# Subnet for rg5 / tf-vnetwork-02
resource "azurerm_subnet" "rg5a-subnet-1" {
  name                 = "rg5a-subnet-1"
  resource_group_name  = var.rg-Exercise-5a-name
  virtual_network_name = azurerm_virtual_network.tf-vnetwork-02.name
  address_prefixes     = var.rg5a-subnet-1-address
}

resource "azurerm_network_interface" "windowsVM_private_ip_nw_interface" {
  name                = "windowsVM_private_ip_nw_interface"
  location            = var.location
  resource_group_name = var.rg-Exercise-5a-name

  ip_configuration {
    name                          = "windowsVM_NIC_ipConfig"
    subnet_id                     = azurerm_subnet.rg5a-subnet-1.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = {
    environment-5a = var.environment-5a
  }
}


# ******

data "azurerm_public_ip" "linux-public-ip" {
  name                = azurerm_public_ip.tf-linux-vm-01-publicIP.name
  resource_group_name = var.rg-Exercise-5-name
}