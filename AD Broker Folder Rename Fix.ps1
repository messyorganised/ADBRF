$userFolders = Get-ChildItem C:\users\ -Directory

function AADBPRENAME{

    $aadBrokerPluginPath = "C:\users\$selectedUserFolder\AppData\Local\Packages\Microsoft.AAD.BrokerPlugin_cw5n1h2txyewy"
    Write-Host "The AAD Broker Plugin path for the selected user is: $aadBrokerPluginPath"   "`n"
    if (Test-Path -Path $aadBrokerPluginPath) {
        Rename-Item -Path $aadBrokerPluginPath -NewName "${aadBrokerPluginPath}.old"
        Write-Host "Folder renamed to: ${aadBrokerPluginPath}.old"  "`n"
        }
    else {
        Write-Host "Folder not found: $aadBrokerPluginPath"  "`n"
    }
}

function MACRENAME {
    $MACPath = "C:\users\$selectedUserFolder\AppData\Local\Packages\Microsoft.AAD.BrokerPlugin_cw5n1h2txyewy"
    Write-Host "The Microsoft Accouns Control path for the selected user is: $MACPath"   "`n"
    if (Test-Path -Path $MACPath) {
        Rename-Item -Path $MACPath -NewName "${$MACPath}.old"
        Write-Host "Folder renamed to: ${$MACPath}.old"  "`n"
    } 
    else {
        Write-Host "Folder not found: $MACPath"  "`n"
    }
}

function ALLFIXES {
    AADBPRENAME -Wait
    MACRENAME
}

# Get and display user folders with a numeric choice
for ($i = 0; $i -lt $userFolders.Count; $i++) {
    Write-Host "$($i + 1): $($userFolders[$i].Name)"
}

# User selects a folder
$choice = Read-Host "Enter the number of the user account"
if ($choice -le 0 -or $choice -gt $userFolders.Count) {
    Write-Host "Invalid choice. Exiting script."  "`n"
    exit
}
$selectedUserFolder = $userFolders[$choice - 1].Name


Write-Host "Welcome to the AIO AAD Broker Fix Tool. Please select what you would like to do with your selected user.
1= AAD Broker Folder Rename 
2= MAC Folder Rename
3= All listed updates
"
$selection = Read-Host
switch ($selection) {
    '1' { AADBPRENAME }
    '2' { ACRENAME }
    '3' { ALLFIXES }
    default { Write-Host "No valid options selected. Closing Puller."   "`n" }
}