[CmdletBinding()]
Param(
    [Parameter(Mandatory=$True)]
    [string]$resourceGroupName,
    [Parameter(Mandatory=$True)]
    [string]$networkSecurityGroupName,
    [Parameter(Mandatory=$True)]
    [string]$securityRuleName,
    [Parameter(Mandatory=$True)]
    [string]$allowOrDeny,
    [Parameter(Mandatory=$True)]
    [int]$priority
)

$nsg = Get-AzNetworkSecurityGroup -ResourceGroupName $resourceGroupName -Name $networkSecurityGroupName

if($allowOrDeny -eq "Allow") {
    $ip = Invoke-RestMethod http://ipinfo.io/json | Select -exp ip;

    $nsg | Add-AzNetworkSecurityRuleConfig -Name $securityRuleName -Access $allowOrDeny -Protocol Tcp -SourcePortRange * -DestinationPortRange 9000 -SourceAddressPrefix $ip -Priority $priority -Direction Inbound -DestinationAddressPrefix *
}
else{
    Remove-AzNetworkSecurityRuleConfig -Name $securityRuleName -NetworkSecurityGroup $nsg 
}
$nsg | Set-AzNetworkSecurityGroup