# Create a policy with Visual Studio code and deploy template
$cred = get-credential
$rg= Get-AzResourceGroup -Name RoleAssignment-rg
$subscription = Get-AzSubscription -SubscriptionName 'yoursubnamehere' 
Connect-AzAccount -Credential $cred -Tenant $subscription.TenantId

$policy = New-AzPolicyDefinition -Name "Name of your policy" -policy "C:\path\buildingpolicy.json"

New-AzPolicyAssignment -Name "Name of your policy assignment" -PolicyDefinition $policy -Scope $rg.ResourceId -location 'centralus'