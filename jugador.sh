#!/bin/bash

baraja[0]=" "
#Palo de oros
baraja[1]="As de Oros    "
baraja[2]="2 de Oros     "
baraja[3]="3 de Oros     "
baraja[4]="4 de Oros     "
baraja[5]="5 de Oros     "
baraja[6]="6 de Oros     "
baraja[7]="7 de Oros     "
baraja[8]="J de Oros     "
baraja[9]="C de Oros     "
baraja[10]="K de Oros    "

#Palo de espadas
baraja[11]="As de Espadas"
baraja[12]="2 de Espadas "
baraja[13]="3 de Espadas "
baraja[14]="4 de Espadas "
baraja[15]="5 de Espadas "
baraja[16]="6 de Espadas "
baraja[17]="7 de Espadas "
baraja[18]="J de Espadas "
baraja[19]="C de Espadas "
baraja[20]="K de Espadas "

#Palo de bastos
baraja[21]="As de Bastos "
baraja[22]="2 de Bastos  "
baraja[23]="3 de Bastos  "
baraja[24]="4 de Bastos  "
baraja[25]="5 de Bastos  "
baraja[26]="6 de Bastos  "
baraja[27]="7 de Bastos  "
baraja[28]="J de Bastos  "
baraja[29]="C de Bastos  "
baraja[30]="K de Bastos  "

#Palo de copas
baraja[31]="As de Copas  "
baraja[32]="2 de Copas   "
baraja[33]="3 de Copas   "
baraja[34]="4 de Copas   "
baraja[35]="5 de Copas   "
baraja[36]="6 de Copas   "
baraja[37]="7 de Copas   "
baraja[38]="J de Copas   "
baraja[39]="C de Copas   "
baraja[40]="K de Copas   "

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
#FIN del codigo de generacion

I=0
J=0
CARTA1=20
CARTA2=20
CARTAS=0
declare -A JUGADOR1
declare -A JUGADOR2
while test $I -lt $CARTA1
do
	JUGADOR1[$J]=${NUMEROS[$I]}
	I=$(($I+1))
	J=$(($J+1))
done
J=0
CARTAS=$(($CARTA1+$CARTA2))
while test $I -lt $CARTAS
do
	JUGADOR2[$J]=${NUMEROS[$I]}
	I=$(($I+1))
    J=$(($J+1))
done
unset NUMEROS

#Declaramos los vectores de los palos
declare -A OROS
OROS[0]=0
OROS[1]=0
OROS[2]=0
OROS[3]=0
OROS[4]=0
OROS[5]=0
OROS[6]=0
OROS[7]=0
OROS[8]=0
OROS[9]=0

declare -A ESPADAS
ESPADAS[0]=0
ESPADAS[1]=0
ESPADAS[2]=0
ESPADAS[3]=0
ESPADAS[4]=0
ESPADAS[5]=0
ESPADAS[6]=0
ESPADAS[7]=0
ESPADAS[8]=0
ESPADAS[9]=0

declare -A BASTOS
BASTOS[0]=0
BASTOS[1]=0
BASTOS[2]=0
BASTOS[3]=0
BASTOS[4]=0
BASTOS[5]=0
BASTOS[6]=0
BASTOS[7]=0
BASTOS[8]=0
BASTOS[9]=0

declare -A COPAS
COPAS[0]=0
COPAS[1]=0
COPAS[2]=0
COPAS[3]=0
COPAS[4]=0
COPAS[5]=0
COPAS[6]=0
COPAS[7]=0
COPAS[8]=0
COPAS[9]=0

FINAL=0
PIVOTE_SUPO=4
PIVOTE_INFO=4
PIVOTE_SUPE=4
PIVOTE_INFE=4
PIVOTE_SUPB=4
PIVOTE_INFB=4
PIVOTE_SUPC=4
PIVOTE_INFC=4
RONDA=1
TURNO=1
SUM_TURNO=0
BARAJA=40
FIND=0
VACIO=0
CARTA1=20
CARTA2=20
CARTA3="*"
CARTA4="*"
GANADOR=0
PUNTUAJE=0

#Determinamos quien comienza echando
    I=0
    EMPIEZA1=0
    while test $I -lt $CARTA1 -a $EMPIEZA1 -eq 0
    do 
        if test ${JUGADOR1[$I]} -eq 5
        then
            EMPIEZA1=1
        fi
        I=$(($I+1))
    done

    if test $EMPIEZA1 -eq 1
    then
        TURNO=1;
    fi

    I=0
    EMPIEZA2=0
    while test $I -lt $CARTA2 -a $EMPIEZA2 -eq 0
    do 
        if test ${JUGADOR2[$I]} -eq 5
        then
            EMPIEZA2=1
        fi
        I=$(($I+1))
    done

    if test $EMPIEZA2 -eq 1
    then
        TURNO=2;
    fi

