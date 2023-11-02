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

#Determinamos quien comienza echando
    I=0
    EMPIEZA1=0
    while test $I -lt $CARTA1 -a $FIND -eq 0
    do 
        if test ${JUGADOR1[$I]} -eq 5
        then
            EMPIEZA1=1
        fi
    done

    if test $EMPIEZA1 -eq 1
    then
        TURNO=1;
    fi

    I=0
    EMPIEZA2=0
    while test $I -lt $CARTA2 -a $FIND -eq 0
    do 
        if test ${JUGADOR1[$I]} -eq 5
        then
            EMPIEZA2=1
        fi
    done

    if test $EMPIEZA2 -eq 1
    then
        TURNO=1;
    fi

while test $FINAL -eq 0
do
    clear  #Limpio la pantalla
    I=0
    echo "                  RONDA $RONDA                  "
    echo ------------------------------------------------------
    echo "POS   '|'   JUGADOR  1   '|'   JUGADOR  2   '|'   JUGADOR  3  "
    echo ------------------------------------------------------
    while test $I -lt $CARTA1
    do 
        echo "$I.-  ${baraja[${JUGADOR1[$I]}]}   ${baraja[${JUGADOR2[$I]}]}   ${baraja[${JUGADOR3[$I]}]}"
        I=$(($I+1))
    done
    echo ------------------------------------------------------
    echo "  OROS   '|'   ESPADAS   '|'   BASTOS   '|'   COPAS"
    while test $I -le 10
    do 
        echo "${baraja[${OROS[$I]}]}   ${baraja[${ESPADAS[$I]}]}    ${baraja[${BASTOS[$I]}]}   ${baraja[${COPAS[$I]}]}"
        I=$(($I+1))
    done


    #USUARIO
    if test $TURNO -eq 1
    then
    echo TURNO JUGADOR 1
        if test ${OROS[4]} -eq 0
        then
            echo COMIENZA EL 5 DE OROS
            echo
            I=0
            J=0
            FIND
            while test $I -lt $CARTA1 -a $FIND -eq 0
            do
                if test ${JUGADOR1[$I]} -eq 5
                then
                    FIND=1
                fi
                I=$(($I+1))
            done
            if test $FIND -eq 1
            then
                ORO[4]=${JUGADOR1[$I]}
                PIVOTE_INFO=4
                PIVOTE_SUPO=4
                J=$I
                while test $J -lt $CARTA1
                do
                    JUGADOR1[$J]=${JUGADOR1[$(($J+1))]}
                    J=$(($J+1))
                done
                CARTA1=$(($I-1))
                TURNO=2
                SUM_TURNO=$(($SUM_TURNO+1))
            fi
        else

        while test $TURNO -eq 1
        do
        echo MENU JUGADOR 1
        echo 1')'Echar carta
        echo 2')'Pasar

        case $OPCION in
            1)
                CORRECTO=0
                while test $CORRECTO -eq 0
                do
                echo Introduzca el indice de la carta que desea echar
                read INDICE
                FIND=0
                I=0
                while test $I -lt $CARTA1 -a $FIND -eq 0
                do
                    if test $I -eq $INDICE
                    then
                        FIND=1
                    fi
                    I=$(($I+1))
                done
                J=$I
                if test $FIND -eq 1
                then
                    #PALO DE OROS
                    if test ${JUGADOR1[$INDICE]} -ge 1 && ${JUGADOR1[$INDICE]} -le 10
                    then
                        if test ${OROS[4]} -eq 0
                        then
                            if test ${JUGADOR1[$INDICE]} -eq 5
                            then
                                ORO[4]=${JUGADOR1[$I]}
                                PIVOTE_INFO=4
                                PIVOTE_SUPO=4
                                while test $J -lt $CARTA1
                                do
                                    JUGADOR1[$J]=${JUGADOR1[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA1=$(($I-1))
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                TURNO=2
                            else
                                CORRECTO=0
                            fi
                        else
                            if test ${JUGADOR1[$INDICE]} -lt ${OROS[PIVOTE_INFO]} -a ${JUGADOR1[$INDICE]} -eq $((${OROS[$PIVOTE_INFO]}-1))
                            then
                                PIVOTE_INFO=$(($PIVOTE_INFO-1))
                                OROS[$PIVOTE_INFO]=${JUGADOR1[$INDICE]}
                                while test $J -lt $CARTA1
                                do
                                    JUGADOR1[$J]=${JUGADOR1[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA1=$(($I-1))
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                TURNO=2
                            fi
                            if test ${JUGADOR1[$INDICE]} -lt ${OROS[PIVOTE_SUPO]} -a ${JUGADOR1[$INDICE]} -eq $((${OROS[$PIVOTE_SUPO]}+1))
                            then
                                PIVOTE_SUPO=$(($PIVOTE_SUPO+1))
                                OROS[$PIVOTE_SUPO]=${JUGADOR1[$INDICE]}
                                while test $J -lt $CARTA1
                                do
                                    JUGADOR1[$J]=${JUGADOR1[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA1=$(($I-1))
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                TURNO=2
                            fi
                        fi
                    fi

                    #PALO DE ESPADAS
                    if test ${JUGADOR1[$INDICE]} -ge 11 && ${JUGADOR1[$INDICE]} -le 20
                    then
                        if test ${ESPADAS[4]} -eq 0
                        then
                            if test ${JUGADOR1[$INDICE]} -eq 15
                            then
                                ESPADAS[4]=${JUGADOR1[$I]}
                                PIVOTE_INFE=4
                                PIVOTE_SUPE=4
                                while test $J -lt $CARTA1
                                do
                                    JUGADOR1[$J]=${JUGADOR1[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA1=$(($I-1))
                                TURNO=2
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                            else
                                CORRECTO=0
                            fi
                        else
                            if test ${JUGADOR1[$INDICE]} -lt ${ESPADAS[PIVOTE_INFE]} -a ${JUGADOR1[$INDICE]} -eq $((${ESPADAS[$PIVOTE_INFE]}-1))
                            then
                                PIVOTE_INFE=$(($PIVOTE_INFE-1))
                                ESPADAS[$PIVOTE_INFE]=${JUGADOR1[$INDICE]}
                                while test $J -lt $CARTA1
                                do
                                    JUGADOR1[$J]=${JUGADOR1[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA1=$(($I-1))
                                TURNO=2
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                            fi
                            if test ${JUGADOR1[$INDICE]} -lt ${ESPADAS[PIVOTE_SUPE]} -a ${JUGADOR1[$INDICE]} -eq $((${ESPADAS[$PIVOTE_SUPE]}+1))
                            then
                                PIVOTE_SUPE=$(($PIVOTE_SUPE+1))
                                ESPADAS[$PIVOTE_SUPE]=${JUGADOR1[$INDICE]}
                                while test $J -lt $CARTA1
                                do
                                    JUGADOR1[$J]=${JUGADOR1[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA1=$(($I-1))
                                TURNO=2
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                            fi
                        fi
                    fi

                    #PALO DE BASTOS
                    if test ${JUGADOR1[$INDICE]} -ge 21 && ${JUGADOR1[$INDICE]} -le 30
                    then
                        if test ${BASTOS[4]} -eq 0
                        then
                            if test ${JUGADOR1[$INDICE]} -eq 5
                            then
                                BASTOS[4]=${JUGADOR1[$I]}
                                PIVOTE_INFB=4
                                PIVOTE_SUPB=4
                                while test $J -lt $CARTA1
                                do
                                    JUGADOR1[$J]=${JUGADOR1[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA1=$(($I-1))
                                TURNO=2
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                            else
                                CORRECTO=0
                            fi
                        else
                            if test ${JUGADOR1[$INDICE]} -lt ${BASTOS[PIVOTE_INFB]} -a ${JUGADOR1[$INDICE]} -eq $((${BASTOS[$PIVOTE_INFB]}-1))
                            then
                                PIVOTE_INFB=$(($PIVOTE_INFB-1))
                                OROS[$PIVOTE_INFB]=${JUGADOR1[$INDICE]}
                                while test $J -lt $CARTA1
                                do
                                    JUGADOR1[$J]=${JUGADOR1[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA1=$(($I-1))
                                TURNO=2
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                            fi
                            if test ${JUGADOR1[$INDICE]} -lt ${BASTOS[PIVOTE_SUPB]} -a ${JUGADOR1[$INDICE]} -eq $((${BASTOS[$PIVOTE_SUPB]}+1))
                            then
                                PIVOTE_SUPB=$(($PIVOTE_SUPB+1))
                                OROS[$PIVOTE_SUPB]=${JUGADOR1[$INDICE]}
                                while test $J -lt $CARTA1
                                do
                                    JUGADOR1[$J]=${JUGADOR1[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA1=$(($I-1))
                                TURNO=2
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                            fi
                        fi
                    fi

                    #PALO DE COPAS
                    if test ${JUGADOR1[$INDICE]} -ge 31 && ${JUGADOR1[$INDICE]} -le 40
                    then
                        if test ${COPAS[4]} -eq 0
                        then
                            if test ${JUGADOR1[$INDICE]} -eq 5
                            then
                                ORO[4]=${JUGADOR1[$I]}
                                PIVOTE_INFC=4
                                PIVOTE_SUPC=4
                                while test $J -lt $CARTA1
                                do
                                    JUGADOR1[$J]=${JUGADOR1[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA1=$(($I-1))
                                TURNO=2
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                            else
                                CORRECTO=0
                            fi
                        else
                            if test ${JUGADOR1[$INDICE]} -lt ${BASTOS[PIVOTE_INFC]} -a ${JUGADOR1[$INDICE]} -eq $((${OBASTOSROS[$PIVOTE_INFC]}-1))
                            then
                                PIVOTE_INFC=$(($PIVOTE_INFC-1))
                                OROS[$PIVOTE_INFC]=${JUGADOR1[$INDICE]}
                                while test $J -lt $CARTA1
                                do
                                    JUGADOR1[$J]=${JUGADOR1[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA1=$(($I-1))
                                TURNO=2
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                            fi
                            if test ${JUGADOR1[$INDICE]} -lt ${COPAS[PIVOTE_SUPC]} -a ${JUGADOR1[$INDICE]} -eq $((${COPAS[$PIVOTE_SUPC]}+1))
                            then
                                PIVOTE_SUPC=$(($PIVOTE_SUPC+1))
                                OROS[$PIVOTE_SUPC]=${JUGADOR1[$INDICE]}
                                while test $J -lt $CARTA1
                                do
                                    JUGADOR1[$J]=${JUGADOR1[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA1=$(($I-1))
                                TURNO=2
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                            fi
                        fi
                    fi
                else
                    echo El indice selecionado no es valido, vuelva a seleccionarlo
                fi
            done
            ;;
            2)
                TURNO=2
            ;;
            *)
                echo La opcion introducida no es valida, introduzcala otra vez
            ;;
        esac
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

exit 0