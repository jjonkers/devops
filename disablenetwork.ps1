$name = Get-NetIPAddress | ?{ $_.AddressFamily -eq "IPv4" -and (($_.IPAddress -notmatch "192.") -and ($_.IPAddress -notmatch "10.") -and ($_.IPAddress -notmatch "127."))} 

disable-netadapter -Name $Name.InterfaceAlias -Confirm:$False
