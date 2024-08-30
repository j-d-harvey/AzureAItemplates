@description('Location for all resources')
param location string = resourceGroup().location

@description('Name of the Azure OpenAI account')
param openAiAccountName string

@description('Custom subdomain name for the Azure OpenAI account')
param customSubDomainName string = openAiAccountName

@description('SKU for the Azure OpenAI account')
param sku string = 'S0'


resource oaiAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: openAiAccountName
  location: location
  kind: 'OpenAI'
  properties: {
    customSubDomainName: customSubDomainName
    publicNetworkAccess: 'Enabled'
  }
  sku: {
    name: sku
  }
}
