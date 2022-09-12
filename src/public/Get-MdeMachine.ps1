<#
.SYNOPSIS
  Gets one or multiple machine objects

.DESCRIPTION
  If no parameters are specified, returns all Defender for Endpoint machines. If an ID is specified, it returns a single machine object, if the ID is found, otherwise nothing.

.NOTES
  Author: Jan-Henrik Damaschke

.EXAMPLE
  $machines = Get-MdeMachine
  
.EXAMPLE
  $machine = Get-MdeMachine -id '123'
#>

function Get-MdeMachine {
  [CmdletBinding()]
  param (
    [Parameter(ValueFromPipelineByPropertyName, ValueFromPipeline)]
    [string]
    $id
  )
  if ($id) {
    return Invoke-RetryRequest -Method Get -Uri "https://api.securitycenter.microsoft.com/api/machines/$id"
  }
  return Invoke-AzureRequest -Uri "https://api.securitycenter.microsoft.com/api/machines"
}