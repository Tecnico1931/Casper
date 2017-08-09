#!/usr/bin/env bash
loggedinuser="$(/usr/bin/python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");')"

 # Check user
if [ "$loggedinuser" = "admin" ]; then
    echo "Admin logged in, Dont run Login Script"
    exit 0
elif [ "$loggedinuser" = "" ]; then
    echo "no user logged in, Dont run Login Script"
    exit 0
else
    echo "standard user logged in, run Login Script"
fi

brew='/usr/local/bin/brew'

if [[ -f $brew ]]
then echo "<result>$(su - "$(stat -f '%Su' $brew)" -c "$brew list" | tr '\t\n' ' ')</result>"
else echo "<result>Not Installed</result>"
fi
