#!/bin/bash
NUM_HAVE[0]=37
NUM_HAVE[1]=38
NUM_HAVE[2]=39
NUM_HAVE[3]=34
NUM_HAVE[4]=36
NUM_HAVE[5]=33
NUM_HAVE[6]=32
NUM_HAVE[7]=35
NUM_HAVE[8]=31
NUM_HAVE[9]=30
NUM_HAVE[10]=26
NUM_HAVE[11]=28
NUM_HAVE[12]=29
NUM_HAVE[13]=27
NUM_HAVE[14]=24
NUM_HAVE[15]=20
NUM_HAVE[16]=21
NUM_HAVE[17]=25
NUM_HAVE[18]=22
NUM_HAVE[19]=23
NUM_HAVE[20]=16
NUM_HAVE[21]=19
NUM_HAVE[22]=17
NUM_HAVE[23]=18
NUM_HAVE[24]=10
NUM_HAVE[25]=15
NUM_HAVE[26]=12
NUM_HAVE[27]=13
NUM_HAVE[28]=14
NUM_HAVE[29]=11
NUM_HAVE[30]=7
NUM_HAVE[31]=9
NUM_HAVE[32]=10
NUM_HAVE[33]=8
NUM_HAVE[34]=6
NUM_HAVE[35]=2
NUM_HAVE[36]=4
NUM_HAVE[37]=5
NUM_HAVE[38]=3
NUM_HAVE[39]=1

I=0
J=0

while test $I -lt 20
do
JUGADOR1[J]=${NUM_HAVE[I]}
I=$(($I+1))
J=$(($J+1))
done
J=0
while test $I -lt 40
do
JUGADOR2[J]=${NUM_HAVE[I]}
I=$(($I+1))
J=$(($J+1))
done

#Presentar los valores de las cartas
echo Reparto
echo -------------
echo JUGADOR 1 '|' JUGADOR 2 '|' JUGADOR 3 '|' JUGADOR 4 '|'
K=0
while test $K -lt $(($BARAJA/2))
do
    echo ${baraja[${JUGADOR1[$K]}]} '|' ${baraja[${JUGADOR2[$K]}]} '|' ${baraja[${JUGADOR3[$K]}]} '|' ${baraja[${JUGADOR4[$K]}]} '|'
    K=$(($K+1))
done
echo

exit 0
