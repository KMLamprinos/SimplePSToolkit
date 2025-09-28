### Add your description in this line			                                                         #<------ Description for GUI.
$presetFile = ((Get-ChildItem).Directory.Parent.FullName).Replace("\Actions","\Core\presets.psm1")       #<------ location of Presets.psm1
Import-Module $presetFile                                                                                #<------ Importing Presets module
try{                                                                                                     #<------ Keep this line for logging.Enter your code below.

    
    
    
    Start-Process -FilePath (files("Your Executable name"))  -ArgumentList " Your arguments (eg silent install argument)" -Wait    # Example 
    
    
    
    
    Write-host  $exePath.Name + "Installed ."  -ForegroundColor White -BackgroundColor Green              #<------ Keep this line for logging.Enter your code above.
}catch{Write-Host "An error occured. Exiting." -ForegroundColor Black -BackgroundColor Red}               #<------ Keep this line for logging