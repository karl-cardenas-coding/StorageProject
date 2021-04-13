#!/bin/bash

USEDKB=`df -k | awk '{s += \$3} END {print s}'`
FREEKB=`df -k | awk '{s += \$4} END {print s}'`

USEDGB=`expr $USEDKB / 1000000`
FREEGB=`expr $FREEKB / 1000000`

echo You are using $USEDGB GB and have $FREEGB GB available.


echo -n "Would you like to see how your storage is being distributed? (Y/N) ";
read REPLY;

{

if [[ $(echo ${REPLY} | tr a-z A-Z) == "Y" ]]

then
  df

fi
}





