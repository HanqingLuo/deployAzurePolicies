param managementGroupId string
param policySetDefinitionId string

resource policyAssignment 'Microsoft.Authorization/policyAssignments@2023-04-01' = {
  name: guid(managementGroupId, policySetDefinitionId)
  properties: {
    displayName: 'Deploy-Diagnostics-LogAnalytics-Assignment'
    policyDefinitionId: policySetDefinitionId
  }
}
