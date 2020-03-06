#!/bin/bash
echo "                                                "
echo "############################################################################################################"
echo "                                                "
echo "Information on the program"
echo "Author:  Vasil'eva Maria"
echo "Programm name: lab.sh"
echo "This program generates the checksum of the first file using the md5 algorithm and writes it to the second file "
echo "If you want to exit write: '/'"
echo "End of the information list "
echo "                                                "
echo "############################################################################################################"
echo "                                                "
nullpath=/

echo "Current directory : "  $PWD
echo "                                                "
while [ "1" -eq "1" ]
do

        echo "Type first file path:"
        read path1

    if [ "$path1" = "$nullpath" ]
    then
            echo "You write path to exit"
        exit
    fi

     if test -f "$path1";
    then
                echo ""
                echo "md5sum of first file:"
                md5sum "$path1" | cut -d ' ' -f 1

                echo ""
                echo "Type second file path:"
                read path2
                if test -f "$path2";
                then
                        if test -s "$path2";
                        then
                                echo ""
                                echo "Write md5 sum in " $path2 "?"
                                read ANS
                                case "$ANS" in
                                        y|Y) md5sum "$path1" | cut -d ' ' -f 1 >> $path2
                                                 echo "md5sum writed in second file succesfully"
                                        ;;
                                        n|N) continue;
                                esac
                        else
                                md5sum "$path1" | cut -d ' ' -f 1  > $path2
                                echo "md5sum writed in second file succesfully"
                        fi
        echo "One more time?"
        read ONEMORETIME

        case "$ONEMORETIME" in
            y|Y) continue
                ;;
            n|N) echo "You write path to exit"
		exit;
                ;;
        esac
                else
                        >&2 echo "File does not exists" $path
                fi
    else
            >&2 echo "File does not exists" $path
    fi
done
