::Start
@echo off
:: Starting Critical Processes if stoped 
net start "Windows Firewall"
net start "Windows Update"
net start Workstation
net start "DHCP Client"
net start "DNS Client"
net start "Print Spooler"
net start Themes
::Checking Disk
chkdsk /r
chkdsk /s
::viruscan
sfc /scannow
::Looking up system health
DISM /Online /Cleanup /CheckHealth
DISM /Online /Cleanup /ScanHealth
::Restoring System Health
DISM /Online /Cleanup /RestoreHealth
::Scanning after restoring
sfc /scannow
::Starting Complete Firewall if stopped
netsh firewall set allprofiles state on
::Trying to see the main router health 
ping 127.0.0.1
tracert 127.0.0.1 -d
ping 192.168.1.1
tracert 192.168.1.1 -d
::Looking NetStatus
netstat
netstat -allprofiles
netstat -o
::Printing for external hacked connections
route print
::Finding Main Virus
tasklist | find script
::End
