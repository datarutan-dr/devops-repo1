@description('Region. The same as the resource group, given by main.bicep.')
param location string

@description('Name of the web app. Part of its address, so it must be unique in all of Azure.')
@minLength(2)
@maxLength(60)
param appName string

@description('Id of the plan the app runs on: the plan module\'s output.')
param appServicePlanId string

@description('Language and version, for example NODE|24-lts.')
param linuxFxVersion string

@description('Id of the Log Analytics workspace that gets the logs.')
param workspaceId string

resource appService 'Microsoft.Web/sites@2025-03-01' = {
  name: appName
  location: location
  properties: {
    serverFarmId: appServicePlanId
    httpsOnly: true
    siteConfig: {
      linuxFxVersion: linuxFxVersion
      appSettings: [
        {
          name: 'SCM_DO_BUILD_DURING_DEPLOYMENT'
          value: 'true'
        }
      ]
    }
  }
}

// Sends the app's logs to the workspace. Without it, nothing ends up there.
resource appServiceDiagnostics 'Microsoft.Insights/diagnosticSettings@2021-05-01-preview' = {
  name: 'to-workspace'
  scope: appService
  properties: {
    workspaceId: workspaceId
    logs: [
      {
        category: 'AppServiceHTTPLogs'
        enabled: true
      }
      {
        category: 'AppServiceConsoleLogs'
        enabled: true
      }
    ]
  }
}


output appServiceUrl string = 'https://${appService.properties.defaultHostName}'
