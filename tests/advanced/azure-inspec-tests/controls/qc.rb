# copyright: 2018, The Authors

# Test values

resource_group1 = 'rg-test-vpn-advanced-resources'
gateway_name = 'vpn-test-advanced-gw'


describe azure_virtual_network_gateways(resource_group: resource_group1) do
  its('names') { should include(gateway_name) }
end

describe azure_generic_resource(resource_group: resource_group1, name: gateway_name) do
  its('properties.sku.name') { should cmp 'VpnGw1AZ' }
  its('properties.vpnType') { should cmp 'RouteBased' } 
  its('properties.provisioningState') { should cmp'Succeeded' } 
  its('properties.packetCaptureDiagnosticState') { should cmp 'None' }
  its('properties.enablePrivateIpAddress') { should cmp 'false' }
  its('properties.enableBgpRouteTranslationForNat') { should cmp 'false' }
  its('properties.enableBgp') { should cmp 'false' }
  its('properties.gatewayType') { should cmp 'Vpn' }
  its('properties.activeActive') { should cmp 'false' }
  its('properties.vpnGatewayGeneration')  { should cmp 'Generation1' }
  # its('properties.ipConfigurations') { should cmp '' }
  # its('properties.natRules') { should cmp '' }
  # its('properties.bgpSettings') { should cmp '' }
end

# Need to find a solution to test these properties
# describe azure_generic_resource(resource_group: resource_group1, name: 'onpremise-lngc') do
#   its('properties.ipsecPolicies') { should cmp "DHGroup2"}
#   its('properties.ipsec_policy.ike_encryption') { should cmp"AES256"  }
#   its('properties.ipsec_policy.ike_integrity') { should cmp"SHA256" }
#   its('properties.ipsec_policy.ipsec_encryption') { should cmp"AES256" }
#   its('properties.ipsec_policy.ipsec_integrity') { should cmp"SHA256" }
#   its('properties.ipsec_policy.pfs_group') { should cmp"PFS24" }
#   its('properties.ipsec_policy.sa_datasize') { should cmp"102400000" }
#   its('properties.ipsec_policy.sa_lifetime') { should cmp"3600" }
# end
