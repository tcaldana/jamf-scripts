#!/bin/bash

#  ad_account_remover.sh
#  Created by tcaldana on 5/31/19.

# Removes any account and home directories from target with UUID above 1000. Adjust as needed. Should NOT delete local accounts.
# Scope with caution!

for ad_user in `dscl . list /Users UniqueID | awk '$2 > 1000 {print $1}'`; do

#echo "Deleting the AD user accounts"
#echo "Deleting "$ad_user" AD account"
dscl . -delete /Users/$ad_user

#echo "Deleting AD user home directories"
#echo "Deleting "$ad_user"'s home directory"
rm -rf /Users/$ad_user

echo "Done!"
done

/usr/bin/find /private/var/db/dslocal/nodes/Default/sharepoints -name "*" -type f -delete
/usr/bin/find /private/var/db/dslocal/nodes/Default/groups -name "com.apple.sharepoint*" -type f -delete

exit 0
