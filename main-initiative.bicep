targetScope = 'managementGroup'
// Validation: az deployment mg create --management-group-id Root --name RT-Deploy-Diagnostics-LogAnalytics-policyset --location eastus --template-file .\main-initiative.bicep --what-if --verbose
// Deployment: az deployment mg create --management-group-id Root --name RT-Deploy-Diagnostics-LogAnalytics-policyset --location eastus --template-file .\main-initiative.bicep --verbose   

// param mgName string = 'orgid-sandboxes'
// param policySetDefinitionId string = 'Deploy-Diagnostics-LogAnalytics'
// param targetSubId string = 'e25024e7-c4a5-4883-80af-9e81b2f8f689'
// param targetRgName string = 'rgp-iac'
// param deploymentName string = 'policySetDeployment'
metadata name = 'ALZ Bicep - Custom Policy Defitions at Management Group Scope'
metadata description = 'This policy definition is used to deploy custom policy definitions at management group scope'

@sys.description('The management group scope to which the policy definitions are to be created at.')
param parTargetManagementGroupId string = 'Root' // CognexRT-Revenue-Apps' ID = Root

// @sys.description('Set Parameter to true to Opt-out of deployment telemetry')
// param parTelemetryOptOut bool = false

var varTargetManagementGroupResourceId = tenantResourceId('Microsoft.Management/managementGroups', parTargetManagementGroupId)

// This variable contains a number of objects that load in the custom Azure Policy Set/Initiative Defintions that are provided as part of the ESLZ/ALZ reference implementation - this is automatically created in the file 'infra-as-code\bicep\modules\policy\lib\policy_set_definitions\_policySetDefinitionsBicepInput.txt' via a GitHub action, that runs on a daily schedule, and is then manually copied into this variable.
var varCustomPolicySetDefinitionsArray = [
  {
    name: 'Deploy-Diagnostics-LogAnalytics'
    libSetDefinition: loadJsonContent('./lib/policy_set_definitions/policy_set_definition_es_Deploy-Diagnostics-LogAnalytics.json')
    libSetChildDefinitions: [
      {
        definitionReferenceId: 'ACRDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-ACR'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.ACRDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'AKSDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/6c66c325-74c8-42fd-a286-a74b0e2939d8'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.AKSDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'AnalysisServiceDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-AnalysisService'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.AnalysisServiceDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'APIforFHIRDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-ApiForFHIR'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.APIforFHIRDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'APIMgmtDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-APIMgmt'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.APIMgmtDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'ApplicationGatewayDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-ApplicationGateway'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.ApplicationGatewayDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'AppServiceDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-WebServerFarm'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.AppServiceDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'AppServiceWebappDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-Website'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.AppServiceWebappDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'AutomationDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-AA'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.AutomationDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'AVDScalingPlansDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-AVDScalingPlans'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.AVDScalingPlansDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'BastionDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-Bastion'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.BastionDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'BatchDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/c84e5349-db6d-4769-805e-e14037dab9b5'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.BatchDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'CDNEndpointsDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-CDNEndpoints'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.CDNEndpointsDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'CognitiveServicesDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-CognitiveServices'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.CognitiveServicesDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'CosmosDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-CosmosDB'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.CosmosDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'DatabricksDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-Databricks'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.DatabricksDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'DataExplorerClusterDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-DataExplorerCluster'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.DataExplorerClusterDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'DataFactoryDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-DataFactory'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.DataFactoryDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'DataLakeAnalyticsDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-DLAnalytics'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.DataLakeAnalyticsDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'DataLakeStoreDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/d56a5a7c-72d7-42bc-8ceb-3baf4c0eae03'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.DataLakeStoreDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'EventGridSubDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-EventGridSub'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.EventGridSubDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'EventGridTopicDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-EventGridTopic'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.EventGridTopicDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'EventHubDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/1f6e93e8-6b31-41b1-83f6-36e449a42579'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.EventHubDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'EventSystemTopicDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-EventGridSystemTopic'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.EventSystemTopicDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'ExpressRouteDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-ExpressRoute'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.ExpressRouteDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'FirewallDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-Firewall'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.FirewallDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'FrontDoorDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-FrontDoor'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.FrontDoorDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'FunctionAppDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-Function'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.FunctionAppDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'HDInsightDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-HDInsight'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.HDInsightDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'IotHubDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-iotHub'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.IotHubDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'KeyVaultDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/bef3f64c-5290-43b7-85b0-9b254eef4c47'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.KeyVaultDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'LoadBalancerDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-LoadBalancer'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.LoadBalancerDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'LogAnalyticsDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-LogAnalytics'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.LogAnalyticsDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'LogicAppsISEDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-LogicAppsISE'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.LogicAppsISEDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'LogicAppsWFDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/b889a06c-ec72-4b03-910a-cb169ee18721'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.LogicAppsWFDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'MariaDBDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-MariaDB'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.MariaDBDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'MediaServiceDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-MediaService'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.MediaServiceDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'MlWorkspaceDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-MlWorkspace'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.MlWorkspaceDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'MySQLDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-MySQL'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.MySQLDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'NetworkNICDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-NIC'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.NetworkNICDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'NetworkPublicIPNicDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/752154a7-1e0f-45c6-a880-ac75a7e4f648'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.NetworkPublicIPNicDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'NetworkSecurityGroupsDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-NetworkSecurityGroups'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.NetworkSecurityGroupsDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'PostgreSQLDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-PostgreSQL'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.PostgreSQLDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'PowerBIEmbeddedDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-PowerBIEmbedded'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.PowerBIEmbeddedDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'RecoveryVaultDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/c717fb0c-d118-4c43-ab3d-ece30ac81fb3'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.RecoveryVaultDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'RedisCacheDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-RedisCache'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.RedisCacheDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'RelayDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-Relay'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.RelayDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'SearchServicesDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/08ba64b8-738f-4918-9686-730d2ed79c7d'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.SearchServicesDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'ServiceBusDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/04d53d87-841c-4f23-8a5b-21564380b55e'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.ServiceBusDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'SignalRDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-SignalR'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.SignalRDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'SQLDatabaseDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/b79fa14e-238a-4c2d-b376-442ce508fc84'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.SQLDatabaseDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'SQLElasticPoolsDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-SQLElasticPools'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.SQLElasticPoolsDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'SQLMDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-SQLMI'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.SQLMDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'StorageAccountBlobServicesDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/b4fe1a3b-0715-4c6c-a5ea-ffc33cf823cb'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.StorageAccountBlobServicesDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'StorageAccountDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/59759c62-9a22-4cdf-ae64-074495983fef'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.StorageAccountDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'StorageAccountFileServicesDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/25a70cc8-2bd4-47f1-90b6-1478e4662c96'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.StorageAccountFileServicesDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'StorageAccountQueueServicesDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/7bd000e3-37c7-4928-9f31-86c4b77c5c45'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.StorageAccountQueueServicesDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'StorageAccountTableServicesDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/2fb86bf3-d221-43d1-96d1-2434af34eaa0'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.StorageAccountTableServicesDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'StreamAnalyticsDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/237e0f7e-b0e8-4ec4-ad46-8c12cb66d673'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.StreamAnalyticsDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'TimeSeriesInsightsDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-TimeSeriesInsights'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.TimeSeriesInsightsDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'TrafficManagerDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-TrafficManager'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.TrafficManagerDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'VirtualMachinesDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-VM'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.VirtualMachinesDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'VirtualNetworkDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-VirtualNetwork'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.VirtualNetworkDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'VMSSDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-VMSS'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.VMSSDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'VNetGWDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-VNetGW'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.VNetGWDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'VWanS2SVPNGWDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-VWanS2SVPNGW'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.VWanS2SVPNGWDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'WVDAppGroupDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-WVDAppGroup'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.WVDAppGroupDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'WVDHostPoolsDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-WVDHostPools'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.WVDHostPoolsDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'WVDWorkspaceDeployDiagnosticLogDeployLogAnalytics'
        definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-WVDWorkspace'
        definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.WVDWorkspaceDeployDiagnosticLogDeployLogAnalytics.parameters
        definitionGroups: []
      }
    ]
  }
]

