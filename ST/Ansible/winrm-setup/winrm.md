Upgrading PowerShell and .NET Framework:
----------------------------------------

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$url = "https://raw.githubusercontent.com/jborean93/ansible-windows/master/scripts/Upgrade-PowerShell.ps1" ()
$file = "$env:temp\Upgrade-PowerShell.ps1"
$username = "Administrator"
$password = "Password"

(New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force

# Version can be 3.0, 4.0 or 5.1
&$file -Version 5.1 -Username $username -Password $password -Verbose


# This isn't needed but is a good security practice to complete
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force

$reg_winlogon_path = "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon"
Set-ItemProperty -Path $reg_winlogon_path -Name AutoAdminLogon -Value 0
Remove-ItemProperty -Path $reg_winlogon_path -Name DefaultUserName -ErrorAction SilentlyContinue
Remove-ItemProperty -Path $reg_winlogon_path -Name DefaultPassword -ErrorAction SilentlyContinue


WinRM Memory Hotfix:
--------------------

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$url = "https://raw.githubusercontent.com/jborean93/ansible-windows/master/scripts/Install-WMF3Hotfix.ps1"
$file = "$env:temp\Install-WMF3Hotfix.ps1"

(New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)
powershell.exe -ExecutionPolicy ByPass -File $file -Verbose


WinRM Setup:
---------------

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$url = "https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1"
$file = "$env:temp\ConfigureRemotingForAnsible.ps1"
(New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)
powershell.exe -ExecutionPolicy ByPass -File $file



winrm enumerate winrm/config/Listener


Manual:
-------

step1: generate certificate in your laptop:
-------------------------------------------
New-SelfSignedCertificate -Subject "CN=WIN2012TEST01" –DnsName "win2012test01.homelab.local","win2012test01" -CertStoreLocation “cert:\LocalMachine\My” -NotAfter (Get-Date).AddYears(5)

Note: change the win2012test01 and win2012test01.homelab.local with target machine name and fqdn

step2: 
------
open mmc, add local computer certificate in your laptop, it should appear the cert that you generate.


step3:
------
export the cert including the private key, then transfer they cert key into target machine

step1 until step3 assume that we will use self signed certificate, then on target server, you import the certificate (self sign or from bimb trusted cert) into local computer in same structure "personal".

step4:
------
assume you already import the generated cert, then check the thumprint value

ex: Thumbprint: 7489A80820541C89AB694F2318ED49C96EEF3B9D

step5:
-----
modify the script ConfigureRemotingForAnsible.ps1, override the whole the function New-LegacySelfSignedCert.
Function New-LegacySelfSignedCert {
    Param (
        [string]$SubjectName,
        [int]$ValidDays = 1095
    )

    return "7489A80820541C89AB694F2318ED49C96EEF3B9D"
}

step6: 
-----
you run again the ./ConfigureRemotingForAnsible.ps1 -EnableCredSSP -DisableBasicAuth