FINAL=0 
while test $FINAL -eq 0
do
    #Presentacion de los datos
    I=0
    echo "----------------------------------------"
    echo "            RONDA $RONDA"
    echo "----------------------------------------"
    echo "POS |   JUGADOR 1   |    JUGADOR 2"
    while test $I -lt 20
    do
        echo "$I     ${baraja[${JUGADOR1[$I]}]}   ${baraja[${JUGADOR2[$I]}]}"
        I=$(($I+1))
    done
    I=0
    echo "----------------------------------------------"
    echo "    OROS    |    ESPADAS    |    BASTOS    |    COPAS"
    while test $I -lt 10
    do
        echo " ${baraja[${OROS[$I]}]}   ${baraja[${ESPADAS[$I]}]}   ${baraja[${BASTOS[$I]}]}   ${baraja[${COPAS[$I]}]}"
        I=$(($I+1))
    done
    echo "----------------------------------------------"
    echo

    #TURNO DEL JUGADOR 1
    if test $TURNO -eq 1
    then
        echo "Turno del JUGADOR 1"
        if test ${OROS[4]} -eq 0
        then
            echo "Comienza el 5 de Oros"
            OROS[4]=5
            I=0
            FIND=0
            #Buscamos el 5 de oros en el vector de los JUGADOR 1
            while test $I -lt $CARTA1 -a $FIND -eq 0
            do
                if test ${JUGADOR1[$I]} -eq 5
                then
                    FIND=1
                fi
                I=$(($I+1))
            done

            J=$(($I-1))
            if test $FIND -eq 1
            then
                while test $I -lt $CARTA1
                do
                    JUGADOR1[$J]=${JUGADOR1[$I]}
                    I=$(($I+1))
                    J=$(($J+1))
                done
            fi
            JUGADOR1[$CARTA1]=0
            CARTA1=$(($CARTA1-1))
            SUM_TURNO=$(($SUM_TURNO+1))
            TURNO=2
        else
            SALIR=0
            while test $SALIR -eq 0
            do
                echo "Elige la posicion de la carta que quieres echar:"
                read INDICE
                I=0
                FIND=0
                while test $I -lt 20 -a $FIND -eq 0
                do
                    if test $I -eq ${JUGADOR1[$INDICE]}
                    then
                        FIND=1
                    fi
                    I=$(($I+1))
                done

                if test $FIND -eq 1
                then
                    if test ${JUGADOR1[$INDICE]} -ge 1 -a ${JUGADOR1[$INDICE]} -le 10
                    then
                        echo es de oros
                    fi

                    if test ${JUGADOR1[$INDICE]} -ge 11 -a ${JUGADOR1[$INDICE]} -le 20
                    then
                        echo es de espadas
                    fi

                    if test ${JUGADOR1[$INDICE]} -ge 21 -a ${JUGADOR1[$INDICE]} -le 30
                    then
                        echo es de bastos
                    fi

                    if test ${JUGADOR1[$INDICE]} -ge 31 -a ${JUGADOR1[$INDICE]} -le 40
                    then
                        echo es de copas
                    fi
                    
                    TURNO=2
                    SALIR=1
                fi
            done
        fi
    fi

    #Turno del JUGADOR 2
    if test $TURNO -eq 2
    then
        echo Turno del JUGADOR 2
        if test ${OROS[4]} -eq 0
        then
            echo "Comienza el 5 de Oros"
            OROS[4]=5
            I=0
            FIND=0
            #Buscamos el 5 de oros en el vector de los JUGADOR 1
            while test $I -lt $CARTA2 -a $FIND -eq 0
            do
                if test ${JUGADOR2[$I]} -eq 5
                then
                    FIND=1
                fi
                I=$(($I+1))
            done

            #Redimensionamos el vector
            J=$(($I-1))
            if test $FIND -eq 1
            then
                while test $I -lt $CARTA2
                do
                    JUGADOR2[$J]=${JUGADOR2[$I]}
                    I=$(($I+1))
                    J=$(($J+1))
                done
            fi
            JUGADOR1[$CARTA1]=0
            CARTA2=$(($CARTA2-1))
            SUM_TURNO=$(($SUM_TURNO+1))
            TURNO=1
        else
            echo aaaaaaaaaa
        fi
        TURNO=1
    fi

    if test $SUM_TURNO -eq 2
    then
        RONDA=$(($RONDA+1))
    fi

    if test $CARTA1 -eq 0;
    then
        PUNTUAJE=$CARTA2
        FINAL=1
    fi

    if test $CARTA2 -eq 0;
    then
        PUNTUAJE=$CARTA1
        FINAL=1
    fi
done

exit 0