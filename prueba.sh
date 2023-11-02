#!/bin/bash

baraja[0]=" "
#Palo de oros
baraja[1]="As de Oros"
baraja[2]="2 de Oros"
baraja[3]="3 de Oros"
baraja[4]="4 de Oros"
baraja[5]="5 de Oros"
baraja[6]="6 de Oros"
baraja[7]="7 de Oros"
baraja[8]="J de Oros"
baraja[9]="C de Oros"
baraja[10]="K de Oros"

#Palo de espadas
baraja[11]="As de Espadas"
baraja[12]="2 de Espadas"
baraja[13]="3 de Espadas"
baraja[14]="4 de Espadas"
baraja[15]="5 de Espadas"
baraja[16]="6 de Espadas"
baraja[17]="7 de Espadas"
baraja[18]="J de Espadas"
baraja[19]="C de Espadas"
baraja[20]="K de Espadas"

#Palo de bastos
baraja[21]="As de Bastos"
baraja[22]="2 de Bastos"
baraja[23]="3 de Bastos"
baraja[24]="4 de Bastos"
baraja[25]="5 de Bastos"
baraja[26]="6 de Bastos"
baraja[27]="7 de Bastos"
baraja[28]="J de Bastos"
baraja[29]="C de Bastos"
baraja[30]="K de Bastos"

#Palo de copas
baraja[31]="As de Copas"
baraja[32]="2 de Copas"
baraja[33]="3 de Copas"
baraja[34]="4 de Copas"
baraja[35]="5 de Copas"
baraja[36]="6 de Copas"
baraja[37]="7 de Copas"
baraja[38]="J de Copas"
baraja[39]="C de Copas"
baraja[40]="K de Copas"
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

I=0
while test $I -lt $BARAJA
do
    echo ${NUMEROS[$I]}
    I=$(($I+1))
done

I=0
J=0
declare -A JUGADOR1
while test $I -le $(($BARAJA/2))
do
    JUGADOR1[$J]=${NUMEROS[$I]}
    I=$(($I+1))
    J=$(($J+1))
    CARTA1=$(($CARTA1+1))
done

    clear  #Limpio la pantalla
    I=0
    echo "                  RONDA $RONDA                  "
    echo ------------------------------------------------------
    echo "  JUGADOR  1  '|'  JUGADOR  2  '|'  JUGADOR  3  "
    echo ------------------------------------------------------
    echo "  POS.- CARTA '|'  POS.- CARTA '|'  POS.- CARTA "
    while test $I -lt $CARTA1
    do 
        echo "$I.- ${baraja[${JUGADOR1[$I]}]}   $I.- ${baraja[${JUGADOR2[$I]}]}   $I.- ${baraja[${JUGADOR3[$I]}]}"
	I=$(($I+1))
    done
    echo ------------------------------------------------------
    echo "  OROS   '|'   ESPADAS   '|'   BASTOS   '|'   COPAS"
    I=0
    while test $I -le 10
    do 
        echo "${baraja[${OROS[$I]}]}   ${${baraja[${ESPADAS[$I]}]}    ${${baraja[${BASTOS[$I]}]}   ${${baraja[${COPAS[$I]}]}"
	    I=$(($I+1))
    done
exit 0
