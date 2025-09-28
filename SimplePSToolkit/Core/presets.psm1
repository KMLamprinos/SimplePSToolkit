function files($executable){
$filesPath = ((Get-Location).Path) -Replace("\Scripts","\Files")
$execPath = ((Get-ChildItem $filesPath -Depth 1).FullName | where-object {$_ -match $executable})
return $execPath
}
