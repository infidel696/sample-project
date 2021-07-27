param serviceBusName string
@allowed([
  'Basic'
  'Standard'
  'Premium'
])
param serviceBusSkuName string
@allowed([
  'Basic'
  'Standard'
  'Premium'
])
param serviceBusSkuTier string
param serviceBusZoneRedundancy bool

resource serviceBus 'Microsoft.ServiceBus/namespaces@2021-06-01-preview' = {
  name: serviceBusName
  location: resourceGroup().location
  tags: {}
  sku: {
    name: serviceBusSkuName
    tier: serviceBusSkuTier
  }
  properties: {
    zoneRedundant: serviceBusZoneRedundancy
  }
}

resource serviceBusAuthorizationRule 'Microsoft.ServiceBus/namespaces/AuthorizationRules@2021-06-01-preview' = {
  name: '${serviceBusName}/RootManageSharedAccessKey'
  properties: {
    rights: [
      'Listen'
      'Manage'
      'Send'
    ]
  }
}

resource serviceBusNetworkRuleSets 'Microsoft.ServiceBus/namespaces/networkRuleSets@2021-06-01-preview' = {
  name: '${serviceBusName}/default'
  properties: {
    defaultAction: 'Deny'
    virtualNetworkRules: [
      
    ]
    ipRules: [
      
    ]
  }
}
