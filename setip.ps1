$internal = Get-NetIPAddress | ?{ $_.AddressFamily -eq "IPv4" -and (($_.IPAddress -match "192.") -or ($_.IPAddress -match "10.") -and ($_.IPAddress -notmatch "127."))}

netsh interface ipv4 set subinterface $internal.InterfaceAlias mtu=1450 store=persistent

$newaddress = "192.168.150.23"
$mask = "255.255.255.0"
$gateway = "192.168.150.1"
$dns = "192.168.150.1" 

netsh interface ipv4 set address $internal.InterfaceIndex static $newaddress $mask $gateway

netsh interface ipv4 set dnsservers Ethernet static $dns
