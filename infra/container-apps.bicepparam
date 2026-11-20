using 'main-container-apps.bicep'


// Your name, once. Change 'name' to your own name. The names below are built from it.
var name = 'fredrikr'


param registryName = 'crwaypoint${name}'
param workspaceName = 'log-waypoint-${name}'

param actionGroupName = 'ag-waypoint-${name}'
param alertEmail = readEnvironmentVariable('ALERT_EMAIL')
param pullIdentityName = 'id-waypoint-${name}'
param environmentName = 'cae-waypoint-${name}'
param containerAppName = 'ca-waypoint-${name}'
param imageTag = readEnvironmentVariable('IMAGE_TAG')

