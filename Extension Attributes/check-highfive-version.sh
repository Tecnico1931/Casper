#!/bin/bash
loggedInUser="$(/usr/bin/python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");')"

# Check user
if [ "$loggedInUser" = "oscadmin" ]; then
    echo "Admin logged in, Dont run Login Script"
    exit 0
elif [ "$loggedInUser" = "" ]; then
    echo "no user logged in, Dont run Login Script"
    exit 0
else
    echo "standard user logged in, run Login Script"
fi

HIGHFIVE="/Users/${loggedInUser}/Applications/HighfiveApp.app/Contents/Info.plist"

RESULT="Not Installed"


if [ -f "$HIGHFIVE" ] ; then
	RESULT=$(/usr/bin/defaults read "$HIGHFIVE" CFBundleVersion)
fi

echo "<string>$RESULT</string>"
