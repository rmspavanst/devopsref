Install below cmd on awx_web and awx_task or ansible server 

pip3 install ptwinrm



In Windows Server:
------------------

PSVersionTable.PSVersion


open windows PowerShell ISE--->select view --> show script page----> paste below script and run

$url = "https://raw.githubusercontent.com/jborean93/ansible-windows/master/scripts/Upgrade-PowerShell.ps1"
$file = "$env:temp\Upgrade-PowerShell.ps1"
$username = "pdmskul"
$password = "Adm!n123"

(New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force

# Version can be 3.0, 4.0 or 5.1
&$file -Version 5.1 -Username $username -Password $password -Verbose

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$url = "https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1"
$file = "$env:temp\ConfigureRemotingForAnsible.ps1"

(New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)

powershell.exe -ExecutionPolicy ByPass -File $file

winrm enumerate winrm/config/Listener




[win] #This is the group name
10.170.1.107

[win:vars] # These are the group variables
ansible_user=pdmskul
ansible_password="Adm!n123"
ansible_port=5986
ansible_connection=winrm
ansible_winrm_scheme=https
ansible_winrm_server_cert_validation=ignore
ansible_winrm_kerberos_delegation=true
