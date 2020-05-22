#Deploying ARM templates

#Create variables
$rg = New-AzResourceGroup -Name ARM-rg -Location 'East US 2'
$template = "C:\edityourpath\template.json"
$parameter = "C:\edityourpath\parameters.json"

#Deploy template
New-AzResourceGroupDeployment `
-Name deployment1 `
-ResourceGroupName ARM-RG `
-TemplateFile $template `
-TemplateParameterFile $parameter
