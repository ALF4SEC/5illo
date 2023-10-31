#!/bin/bash
BARAJA=40
FIND=0
I=0
J=0
declare -A NUMEROS
while test $I -lt $BARAJA
do
    NUM=$((1+ $RANDOM % 40))
    FIND=0
    J=0
    while test $J -lt $I -a $FIND -eq 0
    do
        if test ${NUMEROS[$J]} -eq $NUM
        then
        FIND=1
        else
	    FIND=0
        J=$(($J+1))
        fi
    done

    if test $FIND -eq 0
    then
    NUMEROS[$I]=$NUM
    I=$(($I+1))
    fi
done

while test $I -lt $BARAJA
do
    echo ${NUMEROS[$I]}
    I=$(($I+1))
done

I=0
declare -A JUGADOR1
while test $I -le $(($BARAJA/2))
do
    JUGADOR1[$I]=${NUMEROS[$I]}
    I=$(($I+1))
done
   
echo ${!JUGADOR1[*]}
echo ${JUGADOR1[*]}
exit 0
