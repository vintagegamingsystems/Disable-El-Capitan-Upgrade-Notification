#!/bin/bash

# Disables El Capitan Upgrade notification
# Only applies to accounts that are not the Shared or the .localized account in /Users/ directory.
# The directory ~/Library/Containers/com.apple.appstore/Data/Library/WebKit/LocalStorage/ directory must also exist.
# The https_su.itunes.app.com_0.localstorage file is expected to be found in the /private/tmp/ directory

users=$(ls /Users)

for i in $users; do 
	echo "Disabling El Capitan Upgrade Notification for user $i"
	if [ $i == "Shared" ] || [ $i == ".localized" ]
		then
		echo "Error: User $i is the Shared User or the .localized user"
	elif [ ! -d /Users/$i/Library/Containers/com.apple.appstore/Data/Library/WebKit/LocalStorage/ ]
		then
		echo "Error: The directory ~/Library/Containers/com.apple.appstore/Data/Library/WebKit/LocalStorage/ does not exist for the $i user"
	else
		sudo cp -f /private/tmp/https_su.itunes.apple.com_0.localstorage /Users/$i/Library/Containers/com.apple.appstore/Data/Library/WebKit/LocalStorage/
	fi
done
