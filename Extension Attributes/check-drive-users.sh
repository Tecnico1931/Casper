#!/bin/bash
loggedinuser="$(python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");')"

driveuser="$(/usr/bin/sqlite3 /Users/$loggedinuser/Library/Application\ Support/Google/Drive/user_default/sync_config.db  "SELECT data_value FROM data WHERE entry_key='user_email'")"

echo "<result>$driveuser</result>"
