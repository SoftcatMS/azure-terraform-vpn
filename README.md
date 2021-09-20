# azure-terraform-vpn

Deployes a virtual network gateway in Azure as Vpn, does not support Expressroute setup.
VPN can be configured in active-active mode with optional point-to-site configuration activated.

Based of original module: https://github.com/avinor/terraform-azurerm-vpn

It supports creating:

- Network Gateway
- Network Gateway Connection


## Usage Examples
Review the examples folder: [examples](./examples)


## Deployment
Perform the following commands on the root folder:

- `terraform init` to get the plugins
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply the infrastructure build
- `terraform destroy` to destroy the built infrastructure


< use terraform-docs to create Inputs and Outpus documentation  [terraform-docs](https://github.com/terraform-docs/terraform-docs)

`terraform-docs markdown .`


## Requirements
### Installed Software
The following dependencies must be installed on the development system:

- [Terraform](https://www.terraform.io/downloads.html) 

Azure  
- [Terraform Provider for Azure](https://github.com/hashicorp/terraform-provider-azurerm)
- CLI Tool [az](https://docs.microsoft.com/en-us/cli/azure/)


## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_local_network_gateway.local](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/local_network_gateway) | resource |
| [azurerm_monitor_diagnostic_setting.gw](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_monitor_diagnostic_setting.gw_aa_pip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_monitor_diagnostic_setting.gw_pip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_public_ip.gw](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_public_ip.gw_aa](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_virtual_network_gateway.gw](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_gateway) | resource |
| [azurerm_virtual_network_gateway_connection.local](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_gateway_connection) | resource |
| [random_string.dns](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_active_active"></a> [active\_active](#input\_active\_active) | If true, an active-active Virtual Network Gateway will be created. An active-active gateway requires a HighPerformance or an UltraPerformance sku. If false, an active-standby gateway will be created. Defaults to false. | `bool` | `false` | no |
| <a name="input_client_configuration"></a> [client\_configuration](#input\_client\_configuration) | If set it will activate point-to-site configuration. | `object({ address_space = string, protocols = list(string), certificate = string })` | `null` | no |
| <a name="input_enable_bgp"></a> [enable\_bgp](#input\_enable\_bgp) | If true, BGP (Border Gateway Protocol) will be enabled for this Virtual Network Gateway. Defaults to false. | `bool` | `false` | no |
| <a name="input_local_networks"></a> [local\_networks](#input\_local\_networks) | List of local virtual network connections to connect to gateway. | `list(object({ name = string, gateway_address = string, address_space = list(string), shared_key = string, ipsec_policy = any }))` | `[]` | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure Region in which to create resource. | `any` | n/a | yes |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | Specifies the ID of a Log Analytics Workspace where Diagnostics Data should be sent. | `any` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of virtual gateway. | `any` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of resource group to deploy resources in. | `any` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | Configuration of the size and capacity of the virtual network gateway. | `any` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Id of subnet where gateway should be deployed, have to be names GatewaySubnet. | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to all resources created. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_fqdns"></a> [fqdns](#output\_fqdns) | List of the fqdn for gateway. Will return 2 for active\_ac


## Contributing

Refer to the [contribution guidelines](./CONTRIBUTING.md) for
information on contributing to this module.
