#!/bin/bash
declare -A OROS
declare -A ESPADAS
declare -A BASTOS
declare -A COPAS
FINAL=0
PIVOTE_SUPO=10
PIVOTE_INFO=1
PIVOTE_SUPO=20
PIVOTE_INFO=11
PIVOTE_SUPO=30
PIVOTE_INFO=21
PIVOTE_SUPO=40
PIVOTE_INFO=31
RONDA=1
TURNO=1
SUM_TURNO=0
BARAJA=40
ENCUENTRA=0

while test $FINAL -eq 0
do
    clear  #Limpio la pantalla
    I=0
    echo "                  RONDA $RONDA                  "
    echo --------------------------------------------------
    echo "  JUGADOR  1  '|'  JUGADOR  2  '|'  JUGADOR  3  "
    echo --------------------------------------------------
    echo "  POS.- CARTA '|'  POS.- CARTA '|'  POS.- CARTA "
    while test $I -le CARTAS3
    do 
        echo "$I.- ${JUGADOR1[$I]}   $I.- ${JUGADOR2[$I]}   $I.- ${JUGADOR3[$I]}"
    done

    #Turno JUGADOR 1
    if test $TURNO -eq 1
    then
    if test $RONDA -eq 1
    then
    echo COMIENZA EL 5 DE OROS
    I=0
    J=0
    FIND=0
    while test $I -lt $CARTA1 -a $FIND -eq 1
    do
        if test ${JUGADOR1[$I]} -eq 5
        then
        ORO[4]=${JUGADOR1[$I]}
        PIVOTE_INFO=3
        PIVOTE_SUPO=6
        J=$I
        while test $J -lt $CARTA1
        do
            JUGADOR1[$J]=${JUGADOR1[$(($J+1))]}
        done
        TURNO=2
        SUM_TURNO=$(($SUM_TURNO+1))
        CARTA1=$(($CARTA1-1))
        FIND=1
        fi
    done
    else

    fi
    fi

    #Turno JUGADOR 2
    if test $TURNO -eq 2
    then
    if test $RONDA -eq 1
    then
    echo COMIENZA EL 5 DE OROS
    I=0
    J=0
    FIND=0
    while test $I -lt $CARTA2 -a $FIND -eq 1
    do
        if test ${JUGADOR2[$I]} -eq 5
        then
        ORO[4]=${JUGADOR2[$I]}
        PIVOTE_INFO=3
        PIVOTE_SUPO=6
        J=$I
        while test $J -lt $CARTA2
        do
            JUGADOR2[$J]=${JUGADOR2[$(($J+1))]}
        done
        TURNO=3
        SUM_TURNO=$(($SUM_TURNO+1))
        CARTA2=$(($CARTA2-1))
        FIND=1
        fi
    done
    else

    fi
    fi

    #Turno JUGADOR 3
    if test $TURNO -eq 3
    then
    if test $RONDA -eq 1
    then
    echo COMIENZA EL 5 DE OROS
    I=0
    J=0
    FIND=0
    while test $I -lt $CARTA3 -a $FIND -eq 1
    do
        if test ${JUGADOR3[$I]} -eq 5
        then
        ORO[4]=${JUGADOR3[$I]}
        PIVOTE_INFO=3
        PIVOTE_SUPO=6
        J=$I
        while test $J -lt $CARTA3
        do
            JUGADOR3[$J]=${JUGADOR3[$(($J+1))]}
        done
        TURNO=1
        SUM_TURNO=$(($SUM_TURNO+1))
        CARTA3=$(($CARTA3-1))
        FIND=1
        fi
    done
    else

    fi
    fi

    if test $CARTA1 -eq 0
    then
        SALIR=1
    fi

    if test $CARTA2 -eq 0
    then
        SALIR=1
    fi

    if test $CARTA3 -eq 0
    then
        SALIR=1
    fi

    if test $SUM_TURNO -eq 3
    then 
    RONDA=$(($RONDA+1))
    SUM_TURNO=0
    fi
done
exit 0
