# Project Constants
location = "westeurope"

# Primary resource group.

environment-5 = "Exercise-5"
vnet1_address_space = ["10.1.0.0/16"]
rg5-subnet-1-address = ["10.1.1.0/24"]

# When the SKU is default 'Basic', allocation method 'Dynamic' works but for 'Standard' , it has to be 'Static'
firewall_allocation_method = "Static"
firewall_sku = "Standard"

# Secondary resource group.
environment-5a = "Exercise-5a"
vnet2_address_space = ["10.2.0.0/16"]
rg5a-subnet-1-address = ["10.2.1.0/24"]

final_linuxVM_pswd = "P@ssw0rd1234"
final_windowsVM_pswd = "P@ssw0rd1234"