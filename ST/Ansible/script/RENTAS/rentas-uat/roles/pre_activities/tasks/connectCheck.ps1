Param([string]$testList)


$test = Get-Content $testList

Foreach ($t in $test){
  $source = $t.Split(':')[0]
  $port = $t.Split(':')[1]
  
  Write-Host "Connecting to $source on port $port"

    $tcp = New-Object System.Net.Sockets.TcpClient
    $tcp.ReceiveTimeout = 500
    $tcp.SendTimeout = 500

    if (!$tcp.ConnectAsync($source, $port).Wait(1000))
      {
        Write-Host "$source`:$port connection test failed!`n"
      }
    else     
      {   
        Write-Host "$source`:$port connection test OK`n"
      }

}
