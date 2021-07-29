param resourceGroupLocation string
param resourceGroupName string
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


module resourceGroupModule 'resourcegroup.bicep' = {
  scope: subscription()
  name: 'resourceGroupDeploy'
  params: {
    resourceGroupName: resourceGroupName
    resourceGroupLocation: resourceGroupLocation
  }
}

module serviceBusModule 'servicebus.bicep' = {
  name: 'serviceBusDeploy'
  scope: resourceGroup(resourceGroupName)
  params: {
    serviceBusName: serviceBusName
    serviceBusSkuName: serviceBusSkuName
    serviceBusSkuTier: serviceBusSkuTier
    serviceBusZoneRedundancy: serviceBusZoneRedundancy
  }
}
