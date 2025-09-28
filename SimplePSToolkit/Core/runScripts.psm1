function runSripts{
$toexec = @()
(Get-ChildItem $actionsPath -Depth 1 -Filter "*.ps1") | ForEach-Object{
$flname = ($_.Name)
$fullPath = ($_.Directory.FullName)
try{
$desc = ((get-content $_.FullName -first 1)| Where-Object {$_ -match "### "}).Replace("### ","")}catch{
    $desc = " *** No Description available *** "}
$scrName = (($fullPath.Split("\")[-1]) + "\" +  $flname)
$toexec += [pscustomobject]@{
"Name" = $scrName
'Description' = $desc
'Path' = $fullPath
 }
}
If((test-path "c:\temp") -eq $false){
    New-item -Path "C:\Temp" -ItemType Directory ; write-host " Directory C:\Temp created. "}else{
    Write-host " Directory C:\Temp found "
}
$choice  = ($toexec |Select-Object Name , Description , Path ) | Out-GridView -OutputMode Multiple -Title "SimpleToolkit"
try{
$exec = $choice.path | ForEach-Object{$_+"\"+($choice.name.split("\")[-1])}}catch{Write-Host " No choice made by the user . Exiting " -ForegroundColor Black -BackgroundColor Gray}
Write-Host $exec -ForegroundColor White -BackgroundColor Green
$execDir = $choice.path
ForEach($i in $execDir){
Set-Location ($i)
$execScript = (Get-ChildItem -Filter "*.ps1").FullName 
try{Write-host ""
        Write-host " Installing " $execScript  -ForegroundColor White -BackgroundColor Green 
        powershell.exe -ep bypass -f $execScript       
        Write-host ""
        }catch{
        Write-host ""
        Write-host $execScript " not installed " -ForegroundColor Black -BackgroundColor Red 
        Write-Host $Error
        }       
        Write-host ""
        start-sleep -seconds 2
        Set-Location -Path $actionsPath
    }
}