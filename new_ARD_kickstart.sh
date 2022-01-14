kickstart="/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart" 
privs="-DeleteFiles -ControlObserve -TextMessages -OpenQuitApps -GenerateReports -RestartShutDown -SendFiles -ChangeSettings" 

targetUser="username"

dseditgroup -o edit -a "$targetUser" -t user com.apple.access_ssh

"$kickstart" -activate -configure -allowAccessFor -specifiedUsers

"$kickstart" -configure -access -on -privs "$privs" -users "$targetUser"
