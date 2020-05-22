#Assign Custom roles
# You should grab a built in template from Azure (select a role that matches your needs as close as possible, and then edit)

# Get role for template: "Get-AzRoleDefinition <"name of built-in role you are downloading Example: Contributor">
Get-AzRoleDefinition "Contributor" | ConvertTo-Json | Out-File "C:\pathwhereyouwanttosaveit\ContributorRole.json"

# Open and edit Template on Name :
#delete the Id line on top
# Change the value on "IsCustom" to true
# Under Assignable Scopes write the subscription ID output from followed command "/subscriptions/xxxxxxx-xxxxxx-xxxxxxx-xxxxxxx"
Get-AzSubscription -SubscriptionName 'yoursubscriptionnamehere'

#Deploy edited json template
New-AzRoleDefinition -InputFile "C:\pathofeditedtemplate\ContributorRole.json"

#Validate name of custom role
Get-AzRoleDefinition | ? {$_.IsCustom -eq $true} | FT Name,IsCustom

#Assign Custom Role to user
New-AzRoleAssignment -SignInName test.user1@email.com  -RoleDefinitionName "role name defined previously" -ResourceGroupName RGname 



#Remove Role Assignment
Remove-AzRoleAssignment -SignInName alain@example.com -RoleDefinitionName "Virtual Machine Contributor" -ResourceGroupName pharma-sales

# Delete Role Definition
Get-AzRoleDefinition | ? {$_.IsCustom -eq $true} | FT Name,IsCustom

Get-AzRoleDefinition -Name "Test VM Contrib Role" | Remove-AzRoleDefinition



