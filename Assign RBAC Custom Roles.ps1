#Assign Custom roles
# You should grab a built in template from Azure (select a role that matches your needs as close as possible, and then edit)

# Get role for template: "Get-AzRoleDefinition <"name of built-in role you are downloading Example: Contributor">
Get-AzRoleDefinition "Contributor" | ConvertTo-Json | Out-File "C:\pathoffile\customrole-contributor.json"

# Open and edit Template on Name :
#delete the Id line on top
# Change the value on "IsCustom" to true
# Under Assignable Scopes write the subscription ID output from followed command "/subscriptions/xxxxxxx-xxxxxx-xxxxxxx-xxxxxxx"
Get-AzSubscription -SubscriptionName 'subscriptionname'

#Deploy edited json template
New-AzRoleDefinition -InputFile "C:\filepath\customrole-contributor.json"

#Validate name of custom role
Get-AzRoleDefinition | ? {$_.IsCustom -eq $true} | FT Name,IsCustom

#Assign Custom Role to user
New-AzRoleAssignment -SignInName test.user1@email.com  -RoleDefinitionName "customrole-contributor" -ResourceGroupName RGname 

# Assign Role to SP at the Subscription Level
New-AzRoleAssignment -ApplicationId 'AppidfromServicePrincipal' -Scope "/subscriptions/subid" -RoleDefinitionName 'customrole-contributor'



#Remove Role Assignment
Remove-AzRoleAssignment -SignInName alain@example.com -RoleDefinitionName "Virtual Machine Contributor" -ResourceGroupName pharma-sales

# Assign Contributor Role to SP at the Subscription Level
Get-AzRoleAssignment -RoleDefinitionName 'customrole-contributor'
Remove-AzRoleAssignment -ObjectId 'ObjectIdfrom previouscommand' -RoleDefinitionName customrole-contributor


# Delete Role Definition
Get-AzRoleDefinition | ? {$_.IsCustom -eq $true} | FT Name,IsCustom

Get-AzRoleDefinition -Name "customrole-contributor" | Remove-AzRoleDefinition