// Policy Set/Initiative Definition Parameter Variables

var varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Deploy-Diagnostics-LogAnalytics.parameters.json')

// Customer Usage Attribution Id
// var varCuaid = '2b136786-9881-412e-84ba-f4c2822e1ac9'

resource resPolicySetDefinitions 'Microsoft.Authorization/policySetDefinitions@2021-06-01' = [for policySet in varCustomPolicySetDefinitionsArray: {
  name: policySet.libSetDefinition.name
  properties: {
    description: policySet.libSetDefinition.properties.description
    displayName: policySet.libSetDefinition.properties.displayName
    metadata: policySet.libSetDefinition.properties.metadata
    parameters: policySet.libSetDefinition.properties.parameters
    policyType: policySet.libSetDefinition.properties.policyType
    policyDefinitions: [for policySetDef in policySet.libSetChildDefinitions: {
      policyDefinitionReferenceId: policySetDef.definitionReferenceId
      policyDefinitionId: policySetDef.definitionId
      parameters: policySetDef.definitionParameters
      groupNames: policySetDef.definitionGroups
    }]
    policyDefinitionGroups: policySet.libSetDefinition.properties.policyDefinitionGroups
  }
}]

// Optional Deployment for Customer Usage Attribution
// module modCustomerUsageAttribution '../../../CRML/customerUsageAttribution/cuaIdManagementGroup.bicep' = if (!parTelemetryOptOut) {
//   #disable-next-line no-loc-expr-outside-params //Only to ensure telemetry data is stored in same location as deployment. See https://github.com/Azure/ALZ-Bicep/wiki/FAQ#why-are-some-linter-rules-disabled-via-the-disable-next-line-bicep-function for more information
//   name: 'pid-${varCuaid}-${uniqueString(deployment().location)}'
//   params: {}
// }
