// Stage 0 baseline. This intentionally provisions only shared monitoring.
// Foundry, Azure OpenAI and AI Search will be added as separately reviewed modules.
targetScope = 'resourceGroup'

@description('Azure deployment location. Use a region where required services are available.')
param location string = resourceGroup().location

@description('Short lowercase environment identifier.')
@allowed([
  'dev'
  'test'
  'prod'
])
param environment string = 'dev'

@description('Lowercase alphanumeric project identifier used in resource names.')
@minLength(3)
@maxLength(16)
param projectName string = 'aidevsupport'

@description('Tags applied to provisioned resources.')
param tags object = {
  project: 'azure-ai-developer-support-platform'
  environment: environment
  managedBy: 'bicep'
}

resource logAnalytics 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: 'log-${projectName}-${environment}'
  location: location
  tags: tags
  properties: {
    sku: {
      name: 'PerGB2018'
    }
    retentionInDays: 30
  }
}

resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: 'appi-${projectName}-${environment}'
  location: location
  tags: tags
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalytics.id
  }
}

output logAnalyticsResourceId string = logAnalytics.id
output applicationInsightsResourceId string = applicationInsights.id
