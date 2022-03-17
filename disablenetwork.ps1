$name = Get-NetIPAddress | ?{ $_.AddressFamily -eq "IPv4" -and (($_.IPAddress -notmatch "192.") -and ($_.IPAddress -notmatch "10.") -and ($_.IPAddress -notmatch "127."))} 

disable-netadapter -Name $Name.InterfaceAlias -Confirm:$False

$internal = Get-NetIPAddress | ?{ $_.AddressFamily -eq "IPv4" -and (($_.IPAddress -match "192.") -or ($_.IPAddress -match "10.") -and ($_.IPAddress -notmatch "127."))}

netsh interface ipv4 set subinterface $internal.InterfaceAlias mtu=1450 store=persistent