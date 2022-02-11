module "simple" {
  source = "git@github.com:SoftcatMS/azure-terraform-vpn"

  name                = "vpn-example-basic"
  resource_group_name = azurerm_resource_group.rg-vpn-example-basic.name
  location            = azurerm_resource_group.rg-vpn-example-basic.location
  subnet_id           = module.vnet.vnet_subnets[0]
  sku                 = "VpnGw1AZ"

  tags = {
    environment = "example"
    engineer    = "ci/cd"
  }


}
