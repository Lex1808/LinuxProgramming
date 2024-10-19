#!/usr/bin/bash

echo "Do you want archive(1) or unarchive(2): "
read choose

case "$choose" in
        1 )
                echo "Enter archive name: "
                read archiveName
                echo "Enter target dir: "
                read targetDir

                if [ ! -d "$targetDir" ]; then
                        echo "Target file not exist"
                        exit 1
                fi
                if tar -czvf "$archiveName" "$targetDir"; then
                        echo "The $targetDir has been succesfull archivate"
                        ls -l
                else
                        echo "Archivate failed"
                        exit 1
                fi
                ;;
        2 )
                echo "Enter archive name to unarchivate"
                read archiveName

                if tar -xzvf "$archiveName"; then
                        echo "The $archiveName has been unarchivate in current directory"
                        ls -l
                else
                        echo "Failed unarchivate"
                        exit 1
                fi
                ;;
        * )
                echo "Failed argument. Pres 1 or 2"
                exit 1
esac

exit 0
