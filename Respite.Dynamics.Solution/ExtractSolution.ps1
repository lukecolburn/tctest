param([string]$userName,
[string]$password,
[string]$crmUrl = "https://escrmt1.crm.dynamics.com")

$gScriptPath = $MyInvocation.MyCommand.Path
$rootFolder = (get-item $gScriptPath).Directory.parent.FullName
$scriptPath = $rootFolder + "\lib\xrm-ci-framework\ExtractCustomizations.ps1"

$solutionPackager = $rootFolder + "\lib\xrm-ci-framework\SolutionPackager.exe"
$solutionPackager = "`"$solutionPackager`""
$solutionFilesFolder = $rootFolder + "\Respite.Dynamics.Solution\extract"
$solutionFilesFolder = "`"$solutionFilesFolder`""
$solutionName = "RespiteCare"
$connectionString = "`"AuthType=Office365;Username=$userName; Password=$password;Url=$crmUrl`""

$argumentList = "-solutionPackager $solutionPackager -solutionFilesFolder $solutionFilesFolder -solutionName $solutionName -connectionString $connectionString -TreatPackWarningsAsErrors 0"
Invoke-Expression "& `"$scriptPath`" $argumentList"