module "simple" {
  source = "github.com/SoftcatMS/terraform-azure-vpn"

  name                = "vpn-example-advanced"
  resource_group_name = azurerm_resource_group.rg-vpn-example-advanced.name
  location            = azurerm_resource_group.rg-vpn-example-advanced.location
  subnet_id           = module.vnet.vnet_subnets[1]
  sku                 = "VpnGw1AZ"

  tags = {
    environment = "example"
    engineer    = "ci/cd"
  }

  local_networks = [
    {
      name            = "onpremise"
      gateway_address = "8.8.8.8"
      address_space = [
        "10.0.0.0/8"
      ]
      shared_key = "exampleING"
      ipsec_policy = {
        dh_group         = "DHGroup2"
        ike_encryption   = "AES256"
        ike_integrity    = "SHA256"
        ipsec_encryption = "AES256"
        ipsec_integrity  = "SHA256"
        pfs_group        = "PFS24"
        sa_datasize      = "102400000"
        sa_lifetime      = "3600"
      }
    },
  ]

}
