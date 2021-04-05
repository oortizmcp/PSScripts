### Just change variables $AZADOwner & $AZADGroups


# Add your User Owner ID
$AZADOwner = 'ADOwnerIDObject'

# Add the list of all the groups Objectid between "" where you want to add the owner
$AZADGroups= @("ObjectId1", "Objectid2", "Objectid3")

# For each group inside $AZADGroups, Add owner (AZADOwner) into group list 
foreach ($group in $AZADGroups) {
    Connect-AzureAD
    Add-AzureADGroupOwner -ObjectId $group -RefObjectId $AZADOwner
}

