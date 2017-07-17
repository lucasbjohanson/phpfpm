#!/bin/bash

mapfile -t my_array < <( ps -ax | grep firefox )
counter=0
for element in "${my_array[@]}"
do

    counter=$((counter+1))

done

if [ $counter -gt 40 ]
then
    mapfile -t my_array < <( ps -ax | grep firefox )
    counter1=0
    for element in "${my_array[@]}"
    do

        if [ $counter1 -gt 10 ]
        then
            break
        fi

        pids=$(echo $element | tr " " "\n")

        for pid in $pids
        do
            echo "kill $pid"
            $( kill -9 $pid )
            break
        done

        counter=$((counter1+1))

    done
fi

