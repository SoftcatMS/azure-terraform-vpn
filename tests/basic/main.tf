resource "azurerm_resource_group" "rg-vpn-test-basic" {
  name     = "rg-test-vpn-basic-resources"
  location = "UK South"
}


module "vnet" {
  source              = "github.com/SoftcatMS/azure-terraform-vnet"
  vnet_name           = "vnet-test-vpn-basic"
  resource_group_name = azurerm_resource_group.rg-vpn-test-basic.name
  address_space       = ["10.3.0.0/16"]
  subnet_prefixes     = ["10.3.1.0/26"]
  subnet_names        = ["GatewaySubnet"]

  tags = {
    environment = "test"
    engineer    = "ci/cd"
  }

  depends_on = [azurerm_resource_group.rg-vpn-test-basic]
}

module "simple" {
  source = "../../"

  name                = "vpn-test-basic"
  resource_group_name = azurerm_resource_group.rg-vpn-test-basic.name
  location            = azurerm_resource_group.rg-vpn-test-basic.location
  subnet_id           = module.vnet.vnet_subnets[0]
  sku                 = "VpnGw1AZ"

  tags = {
    environment = "test"
    engineer    = "ci/cd"
  }


}
