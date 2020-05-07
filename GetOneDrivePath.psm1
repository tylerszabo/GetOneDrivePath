<#
.SYNOPSIS
Gets OneDrive folder path
.DESCRIPTION
Gets the OneDrive or OneDrive for Business path from the user's registry. Defaults to personal OneDrive folder
.PARAMETER Work
Get the OneDrive for Business folder
.EXAMPLE
Get-OneDrivePath
.EXAMPLE
Get-OneDrivePath -Work
#>
function Get-OneDrivePath {
  [CmdletBinding(DefaultParameterSetName = "None")]
  param(
    [alias("Business")]
    [switch]
    $Work = $False
  )

  if ($Work) {
    return (Get-ItemPropertyValue -Path "HKCU:\Software\Microsoft\OneDrive\Accounts\Business1" -Name "UserFolder")
  } else {
    return (Get-ItemPropertyValue -Path "HKCU:\Software\Microsoft\OneDrive" -Name "UserFolder")
  }
}

Export-ModuleMember Get-OneDrivePath