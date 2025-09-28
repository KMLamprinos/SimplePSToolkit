Set-Location -Path $PSScriptRoot 
$actionsPath = (Get-Location).Path + "\Actions"
$logPath = $actionsPath.Replace("\Actions","\Logs")
$functionPath = $actionsPath.Replace("\Actions","\Core")
Start-Transcript -OutputDirectory $logPath -Force -Verbose
$imports = (Get-ChildItem $functionPath -filter "*.psm1").FullName
$imports | ForEach-Object{Import-Module $_ }
$main = @(
"Run Scripts ",
"Exit ")
$mainChoice = $main.indexof(($main| Out-GridView -OutputMode Single -Title "SimplePSToolkit"))
switch ($mainChoice){
0 { runSripts }
1 {exit}
default{}
}
Stop-Transcript