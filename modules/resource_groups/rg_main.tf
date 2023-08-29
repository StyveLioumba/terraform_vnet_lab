# Primary Resource group
resource "azurerm_resource_group" "rg-Exercise-5" {
  location      = var.location
  name          = "rg-${var.environment-5}-${var.random_ID}"

  tags          = {
    environment = var.environment-5
    name        = "Primary Resource Group"
  }

}

data "azurerm_resource_group" "rg-Exercise-5" {
  name = azurerm_resource_group.rg-Exercise-5.name
}

# Secondary Resource group
resource "azurerm_resource_group" "rg-Exercise-5a" {
  location      = var.location
  name          = "rg-${var.environment-5a}"

  tags          = {
    environment = var.environment-5a
    name        = "Secondary Resource Group"
  }
}

data "azurerm_resource_group" "rg-Exercise-5a" {
  name = azurerm_resource_group.rg-Exercise-5a.name
}
