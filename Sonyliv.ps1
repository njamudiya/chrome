try{
$proc = Get-Process -Name chrome -ErrorAction Stop
try{
$proc.Id |Out-File c:\Scripts\Chrome\ChromePIds.txt -ErrorAction Stop
try{
$ids = Get-Content -Path c:\Scripts\Chrome\ChromePIds.txt -ErrorAction Stop
ForEach ($id in $ids){
    try{
    Stop-Process -Id $id -Force
    }
    catch{
    Write-Host $_
    }
    }
}
catch{
Write-Host $_
}
}
catch{
Write-Host $_
}
}
catch{
Write-Host $_
}

try{
Write-host "Removing local app data."
Remove-Item 'C:\Users\User\AppData\Local\Google\Chrome\User Data' -Recurse -Force -ErrorAction Stop
}
catch{
Write-Host $_
}

try{
Remove-Item c:\Scripts\Chrome\ChromePIds.txt -Force -ErrorAction stop
}
catch{
Write-Host $_
}
try{
$cred = Import-Clixml -Path "C:\Scripts\Chrome\Cred.xml"
Start-Process "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" -Credential $cred "https://www.sonyliv.com/details/live/4867235330001/Sony-SET-HD---LIVE-Channel"
}
catch{
Write-Host $_
}
