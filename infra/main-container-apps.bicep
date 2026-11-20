@description('Region. The same as the resource group, unless you give another.')
param location string = resourceGroup().location

@description('Name of the container registry. Letters and digits only, unique in all of Azure.')
param registryName string

@description('Name of the Log Analytics workspace.')
param workspaceName string

@description('Name of the action group that gets the alerts.')
param actionGroupName string

@description('Where alerts are sent.')
param alertEmail string

@description('Name of the identity the container app pulls its image with.')
param pullIdentityName string

@description('Name of the Container Apps environment.')
param environmentName string

@description('Name of the container app. At most 32 characters.')
param containerAppName string

@description('The image tag: the commit the image was built from.')
param imageTag string

@description('Region for Container Apps: the same as the rest, unless that region has no room.')
param containerAppsLocation string = location


module containerRegistry 'modules/container-registry.bicep' = {
  name: 'container-registry'
  params: {
    location: location
    registryName: registryName
  }
}

module pullIdentity 'modules/pull-identity.bicep' = {
  name: 'pull-identity'
  params: {
    location: location
    identityName: pullIdentityName
  }
}

module logAnalytics 'modules/log-analytics.bicep' = {
  name: 'log-analytics'
  params: {
    location: location
    workspaceName: workspaceName
  }
}


module alerts 'modules/alerts.bicep' = {
  name: 'alerts'
  params: {
    location: location
    workspaceId: logAnalytics.outputs.workspaceId
    actionGroupName: actionGroupName
    alertEmail: alertEmail
  }
}


module containerApp 'modules/container-app.bicep' = {
  name: 'container-app'
  params: {
    location: containerAppsLocation
    environmentName: environmentName
    containerAppName: containerAppName
    registryLoginServer: containerRegistry.outputs.loginServer
    pullIdentityId: pullIdentity.outputs.pullIdentityId
    imageTag: imageTag
  }
}

output registryLoginServer string = containerRegistry.outputs.loginServer
output pullIdentityPrincipalId string = pullIdentity.outputs.pullIdentityPrincipalId
output containerAppUrl string = containerApp.outputs.containerAppUrl

