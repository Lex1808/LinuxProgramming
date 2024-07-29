#!/usr/bin/bash

echo -n "Enter password: "
read secret

while [ "$secret" != "secret" ]; do
    echo "Sorry, try again"
    echo -n "Enter password: "
    read secret
done

until who | grep "$USER" > /dev/null
do
    sleep 60
done

echo -e '\a'
echo "**** $USER has just logged in ****"

echo -n "Is it morning?(Enter yes or no): "
read timeofday

case "$timeofday" in
    yes | Yes | y | Y) echo "Good Morning, $USER";;
    no | No | n | N  ) echo "Good Afternoon, $USER";;
    *                ) echo "Sorry, $USER. Answer are not recognized"
                       echo "Please answer yes or no"
                       ;;
esac

exit 0
