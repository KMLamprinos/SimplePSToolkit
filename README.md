# SimplePSToolKit

 A simple Powershell script manager aiming to simplify our scripting daily routines,<br>
 using Out-GridView as GUI. 

 *Curently in Beta stage*
 
# How to use 

 1. Download and unzip latest version
    
 2. Create a folder in .\Actions and copy your script. (eg. .\Actions\YourScript\Script.ps1) <br>
    *In case of executable file/files , create also a folder named "files" in your script folder 
    and copy your files . (eg .\YourScript\files\Setup.exe)
    
 3. In order to have full functionality (eg. Description , Logging) , you need to add the following
    lines of code in your script.
    
   At the top : <br><br>
      <code>### Add your description in this line			                                                                
            $presetFile = ((Get-ChildItem).Directory.Parent.FullName).Replace("\Actions","\Core\presets.psm1")        
            Import-Module $presetFile                                                                                 
            try{</code>
            <br>
            <br>
            <br>
   And , at the bottom of your script : <br><br>
  <code>}catch{Write-Host "An error occured. Exiting." -ForegroundColor Black -BackgroundColor Red}</code>
  <br><br>
  Check also Actions\App_Example
 

# A few words about the inner workings of the toolkit

 When the main.ps1 is executed , it starts a scan in \Core folder for modules and imports them. A second scan is made , 
but this time for powershell scripts located in \Actions folder . <br>
*You could put a script in \Actions folder and still be able to execute it , without putting it inside a folder.Not advised though,
as it might lead to unpredictable behavior

 Useful function : files()<br>
In it's current state the toolkit exposes a function for use in your scripts (more of them to come , in later versions). 
You can use the files() function to execute a file from your files folder . Behind the scenes , the funtion will scan 
for your executable. 
<br><br>
Example usage : 
<br><br>
<code>$Executable = files("setup")</code>

# To Do List

 Import / Export of scripts and files <br>
 Mount of image files , such as Iso/Wim/Vhd/Vhdx <br>
 Mount a network path <br>
 Detailed descriptions <br>
 Cleanup and optimization <br>
 
