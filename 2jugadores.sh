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

#generar numeros aleatorios
#Generamos un vector desordenado con valores del 1 al 40, ambos inclusive
BARAJA=40
FIND=0		#Es una flag que si se encuentra el repetido, se levanta e interrumpe el bucle
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
CARTAS=$CARTA1
while test $I -le $CARTAS
do
	JUGADOR1[$J]=${NUMEROS[$I]}
	I=$(($I+1))
	J=$(($J+1))
done
J=0
CARTAS=$(($CARTAS+$CARTA2))
while test $I -le $CARTAS
do
	JUGADOR2[$J]=${NUMEROS[$I]}
	I=$(($I+1))
    J=$(($J+1))
done
unset NUMEROS

#Jugador1
declare -A OROS
declare -A ESPADAS
declare -A BASTOS
declare -A COPAS
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

while test $FINAL -eq 0
do
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
    while test $I -le 10
    do 
        echo "${baraja[${OROS[$I]}]}   ${baraja[${ESPADAS[$I]}]}    ${baraja[${BASTOS[$I]}]}   ${baraja[${COPAS[$I]}]}"
        I=$(($I+1))
    done


    #Turno JUGADOR 1
    if test $TURNO -eq 1
    then
        I=0
        VACIO=0
        while test $I -lt 10 -a $VACIO -eq 0
        do
            if test ${ORO[$I]} -ne 0  ${ESPADAS[$I]} -ne 0 && ${BASTOS[$I]} -ne 0 && ${COPAS[$I]} -ne 0
            then
               VACIO=1
            fi
            I=$(($I+1))
        done

        if test $VACIO -eq 0 
        then
            echo COMIENZA EL 5 DE OROS
            I=0
            J=0
            FIND=0
            PASAR=0
            while test $I -lt $CARTA1 -a $FIND -eq 0
            do
                if test ${JUGADOR1[$I]} -eq 5
                then
                    ORO[4]=${JUGADOR1[$I]}
                    PIVOTE_INFO=4
                    PIVOTE_SUPO=4
                    J=$I
                    while test $J -lt $CARTA1
                    do
                        JUGADOR1[$J]=${JUGADOR1[$(($J+1))]}
                    done
                    TURNO=2
                    SUM_TURNO=$(($SUM_TURNO+1))
                    CARTA1=$(($CARTA1-1))
                    FIND=1
                else
                    I=$(($I+1))
                fi
            done
        else
            PUEDE=0
            I=0
            while test $I -lt $CARTA1 && $PUEDE -eq 0
            do
            #Comprobacion que se puede echar carta 
            if test ${JUGADOR1[$I]} -ge 1 && ${JUGADOR1[$I]} -le 10
            then
                if test ${OROS[4]} -ne 0
                then
                    if test ${JUGADOR1[$I]} -gt ${OROS[$PIVOTE_SUPO]} && ${JUGADOR1[$I]} -eq $((${OROS[$PIVOTE_SUPO]}+1)) || ${JUGADOR1[$I]} -lt ${OROS[$PIVOTE_INFO]} && ${JUGADOR1[$I]} -eq $((${OROS[$PIVOTE_INFO]}-1))
                    then
                        PUEDE=1
                    else
                        I=$(($I+1))
                    fi
                else
                    if test ${JUGADOR1[$I]} -eq 5
                    then
                        PUEDE=1
                    else
                        I=$(($I+1))
                    fi
                fi
            fi

            if test ${JUGADOR1[$I]} -ge 11 && ${JUGADOR1[$I]} -le 20
            then
                if test ${ESPADAS[4]} -ne 0
                then
                    if test ${JUGADOR1[$I]} -gt ${ESPADAS[$PIVOTE_SUPOE]} && ${JUGADOR1[$I]} -eq $((${ESPADAS[$PIVOTE_SUPE]}+1)) || ${JUGADOR1[$I]} -lt ${ESPADAS[$PIVOTE_INFE]} && ${JUGADOR1[$I]} -eq $((${ESPADAS[$PIVOTE_INFE]}-1))
                    then
                        PUEDE=1
                    else
                        I=$(($I+1))
                    fi
                else
                    if test ${JUGADOR1[$I]} -eq 15
                    then
                        PUEDE=1
                    else
                        I=$(($I+1))
                    fi
                fi
            fi

            if test ${JUGADOR1[$I]} -ge 21 && ${JUGADOR1[$I]} -le 30
            then
                if test ${BASTOS[4]} -ne 0
                then
                    if test ${JUGADOR1[$I]} -gt ${BASTOS[$PIVOTE_SUPB]} && ${JUGADOR1[$I]} -eq $((${BASTOS[$PIVOTE_SUPB]}+1)) || ${JUGADOR1[$I]} -lt ${BASTOS[$PIVOTE_INFB]} && ${JUGADOR1[$I]} -eq $((${BASTOS[$PIVOTE_INFB]}-1))
                    then
                        PUEDE=1
                    else
                        I=$(($I+1))
                    fi
                else
                    if test ${JUGADOR1[$I]} -eq 25
                    then
                        PUEDE=1
                    else
                        I=$(($I+1))
                    fi
                fi
            fi

            if test ${JUGADOR1[$I]} -ge 31 && ${JUGADOR1[$I]} -le 40
            then
                if test ${COPAS[4]} -ne 0
                then
                    if test ${JUGADOR1[$I]} -gt ${COPAS[$PIVOTE_SUPC]} && ${JUGADOR1[$I]} -eq $((${COPAS[$PIVOTE_SUPC]}+1)) || ${JUGADOR1[$I]} -lt ${COPAS[$PIVOTE_INFC]} && ${JUGADOR1[$I]} -eq $((${COPAS[$PIVOTE_INFC]}-1))
                    then
                        PUEDE=1
                    else
                        I=$(($I+1))
                    fi
            else
                if test ${JUGADOR1[$I]} -eq 35
                then
                    PUEDE=1
                else
                    I=$(($I+1))
                fi
            fi
        fi
        TURNO=2
        PASAR=1
        done

        while test $CORRECTO -eq 0 && $PASAR -ne 1
        do
        echo Dame el indice de la carta que quieres echar
        read INDICE
        I=0
        FIND=0
        while test $I -lt $CARTA1 && $FIND -eq 0
        do
            if test $I -eq $INDICE
            then
                FIND=1
            else
                I=$(($I+1))
            fi
        done

        if test $FIND -eq 1
        then
            if test ${JUGADOR1[$I]} -ge 1 && ${JUGADOR1[$I]} -le 10
            then
                if test ${OROS[4]} -ne 0
                then
                    if test ${JUGADOR1[$I]} -gt ${OROS[$PIVOTE_SUPO]} && ${JUGADOR1[$I]} -eq $((${OROS[$PIVOTE_SUPO]}+1)) 
                    then
                        PIVOTE_SUPO=$(($PIVOTE_SUPO+1))
                        OROS[$PIVOTE_SUPO]=${JUGADOR1[$I]}
                        while test $I -lt $CARTA1
                        do
                            JUGADOR1[$I]=${JUGADOR1[$(($I+1))]}
                        done
                        CARTA1=$(($CARTA1-1))
                        TURNO=2
                        CORRECTO=1
                    fi
                    if test ${JUGADOR1[$I]} -lt ${OROS[$PIVOTE_INFO]} && ${JUGADOR1[$I]} -eq $((${OROS[$PIVOTE_INFO]}-1))
                    then
                        PIVOTE_SUPO=$(($PIVOTE_SUPO-1))
                        OROS[$PIVOTE_INFO]=${JUGADOR1[$I]}
                        while test $I -lt $CARTA1
                        do
                            JUGADOR1[$I]=${JUGADOR1[$(($I+1))]}
                        done
                        CARTA1=$(($CARTA1-1))
                        TURNO=2
                        CORRECTO=1
                    fi
                fi
            fi

            if test ${JUGADOR1[$I]} -ge 11 && ${JUGADOR1[$I]} -le 20
            then
                if test ${ESPADAS[4]} -ne 0
                then
                    if test ${JUGADOR1[$I]} -gt ${ESPADAS[$PIVOTE_SUPOE]} && ${JUGADOR1[$I]} -eq $((${ESPADAS[$PIVOTE_SUPE]}+1))
                    then
                        PIVOTE_SUPE=$(($PIVOTE_SUPE+1))
                        ESPADAS[$PIVOTE_SUPE]=${JUGADOR1[$I]}
                        while test $I -lt $CARTA1
                        do
                            JUGADOR1[$I]=${JUGADOR1[$(($I+1))]}
                        done
                        CARTA1=$(($CARTA1-1))
                        TURNO=2
                        CORRECTO=1  
                    fi
                    if test ${JUGADOR1[$I]} -lt ${ESPADAS[$PIVOTE_INFE]} && ${JUGADOR1[$I]} -eq $((${ESPADAS[$PIVOTE_INFE]}-1))
                    then 
                        PIVOTE_SUPE=$(($PIVOTE_SUPE-1))
                        ESPADAS[$PIVOTE_INFE]=${JUGADOR1[$I]}
                        while test $I -lt $CARTA1
                        do
                            JUGADOR1[$I]=${JUGADOR1[$(($I+1))]}
                        done
                        CARTA1=$(($CARTA1-1))
                        TURNO=2
                        CORRECTO=1
                    fi
                else
                    if test ${JUGADOR1[$I]} -eq 15
                    then
                        ESPADAS[4]=${JUGADOR1[$I]}
                        while test $I -lt $CARTA1
                        do
                            JUGADOR1[$I]=${JUGADOR1[$(($I+1))]}
                        done
                        CARTA1=$(($CARTA1-1))
                        TURNO=2
                        CORRECTO=1
                    fi
                fi    
            fi

            if test ${JUGADOR1[$I]} -ge 21 && ${JUGADOR1[$I]} -le 30
            then
                if test ${BASTOS[4]} -ne 0
                then
                    if test ${JUGADOR1[$I]} -gt ${BASTOS[$PIVOTE_SUPB]} && ${JUGADOR1[$I]} -eq $((${BASTOS[$PIVOTE_SUPB]}+1))
                    then
                        PIVOTE_SUPB=$(($PIVOTE_SUPB+1))
                        BASTOS[$PIVOTE_SUPB]=${JUGADOR1[$I]}
                        while test $I -lt $CARTA1
                        do
                            JUGADOR1[$I]=${JUGADOR1[$(($I+1))]}
                        done
                        CARTA1=$(($CARTA1-1))
                        TURNO=2
                        CORRECTO=1  
                    fi
                    if test ${JUGADOR1[$I]} -lt ${BASTOS[$PIVOTE_INFB]} && ${JUGADOR1[$I]} -eq $((${BASTOS[$PIVOTE_INFB]}-1))
                    then
                        PIVOTE_SUPB=$(($PIVOTE_SUPB-1))
                        BASTOS[$PIVOTE_INFB]=${JUGADOR1[$I]}
                        while test $I -lt $CARTA11
                        do
                            JUGADOR1[$I]=${JUGADOR1[$(($I+1))]}
                        done
                        CARTA1=$(($CARTA1-1))
                        TURNO=2
                        CORRECTO=1
                    fi
                else
                    if test ${JUGADOR1[$I]} -eq 25
                    then
                        BASTOS[4]=${JUGADOR1[$I]}
                        while test $I -lt $CARTA1
                        do
                            JUGADOR1[$I]=${JUGADOR1[$(($I+1))]}
                        done
                        CARTA1=$(($CARTA1-1))
                        TURNO=2
                        CORRECTO=1
                    fi
                fi
            fi
        

            if test ${JUGADOR1[$I]} -ge 31 && ${JUGADOR1[$I]} -le 40
            then
                if test ${COPAS[4]} -ne 0
                then
                    if test ${JUGADOR1[$I]} -gt ${COPAS[$PIVOTE_SUPC]} && ${JUGADOR1[$I]} -eq $((${COPAS[$PIVOTE_SUPC]}+1)) 
                    then
                        PIVOTE_SUPC=$(($PIVOTE_SUPC+1))
                        COPAS[$PIVOTE_SUPC]=${JUGADOR1[$I]}
                        while test $I -lt $CARTA1
                        do
                            JUGADOR1[$I]=${JUGADOR1[$(($I+1))]}
                        done
                        CARTA1=$(($CARTA1-1))
                        TURNO=2
                        CORRECTO=1
                    fi
                    if test ${JUGADOR1[$I]} -lt ${COPAS[$PIVOTE_INFC]} && ${JUGADOR1[$I]} -eq $((${COPAS[$PIVOTE_INFC]}-1))
                    then
                        PIVOTE_SUPC=$(($PIVOTE_SUPC-1))
                        COPAS[$PIVOTE_INFB]=${JUGADOR1[$I]}
                        while test $I -lt $CARTA1
                        do
                            JUGADOR1[$I]=${JUGADOR1[$(($I+1))]}
                        done
                        CARTA1=$(($CARTA1-1))
                        TURNO=2
                        CORRECTO=1
                    fi  
                else
                    if test ${JUGADOR1[$I]} -eq 35
                    then
                        COPAS[4]=${JUGADOR1[$I]}
                        while test $I -lt $CARTA1
                        do
                            JUGADOR1[$I]=${JUGADOR1[$(($I+1))]}
                        done
                        CARTA1=$(($CARTA1-1))
                        TURNO=2
                        CORRECTO=1
                    fi
                fi
            fi
        fi    
        done
    fi
    fi

    if test $TURNO -eq 2
    then
        I=0
        VACIO=0
        while test $I -lt 10 && $VACIO -eq 0
        do
            if test ${ORO[$I]} -eq 0 && ${ESPADAS[$I]} -eq 0 && ${BASTOS[$I]} -eq 0 && ${COPAS[$I]} -eq 0
            then
                I=$(($I+1))
            else
                VACIO=1
            fi
        done

        if test $VACIO -eq 0 
        then
            echo COMIENZA EL 5 DE OROS
            I=0
            J=0
            FIND=0
            PASAR=0
            while test $I -lt $CARTA2 && $FIND -eq 1
            do
                if test ${JUGADOR2[$I]} -eq 5
                then
                    ORO[4]=${JUGADOR2[$I]}
                    PIVOTE_INFO=4
                    PIVOTE_SUPO=4
                    J=$I
                    while test $J -lt $CARTA2
                    do
                        JUGADOR2[$J]=${JUGADOR2[$(($J+1))]}
                    done
                    TURNO=1
                    SUM_TURNO=$(($SUM_TURNO+1))
                    CARTA2=$(($CARTA2-1))
                    FIND=1
                else
                    I=$(($I+1))
                fi
            done
        else
            PUEDE=0
            I=0
            while test $I -lt $CARTA2 && $PUEDE -eq 0
            do
            #Comprobacion que se puede echar carta 
            if test ${JUGADOR2[$I]} -ge 1 && ${JUGADOR2[$I]} -le 10
            then
                if test ${OROS[4]} -ne 0
                then
                    if test ${JUGADOR2[$I]} -gt ${OROS[$PIVOTE_SUPO]} && ${JUGADOR2[$I]} -eq $((${OROS[$PIVOTE_SUPO]}+1)) || ${JUGADOR2[$I]} -lt ${OROS[$PIVOTE_INFO]} && ${JUGADOR2[$I]} -eq $((${OROS[$PIVOTE_INFO]}-1))
                    then
                        PUEDE=1
                    else
                        I=$(($I+1))
                    fi
                else
                    if test ${JUGADOR2[$I]} -eq 5
                    then
                        PUEDE=1
                    else
                        I=$(($I+1))
                    fi
                fi
            fi

            if test ${JUGADOR2[$I]} -ge 11 && ${JUGADOR2[$I]} -le 20
            then
                if test ${ESPADAS[4]} -ne 0
                then
                    if test ${JUGADOR2[$I]} -gt ${ESPADAS[$PIVOTE_SUPOE]} && ${JUGADOR2[$I]} -eq $((${ESPADAS[$PIVOTE_SUPE]}+1)) || ${JUGADOR2[$I]} -lt ${ESPADAS[$PIVOTE_INFE]} && ${JUGADOR2[$I]} -eq $((${ESPADAS[$PIVOTE_INFE]}-1))
                    then
                        PUEDE=1
                    else
                        I=$(($I+1))
                    fi
                else
                    if test ${JUGADOR2[$I]} -eq 15
                    then
                        PUEDE=1
                    else
                        I=$(($I+1))
                    fi
                fi
            fi

            if test ${JUGADOR2[$I]} -ge 21 && ${JUGADOR2[$I]} -le 30
            then
                if test ${BASTOS[4]} -ne 0
                then
                    if test ${JUGADOR2[$I]} -gt ${BASTOS[$PIVOTE_SUPB]} && ${JUGADOR2[$I]} -eq $((${BASTOS[$PIVOTE_SUPB]}+1)) || ${JUGADOR2[$I]} -lt ${BASTOS[$PIVOTE_INFB]} && ${JUGADOR2[$I]} -eq $((${BASTOS[$PIVOTE_INFB]}-1))
                    then
                        PUEDE=1
                    else
                        I=$(($I+1))
                    fi
                else
                    if test ${JUGADOR2[$I]} -eq 25
                    then
                        PUEDE=1
                    else
                        I=$(($I+1))
                    fi
                fi
            fi

            if test ${JUGADOR2[$I]} -ge 31 && ${JUGADOR2[$I]} -le 40
            then
                if test ${COPAS[4]} -ne 0
                then
                    if test ${JUGADOR2[$I]} -gt ${COPAS[$PIVOTE_SUPC]} && ${JUGADOR2[$I]} -eq $((${COPAS[$PIVOTE_SUPC]}+1)) || ${JUGADOR2[$I]} -lt ${COPAS[$PIVOTE_INFC]} && ${JUGADOR2[$I]} -eq $((${COPAS[$PIVOTE_INFC]}-1))
                    then
                        PUEDE=1
                    else
                        I=$(($I+1))
                    fi
            else
                if test ${JUGADOR2[$I]} -eq 35
                then
                    PUEDE=1
                else
                    I=$(($I+1))
                fi
            fi
        fi
        TURNO=1
        PASAR=1
        done

        while test $CORRECTO -eq 0 && $PASAR -ne 1
        do
        echo Dame el indice de la carta que quieres echar
        read INDICE
        I=0
        FIND=0
        while test $I -lt $CARTA2 && $FIND -eq 0
        do
            if test $I -eq $INDICE
            then
                FIND=1
            else
                I=$(($I+1))
            fi
        done

        if test $FIND -eq 1
        then
            if test ${JUGADOR2[$I]} -ge 1 && ${JUGADOR2[$I]} -le 10
            then
                if test ${OROS[4]} -ne 0
                then
                    if test ${JUGADOR2[$I]} -gt ${OROS[$PIVOTE_SUPO]} && ${JUGADOR2[$I]} -eq $((${OROS[$PIVOTE_SUPO]}+1)) 
                    then
                        PIVOTE_SUPO=$(($PIVOTE_SUPO+1))
                        OROS[$PIVOTE_SUPO]=${JUGADOR2[$I]}
                        while test $I -lt $CARTA2
                        do
                            JUGADOR2[$I]=${JUGADOR2[$(($I+1))]}
                        done
                        CARTA2=$(($CARTA2-1))
                        TURNO=1
                        CORRECTO=1
                    fi
                    if test ${JUGADOR2[$I]} -lt ${OROS[$PIVOTE_INFO]} && ${JUGADOR2[$I]} -eq $((${OROS[$PIVOTE_INFO]}-1))
                    then
                        PIVOTE_SUPO=$(($PIVOTE_SUPO-1))
                        OROS[$PIVOTE_INFO]=${JUGADOR2[$I]}
                        while test $I -lt $CARTA2
                        do
                            JUGADOR2[$I]=${JUGADOR2[$(($I+1))]}
                        done
                        CARTA2=$(($CARTA2-1))
                        TURNO=1
                        CORRECTO=1
                    fi
                fi
            fi

            if test ${JUGADOR2[$I]} -ge 11 && ${JUGADOR2[$I]} -le 20
            then
                if test ${ESPADAS[4]} -ne 0
                then
                    if test ${JUGADOR2[$I]} -gt ${ESPADAS[$PIVOTE_SUPOE]} && ${JUGADOR2[$I]} -eq $((${ESPADAS[$PIVOTE_SUPE]}+1))
                    then
                        PIVOTE_SUPE=$(($PIVOTE_SUPE+1))
                        ESPADAS[$PIVOTE_SUPE]=${JUGADOR2[$I]}
                        while test $I -lt $CARTA2
                        do
                            JUGADOR2[$I]=${JUGADOR2[$(($I+1))]}
                        done
                        CARTA2=$(($CARTA2-1))
                        TURNO=1
                        CORRECTO=1  
                    fi
                    if test ${JUGADOR2[$I]} -lt ${ESPADAS[$PIVOTE_INFE]} && ${JUGADOR2[$I]} -eq $((${ESPADAS[$PIVOTE_INFE]}-1))
                    then 
                        PIVOTE_SUPE=$(($PIVOTE_SUPE-1))
                        ESPADAS[$PIVOTE_INFE]=${JUGADOR2[$I]}
                        while test $I -lt $CARTA2
                        do
                            JUGADOR2[$I]=${JUGADOR2[$(($I+1))]}
                        done
                        CARTA2=$(($CARTA2-1))
                        TURNO=1
                        CORRECTO=1
                    fi
                else
                    if test ${JUGADOR2[$I]} -eq 15
                    then
                        ESPADAS[4]=${JUGADOR2[$I]}
                        while test $I -lt $CARTA2
                        do
                            JUGADOR2[$I]=${JUGADOR2[$(($I+1))]}
                        done
                        CARTA2=$(($CARTA2-1))
                        TURNO=1
                        CORRECTO=1
                    fi
                fi    
            fi

            if test ${JUGADOR2[$I]} -ge 21 && ${JUGADOR2[$I]} -le 30
            then
                if test ${BASTOS[4]} -ne 0
                then
                    if test ${JUGADOR2[$I]} -gt ${BASTOS[$PIVOTE_SUPB]} && ${JUGADOR2[$I]} -eq $((${BASTOS[$PIVOTE_SUPB]}+1))
                    then
                        PIVOTE_SUPB=$(($PIVOTE_SUPB+1))
                        BASTOS[$PIVOTE_SUPB]=${JUGADOR2[$I]}
                        while test $I -lt $CARTA2
                        do
                            JUGADOR2[$I]=${JUGADOR2[$(($I+1))]}
                        done
                        CARTA2=$(($CARTA2-1))
                        TURNO=1
                        CORRECTO=1  
                    fi
                    if test ${JUGADOR2[$I]} -lt ${BASTOS[$PIVOTE_INFB]} && ${JUGADOR2[$I]} -eq $((${BASTOS[$PIVOTE_INFB]}-1))
                    then
                        PIVOTE_SUPB=$(($PIVOTE_SUPB-1))
                        BASTOS[$PIVOTE_INFB]=${JUGADOR2[$I]}
                        while test $I -lt $CARTA21
                        do
                            JUGADOR2[$I]=${JUGADOR2[$(($I+1))]}
                        done
                        CARTA2=$(($CARTA2-1))
                        TURNO=1
                        CORRECTO=1
                    fi
                else
                    if test ${JUGADOR2[$I]} -eq 25
                    then
                        BASTOS[4]=${JUGADOR2[$I]}
                        while test $I -lt $CARTA2
                        do
                            JUGADOR2[$I]=${JUGADOR2[$(($I+1))]}
                        done
                        CARTA2=$(($CARTA2-1))
                        TURNO=1
                        CORRECTO=1
                    fi
                fi
            fi
        

            if test ${JUGADOR2[$I]} -ge 31 && ${JUGADOR2[$I]} -le 40
            then
                if test ${COPAS[4]} -ne 0
                then
                    if test ${JUGADOR2[$I]} -gt ${COPAS[$PIVOTE_SUPC]} && ${JUGADOR2[$I]} -eq $((${COPAS[$PIVOTE_SUPC]}+1)) 
                    then
                        PIVOTE_SUPC=$(($PIVOTE_SUPC+1))
                        COPAS[$PIVOTE_SUPC]=${JUGADOR2[$I]}
                        while test $I -lt $CARTA2
                        do
                            JUGADOR2[$I]=${JUGADOR2[$(($I+1))]}
                        done
                        CARTA2=$(($CARTA2-1))
                        TURNO=1
                        CORRECTO=1
                    fi
                    if test ${JUGADOR2[$I]} -lt ${COPAS[$PIVOTE_INFC]} && ${JUGADOR2[$I]} -eq $((${COPAS[$PIVOTE_INFC]}-1))
                    then
                        PIVOTE_SUPC=$(($PIVOTE_SUPC-1))
                        COPAS[$PIVOTE_INFB]=${JUGADOR2[$I]}
                        while test $I -lt $CARTA2
                        do
                            JUGADOR2[$I]=${JUGADOR2[$(($I+1))]}
                        done
                        CARTA2=$(($CARTA2-1))
                        TURNO=1
                        CORRECTO=1
                    fi  
                else
                    if test ${JUGADOR2[$I]} -eq 35
                    then
                        COPAS[4]=${JUGADOR2[$I]}
                        while test $I -lt $CARTA2
                        do
                            JUGADOR2[$I]=${JUGADOR2[$(($I+1))]}
                        done
                        CARTA2=$(($CARTA2-1))
                        TURNO=1
                        CORRECTO=1
                    fi
                fi
            fi
        fi    
        done
    fi
    fi

    if test $CARTA1 -eq 0
    then
        GANADOR=1
        PUNTUAJE=$CARTA2
        FINAL=1
    fi

    if test $CARTA2 -eq 0
    then
        GANADOR=2
        PUNTUAJE=$CARTA1
        FINAL=1
    fi

    if test $SUM_TURNO -eq 2
    then 
        RONDA=$(($RONDA+1))
        SUM_TURNO=0
    fi
done
echo fin del programa
exit 0
