#!/bin/bash
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

while test $FINAL -eq 0
do
    clear  #Limpio la pantalla
    I=0
    echo "                  RONDA $RONDA                  "
    echo ------------------------------------------------------
    echo "  JUGADOR  1  '|'  JUGADOR  2  '|'  JUGADOR  3  "
    echo ------------------------------------------------------
    echo "  POS.- CARTA '|'  POS.- CARTA '|'  POS.- CARTA "
    while test $I -le CARTA1
    do 
        echo "$I.- ${baraja[${JUGADOR1[$I]}]}   $I.- ${baraja[${JUGADOR2[$I]}]}   $I.- ${baraja[${JUGADOR3[$I]}]}"
    done
    echo ------------------------------------------------------
    echo "  OROS   '|'   ESPADAS   '|'   BASTOS   '|'   COPAS"
    while test $I -le CARTAS3
    do 
        echo "${baraja[${OROS[$I]}]}   ${${baraja[${ESPADAS[$I]}]}    ${${baraja[${BASTOS[$I]}]}   ${${baraja[${COPAS[$I]}]}"
    done


    #Turno JUGADOR 1
    if test $TURNO -eq 1
    then
    I=0
    VACIO=0
    while test $I -lt 10 -a $VACIO -eq 0
    do
        if test ${ORO[$I]} -eq 0 -a ${ESPADAS[$I]} -eq 0 -a ${BASTOS[$I]} -eq 0 -a ${COPAS[$I]} -eq 0
        then
            I=$(($I+1))
        else
            VACIO=1
        fi
    done

    if test $VACIO -eq 0 -a $PASAR -eq 0
    then
    echo COMIENZA EL 5 DE OROS
    I=0
    J=0
    FIND=0
    PASAR=0
    while test $I -lt $CARTA1 -a $FIND -eq 1
    do
        if test ${JUGADOR1[$I]} -eq 5
        then
        ORO[4]=${JUGADOR1[$I]}
        PIVOTE_INFO=5
        PIVOTE_SUPO=5
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
    PUEDE=0
    I=0
    while test $I -lt $CARTA1 -a $PUEDE -eq 0
    do
    
    #Comprobacion que se puede echar carta 
    if test ${JUGADOR1[$I]} -ge 1 -a ${JUGADOR1[$I]} -le 10
    then
        if test ${OROS[4]} -ne 0
        then
            if test ${JUGADOR1[$I]} -gt ${OROS[$PIVOTE_SUPO]} -a ${JUGADOR1[$I]} -eq $((${OROS[$PIVOTE_SUPO]}+1)) -o ${JUGADOR1[$I]} -lt ${OROS[$PIVOTE_INFO]} -a ${JUGADOR1[$I]} -eq $((${OROS[$PIVOTE_INFO]}-1))
            then
                PUEDE=1
            else
                I=$(($I+1))
            fi
        else
            if test ${JUGADOR1[$I]} -eq 5
                PUEDE=1
            else
                I=$(($I+1))
            fi
        fi
    fi

    if test ${JUGADOR1[$I]} -ge 11 -a ${JUGADOR1[$I]} -le 20
    then
        if test ${ESPADAS[4]} -ne 0
        then
            if test ${JUGADOR1[$I]} -gt ${ESPADAS[$PIVOTE_SUPOE]} -a ${JUGADOR1[$I]} -eq $((${ESPADAS[$PIVOTE_SUPE]}+1)) -o ${JUGADOR1[$I]} -lt ${ESPADAS[$PIVOTE_INFE]} -a ${JUGADOR1[$I]} -eq $((${ESPADAS[$PIVOTE_INFE]}-1))
            then
                PUEDE=1
            else
                I=$(($I+1))
            fi
        else
            if test ${JUGADOR1[$I]} -eq 15
                PUEDE=1
            else
                I=$(($I+1))
            fi
        fi
    fi

    if test ${JUGADOR1[$I]} -ge 21 -a ${JUGADOR1[$I]} -le 30
    then
        if test ${BASTOS[4]} -ne 0
        then
            if test ${JUGADOR1[$I]} -gt ${BASTOS[$PIVOTE_SUPB]} -a ${JUGADOR1[$I]} -eq $((${BASTOS[$PIVOTE_SUPB]}+1)) -o ${JUGADOR1[$I]} -lt ${BASTOS[$PIVOTE_INFB]} -a ${JUGADOR1[$I]} -eq $((${BASTOS[$PIVOTE_INFB]}-1))
            then
                PUEDE=1
            else
                I=$(($I+1))
            fi
        else
            if test ${JUGADOR1[$I]} -eq 25
                PUEDE=1
            else
                I=$(($I+1))
            fi
        fi
    fi

    if test ${JUGADOR1[$I]} -ge 31 -a ${JUGADOR1[$I]} -le 40
    then
        if test ${COPAS[4]} -ne 0
        then
            if test ${JUGADOR1[$I]} -gt ${COPAS[$PIVOTE_SUPC]} -a ${JUGADOR1[$I]} -eq $((${COPAS[$PIVOTE_SUPC]}+1)) -o ${JUGADOR1[$I]} -lt ${COPAS[$PIVOTE_INFC]} -a ${JUGADOR1[$I]} -eq $((${COPAS[$PIVOTE_INFC]}-1))
            then
                PUEDE=1
            else
                I=$(($I+1))
            fi
        else
            if test ${JUGADOR1[$I]} -eq 35
                PUEDE=1
            else
                I=$(($I+1))
            fi
        fi
    fi
    PASAR=1
    done
    while test $CORRECTO -eq 1
    do
    echo "Dame el indice de la carta que quieres echar: "
    read INDICE
    I=0
    FIND=0
    while test $I -lt $CARTA1 -a $FIND -eq 0
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
        if test ${JUGADOR1[$I]} -ge 1 -a ${JUGADOR1[$I]} -le 10
        then
            if test ${OROS[4]} -ne 0
            then
                if test ${JUGADOR1[$I]} -gt ${OROS[$PIVOTE_SUPO]} -a ${JUGADOR1[$I]} -eq $((${OROS[$PIVOTE_SUPO]}+1)) 
                then
                    PIVOTE_SUPO=$(($PIVOTE_SUPO+1))
                    OROS[$PIVOTE_SUPO]=${JUGADOR1[$I]}
                    while test $I -lt CARTA1
                    do
                        JUGADOR1[$I]=${JUGADOR1[$(($I+1))]}
                    done
                    CARTA1=$(($CARTA1-1))
                    TURNO=2
                    CORRECTO=1
                fi
                if test ${JUGADOR1[$I]} -lt ${OROS[$PIVOTE_INFO]} -a ${JUGADOR1[$I]} -eq $((${OROS[$PIVOTE_INFO]}-1))
                then
                    PIVOTE_SUPO=$(($PIVOTE_SUPO-1))
                    OROS[$PIVOTE_INFO]=${JUGADOR1[$I]}
                    while test $I -lt CARTA1
                    do
                        JUGADOR1[$I]=${JUGADOR1[$(($I+1))]}
                    done
                    CARTA1=$(($CARTA1-1))
                    TURNO=2
                    CORRECTO=1
                fi
            fi
        fi

        if test ${JUGADOR1[$I]} -ge 11 -a ${JUGADOR1[$I]} -le 20
        then
            if test ${ESPADAS[4]} -ne 0
            then
                if test ${JUGADOR1[$I]} -gt ${ESPADAS[$PIVOTE_SUPOE]} -a ${JUGADOR1[$I]} -eq $((${ESPADAS[$PIVOTE_SUPE]}+1))
                then
                    PIVOTE_SUPE=$(($PIVOTE_SUPE+1))
                    ESPADAS[$PIVOTE_SUPE]=${JUGADOR1[$I]}
                    while test $I -lt CARTA1
                    do
                        JUGADOR1[$I]=${JUGADOR1[$(($I+1))]}
                    done
                    CARTA1=$(($CARTA1-1))
                    TURNO=2
                    CORRECTO=1  
                fi
                if test ${JUGADOR1[$I]} -lt ${ESPADAS[$PIVOTE_INFE]} -a ${JUGADOR1[$I]} -eq $((${ESPADAS[$PIVOTE_INFE]}-1))
                then 
                    PIVOTE_SUPE=$(($PIVOTE_SUPE-1))
                    ESPADAS[$PIVOTE_INFE]=${JUGADOR1[$I]}
                    while test $I -lt CARTA1
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
                    while test $I -lt CARTA1
                    do
                        JUGADOR1[$I]=${JUGADOR1[$(($I+1))]}
                    done
                    CARTA1=$(($CARTA1-1))
                    TURNO=2
                    CORRECTO=1
                fi
            fi
        fi

        if test ${JUGADOR1[$I]} -ge 21 -a ${JUGADOR1[$I]} -le 30
        then
            if test ${BASTOS[4]} -ne 0
            then
                if test ${JUGADOR1[$I]} -gt ${BASTOS[$PIVOTE_SUPB]} -a ${JUGADOR1[$I]} -eq $((${BASTOS[$PIVOTE_SUPB]}+1))
                then
                    PIVOTE_SUPB=$(($PIVOTE_SUPB+1))
                    BASTOS[$PIVOTE_SUPB]=${JUGADOR1[$I]}
                    while test $I -lt CARTA1
                    do
                        JUGADOR1[$I]=${JUGADOR1[$(($I+1))]}
                    done
                    CARTA1=$(($CARTA1-1))
                    TURNO=2
                    CORRECTO=1  
                fi
                if test ${JUGADOR1[$I]} -lt ${BASTOS[$PIVOTE_INFB]} -a ${JUGADOR1[$I]} -eq $((${BASTOS[$PIVOTE_INFB]}-1))
                then
                    PIVOTE_SUPB=$(($PIVOTE_SUPB-1))
                    BASTOS[$PIVOTE_INFB]=${JUGADOR1[$I]}
                    while test $I -lt CARTA1
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
                    while test $I -lt CARTA1
                    do
                        JUGADOR1[$I]=${JUGADOR1[$(($I+1))]}
                    done
                    CARTA1=$(($CARTA1-1))
                    TURNO=2
                    CORRECTO=1
                fi
            fi
        fi

        if test ${JUGADOR1[$I]} -ge 31 -a ${JUGADOR1[$I]} -le 40
        then
            if test ${COPAS[4]} -ne 0
            then
                if test ${JUGADOR1[$I]} -gt ${COPAS[$PIVOTE_SUPC]} -a ${JUGADOR1[$I]} -eq $((${COPAS[$PIVOTE_SUPC]}+1)) 
                then
                    PIVOTE_SUPC=$(($PIVOTE_SUPC+1))
                    COPAS[$PIVOTE_SUPC]=${JUGADOR1[$I]}
                    while test $I -lt CARTA1
                    do
                        JUGADOR1[$I]=${JUGADOR1[$(($I+1))]}
                    done
                    CARTA1=$(($CARTA1-1))
                    TURNO=2
                    CORRECTO=1
                fi
                if test ${JUGADOR1[$I]} -lt ${COPAS[$PIVOTE_INFC]} -a ${JUGADOR1[$I]} -eq $((${COPAS[$PIVOTE_INFC]}-1))
                then
                    PIVOTE_SUPC=$(($PIVOTE_SUPC-1))
                    COPAS[$PIVOTE_INFB]=${JUGADOR1[$I]}
                    while test $I -lt CARTA1
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
                    while test $I -lt CARTA1
                    do
                        JUGADOR1[$I]=${JUGADOR1[$(($I+1))]}
                    done
                    CARTA1=$(($CARTA1-1))
                    TURNO=2
                    CORRECTO=1
                fi
            fi
        fi
    done
    fi
    

------------------------------------------------------------------------------------------------------------------------------------
    #Turno JUGADOR 2
    if test $TURNO -eq 2
    then
    I=0
    VACIO=0
    while test $I -lt 10 -a $VACIO -eq 0
    do
        if test ${ORO[$I]} -eq 0 -a ${ESPADAS[$I]} -eq 0 -a ${BASTOS[$I]} -eq 0 -a ${COPAS[$I]} -eq 0
        then
            I=$(($I+1))
        else
            VACIO=1
        fi
    done

    if test $VACIO -eq 0 -a $PASAR -eq 0
    then
    echo COMIENZA EL 5 DE OROS
    I=0
    J=0
    FIND=0
    PASAR=0
    while test $I -lt $CARTA2 -a $FIND -eq 1
    do
        if test ${JUGADOR2[$I]} -eq 5
        then
        ORO[4]=${JUGADOR2[$I]}
        PIVOTE_INFO=5
        PIVOTE_SUPO=5
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
    PUEDE=0
    I=0
    while test $I -lt $CARTA2 -a $PUEDE -eq 0
    do
    
    #Comprobacion que se puede echar carta 
    if test ${JUGADOR2[$I]} -ge 1 -a ${JUGADOR2[$I]} -le 10
    then
        if test ${OROS[4]} -ne 0
        then
            if test ${JUGADOR2[$I]} -gt ${OROS[$PIVOTE_SUPO]} -a ${JUGADOR2[$I]} -eq $((${OROS[$PIVOTE_SUPO]}+1)) -o ${JUGADOR2[$I]} -lt ${OROS[$PIVOTE_INFO]} -a ${JUGADOR2[$I]} -eq $((${OROS[$PIVOTE_INFO]}-1))
            then
                PUEDE=1
            else
                I=$(($I+1))
            fi
        else
            if test ${JUGADOR2[$I]} -eq 5
                PUEDE=1
            else
                I=$(($I+1))
            fi
        fi
    fi

    if test ${JUGADOR2[$I]} -ge 11 -a ${JUGADOR2[$I]} -le 20
    then
        if test ${ESPADAS[4]} -ne 0
        then
            if test ${JUGADOR2[$I]} -gt ${ESPADAS[$PIVOTE_SUPOE]} -a ${JUGADOR2[$I]} -eq $((${ESPADAS[$PIVOTE_SUPE]}+1)) -o ${JUGADOR2[$I]} -lt ${ESPADAS[$PIVOTE_INFE]} -a ${JUGADOR2[$I]} -eq $((${ESPADAS[$PIVOTE_INFE]}-1))
            then
                PUEDE=1
            else
                I=$(($I+1))
            fi
        else
            if test ${JUGADOR2[$I]} -eq 15
                PUEDE=1
            else
                I=$(($I+1))
            fi
        fi
    fi

    if test ${JUGADOR2[$I]} -ge 21 -a ${JUGADOR2[$I]} -le 30
    then
        if test ${BASTOS[4]} -ne 0
        then
            if test ${JUGADOR2[$I]} -gt ${BASTOS[$PIVOTE_SUPB]} -a ${JUGADOR2[$I]} -eq $((${BASTOS[$PIVOTE_SUPB]}+1)) -o ${JUGADOR2[$I]} -lt ${BASTOS[$PIVOTE_INFB]} -a ${JUGADOR2[$I]} -eq $((${BASTOS[$PIVOTE_INFB]}-1))
            then
                PUEDE=1
            else
                I=$(($I+1))
            fi
        else
            if test ${JUGADOR2[$I]} -eq 25
                PUEDE=1
            else
                I=$(($I+1))
            fi
        fi
    fi

    if test ${JUGADOR2[$I]} -ge 31 -a ${JUGADOR2[$I]} -le 40
    then
        if test ${COPAS[4]} -ne 0
        then
            if test ${JUGADOR2[$I]} -gt ${COPAS[$PIVOTE_SUPC]} -a ${JUGADOR2[$I]} -eq $((${COPAS[$PIVOTE_SUPC]}+1)) -o ${JUGADOR2[$I]} -lt ${COPAS[$PIVOTE_INFC]} -a ${JUGADOR2[$I]} -eq $((${COPAS[$PIVOTE_INFC]}-1))
            then
                PUEDE=1
            else
                I=$(($I+1))
            fi
        else
            if test ${JUGADOR2[$I]} -eq 35
                PUEDE=1
            else
                I=$(($I+1))
            fi
        fi
    fi
    PASAR=1
    done
    while test $CORRECTO -eq 1
    do
    case $EST in
        0)
        INDICE=$((0+ RANDOM % $CARTA2))
        ;;
        1)

        ;;

        2)

        ;;
    esac
    I=0
    FIND=0
    while test $I -lt $CARTA2 -a $FIND -eq 0
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
        if test ${JUGADOR2[$I]} -ge 1 -a ${JUGADOR2[$I]} -le 10
        then
            if test ${OROS[4]} -ne 0
            then
                if test ${JUGADOR2[$I]} -gt ${OROS[$PIVOTE_SUPO]} -a ${JUGADOR2[$I]} -eq $((${OROS[$PIVOTE_SUPO]}+1)) 
                then
                    PIVOTE_SUPO=$(($PIVOTE_SUPO+1))
                    OROS[$PIVOTE_SUPO]=${JUGADOR2[$I]}
                    while test $I -lt $CARTAS2
                    do
                        JUGADOR2[$I]=${JUGADOR2[$(($I+1))]}
                    done
                    CARTA2=$(($CARTA2-1))
                    TURNO=3
                    CORRECTO=1
                fi
                if test ${JUGADOR2[$I]} -lt ${OROS[$PIVOTE_INFO]} -a ${JUGADOR2[$I]} -eq $((${OROS[$PIVOTE_INFO]}-1))
                then
                    PIVOTE_SUPO=$(($PIVOTE_SUPO-1))
                    OROS[$PIVOTE_INFO]=${JUGADOR2[$I]}
                    while test $I -lt $CARTAS2
                    do
                        JUGADOR2[$I]=${JUGADOR2[$(($I+1))]}
                    done
                    CARTA2=$(($CARTA2-1))
                    TURNO=3
                    CORRECTO=1
                fi
            fi
        fi

        if test ${JUGADOR2[$I]} -ge 11 -a ${JUGADOR2[$I]} -le 20
        then
            if test ${ESPADAS[4]} -ne 0
            then
                if test ${JUGADOR2[$I]} -gt ${ESPADAS[$PIVOTE_SUPOE]} -a ${JUGADOR2[$I]} -eq $((${ESPADAS[$PIVOTE_SUPE]}+1))
                then
                    PIVOTE_SUPE=$(($PIVOTE_SUPE+1))
                    ESPADAS[$PIVOTE_SUPE]=${JUGADOR2[$I]}
                    while test $I -lt $CARTAS2
                    do
                        JUGADOR2[$I]=${JUGADOR2[$(($I+1))]}
                    done
                    CARTA2=$(($CARTA2-1))
                    TURNO=3
                    CORRECTO=1  
                fi
                if test ${JUGADOR2[$I]} -lt ${ESPADAS[$PIVOTE_INFE]} -a ${JUGADOR2[$I]} -eq $((${ESPADAS[$PIVOTE_INFE]}-1))
                then 
                    PIVOTE_SUPE=$(($PIVOTE_SUPE-1))
                    ESPADAS[$PIVOTE_INFE]=${JUGADOR2[$I]}
                    while test $I -lt $CARTAS2
                    do
                        JUGADOR2[$I]=${JUGADOR2[$(($I+1))]}
                    done
                    CARTA2=$(($CARTA2-1))
                    TURNO=3
                    CORRECTO=1
                fi
            else
                if test ${JUGADOR2[$I]} -eq 15
                then
                    ESPADAS[4]=${JUGADOR2[$I]}
                    while test $I -lt $CARTAS2
                    do
                        JUGADOR2[$I]=${JUGADOR2[$(($I+1))]}
                    done
                    CARTA2=$(($CARTA2-1))
                    TURNO=3
                    CORRECTO=1
                fi
            fi
        fi

        if test ${JUGADOR2[$I]} -ge 21 -a ${JUGADOR2[$I]} -le 30
        then
            if test ${BASTOS[4]} -ne 0
            then
                if test ${JUGADOR2[$I]} -gt ${BASTOS[$PIVOTE_SUPB]} -a ${JUGADOR2[$I]} -eq $((${BASTOS[$PIVOTE_SUPB]}+1))
                then
                    PIVOTE_SUPB=$(($PIVOTE_SUPB+1))
                    BASTOS[$PIVOTE_SUPB]=${JUGADOR2[$I]}
                    while test $I -lt $CARTAS2
                    do
                        JUGADOR2[$I]=${JUGADOR2[$(($I+1))]}
                    done
                    CARTA2=$(($CARTA2-1))
                    TURNO=3
                    CORRECTO=1  
                fi
                if test ${JUGADOR2[$I]} -lt ${BASTOS[$PIVOTE_INFB]} -a ${JUGADOR2[$I]} -eq $((${BASTOS[$PIVOTE_INFB]}-1))
                then
                    PIVOTE_SUPB=$(($PIVOTE_SUPB-1))
                    BASTOS[$PIVOTE_INFB]=${JUGADOR2[$I]}
                    while test $I -lt $CARTAS2
                    do
                        JUGADOR2[$I]=${JUGADOR2[$(($I+1))]}
                    done
                    CARTA2=$(($CARTA2-1))
                    TURNO=3
                    CORRECTO=1
                fi
            else
                if test ${JUGADOR2[$I]} -eq 25
                then
                    BASTOS[4]=${JUGADOR2[$I]}
                    while test $I -lt $CARTAS2
                    do
                        JUGADOR2[$I]=${JUGADOR2[$(($I+1))]}
                    done
                    CARTA2=$(($CARTA2-1))
                    TURNO=3
                    CORRECTO=1
                fi
            fi
        fi

        if test ${JUGADOR2[$I]} -ge 31 -a ${JUGADOR2[$I]} -le 40
        then
            if test ${COPAS[4]} -ne 0
            then
                if test ${JUGADOR2[$I]} -gt ${COPAS[$PIVOTE_SUPC]} -a ${JUGADOR2[$I]} -eq $((${COPAS[$PIVOTE_SUPC]}+1)) 
                then
                    PIVOTE_SUPC=$(($PIVOTE_SUPC+1))
                    COPAS[$PIVOTE_SUPC]=${JUGADOR2[$I]}
                    while test $I -lt $CARTAS2
                    do
                        JUGADOR2[$I]=${JUGADOR2[$(($I+1))]}
                    done
                    CARTA2=$(($CARTA2-1))
                    TURNO=3
                    CORRECTO=1
                fi
                if test ${JUGADOR2[$I]} -lt ${COPAS[$PIVOTE_INFC]} -a ${JUGADOR2[$I]} -eq $((${COPAS[$PIVOTE_INFC]}-1))
                then
                    PIVOTE_SUPC=$(($PIVOTE_SUPC-1))
                    COPAS[$PIVOTE_INFB]=${JUGADOR2[$I]}
                    while test $I -lt $CARTAS2
                    do
                        JUGADOR2[$I]=${JUGADOR2[$(($I+1))]}
                    done
                    CARTA2=$(($CARTA2-1))
                    TURNO=3
                    CORRECTO=1
                fi
            else
                if test ${JUGADOR2[$I]} -eq 35
                then
                    COPAS[4]=${JUGADOR2[$I]}
                    while test $I -lt $CARTAS2
                    do
                        JUGADOR2[$I]=${JUGADOR2[$(($I+1))]}
                    done
                    CARTA2=$(($CARTA2-1))
                    TURNO=3
                    CORRECTO=1
                fi
            fi
        fi
    done
    fi

    #Turno JUGADOR 3
    if test $TURNO -eq 3
    then
    I=0
    VACIO=0
    while test $I -lt 10 -a $VACIO -eq 0
    do
        if test ${ORO[$I]} -eq 0 -a ${ESPADAS[$I]} -eq 0 -a ${BASTOS[$I]} -eq 0 -a ${COPAS[$I]} -eq 0
        then
            I=$(($I+1))
        else
            VACIO=1
        fi
    done

    if test $VACIO -eq 0 -a $PASAR -eq 0
    then
    echo COMIENZA EL 5 DE OROS
    I=0
    J=0
    FIND=0
    PASAR=0
    while test $I -lt $CARTA3 -a $FIND -eq 1
    do
        if test ${JUGADOR3[$I]} -eq 5
        then
        ORO[4]=${JUGADOR3[$I]}
        PIVOTE_INFO=5
        PIVOTE_SUPO=5
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
    PUEDE=0
    I=0
    while test $I -lt $CARTA3 -a $PUEDE -eq 0
    do
    
    #Comprobacion que se puede echar carta 
    if test ${JUGADOR3[$I]} -ge 1 -a ${JUGADOR3[$I]} -le 10
    then
        if test ${OROS[4]} -ne 0
        then
            if test ${JUGADOR3[$I]} -gt ${OROS[$PIVOTE_SUPO]} -a ${JUGADOR3[$I]} -eq $((${OROS[$PIVOTE_SUPO]}+1)) -o ${JUGADOR3[$I]} -lt ${OROS[$PIVOTE_INFO]} -a ${JUGADOR3[$I]} -eq $((${OROS[$PIVOTE_INFO]}-1))
            then
                PUEDE=1
            else
                I=$(($I+1))
            fi
        else
            if test ${JUGADOR3[$I]} -eq 5
                PUEDE=1
            else
                I=$(($I+1))
            fi
        fi
    fi

    if test ${JUGADOR3[$I]} -ge 11 -a ${JUGADOR3[$I]} -le 20
    then
        if test ${ESPADAS[4]} -ne 0
        then
            if test ${JUGADOR3[$I]} -gt ${ESPADAS[$PIVOTE_SUPOE]} -a ${JUGADOR3[$I]} -eq $((${ESPADAS[$PIVOTE_SUPE]}+1)) -o ${JUGADOR3[$I]} -lt ${ESPADAS[$PIVOTE_INFE]} -a ${JUGADOR3[$I]} -eq $((${ESPADAS[$PIVOTE_INFE]}-1))
            then
                PUEDE=1
            else
                I=$(($I+1))
            fi
        else
            if test ${JUGADOR3[$I]} -eq 15
                PUEDE=1
            else
                I=$(($I+1))
            fi
        fi
    fi

    if test ${JUGADOR3[$I]} -ge 21 -a ${JUGADOR3[$I]} -le 30
    then
        if test ${BASTOS[4]} -ne 0
        then
            if test ${JUGADOR3[$I]} -gt ${BASTOS[$PIVOTE_SUPB]} -a ${JUGADOR3[$I]} -eq $((${BASTOS[$PIVOTE_SUPB]}+1)) -o ${JUGADOR3[$I]} -lt ${BASTOS[$PIVOTE_INFB]} -a ${JUGADOR3[$I]} -eq $((${BASTOS[$PIVOTE_INFB]}-1))
            then
                PUEDE=1
            else
                I=$(($I+1))
            fi
        else
            if test ${JUGADOR3[$I]} -eq 25
                PUEDE=1
            else
                I=$(($I+1))
            fi
        fi
    fi

    if test ${JUGADOR3[$I]} -ge 31 -a ${JUGADOR3[$I]} -le 40
    then
        if test ${COPAS[4]} -ne 0
        then
            if test ${JUGADOR3[$I]} -gt ${COPAS[$PIVOTE_SUPC]} -a ${JUGADOR3[$I]} -eq $((${COPAS[$PIVOTE_SUPC]}+1)) -o ${JUGADOR3[$I]} -lt ${COPAS[$PIVOTE_INFC]} -a ${JUGADOR3[$I]} -eq $((${COPAS[$PIVOTE_INFC]}-1))
            then
                PUEDE=1
            else
                I=$(($I+1))
            fi
        else
            if test ${JUGADOR3[$I]} -eq 35
                PUEDE=1
            else
                I=$(($I+1))
            fi
        fi
    fi
    PASAR=1
    done
    while test $CORRECTO -eq 1
    do
    case $EST in
        0)
        INDICE=$((0+ RANDOM % $CARTA2))
        ;;
        1)

        ;;

        2)

        ;;
    esac
    I=0
    FIND=0
    while test $I -lt $CARTA3 -a $FIND -eq 0
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
        if test ${JUGADOR3[$I]} -ge 1 -a ${JUGADOR3[$I]} -le 10
        then
            if test ${OROS[4]} -ne 0
            then
                if test ${JUGADOR3[$I]} -gt ${OROS[$PIVOTE_SUPO]} -a ${JUGADOR3[$I]} -eq $((${OROS[$PIVOTE_SUPO]}+1)) 
                then
                    PIVOTE_SUPO=$(($PIVOTE_SUPO+1))
                    OROS[$PIVOTE_SUPO]=${JUGADOR3[$I]}
                    while test $I -lt $CARTAS3
                    do
                        JUGADOR3[$I]=${JUGADOR3[$(($I+1))]}
                    done
                    CARTA3=$(($CARTA3-1))
                    TURNO=1
                    CORRECTO=1
                fi
                if test ${JUGADOR2[$I]} -lt ${OROS[$PIVOTE_INFO]} -a ${JUGADOR2[$I]} -eq $((${OROS[$PIVOTE_INFO]}-1))
                then
                    PIVOTE_SUPO=$(($PIVOTE_SUPO-1))
                    OROS[$PIVOTE_INFO]=${JUGADOR2[$I]}
                    while test $I -lt $CARTAS3
                    do
                        JUGADOR3[$I]=${JUGADOR3[$(($I+1))]}
                    done
                    CARTA3=$(($CARTA3-1))
                    TURNO=1
                    CORRECTO=1
                fi
            fi
        fi

        if test ${JUGADOR3[$I]} -ge 11 -a ${JUGADOR3[$I]} -le 20
        then
            if test ${ESPADAS[4]} -ne 0
            then
                if test ${JUGADOR3[$I]} -gt ${ESPADAS[$PIVOTE_SUPOE]} -a ${JUGADOR3[$I]} -eq $((${ESPADAS[$PIVOTE_SUPE]}+1))
                then
                    PIVOTE_SUPE=$(($PIVOTE_SUPE+1))
                    ESPADAS[$PIVOTE_SUPE]=${JUGADOR3[$I]}
                    while test $I -lt $CARTAS3
                    do
                        JUGADOR3[$I]=${JUGADOR3[$(($I+1))]}
                    done
                    CARTA3=$(($CARTA3-1))
                    TURNO=1
                    CORRECTO=1  
                fi
                if test ${JUGADOR3[$I]} -lt ${ESPADAS[$PIVOTE_INFE]} -a ${JUGADOR1[$I]} -eq $((${ESPADAS[$PIVOTE_INFE]}-1))
                then 
                    PIVOTE_SUPE=$(($PIVOTE_SUPE-1))
                    ESPADAS[$PIVOTE_INFE]=${JUGADOR3[$I]}
                    while test $I -lt $CARTAS3
                    do
                        JUGADOR3[$I]=${JUGADOR3[$(($I+1))]}
                    done
                    CARTA3=$(($CARTA3-1))
                    TURNO=1
                    CORRECTO=1
                fi
            else
                if test ${JUGADOR3[$I]} -eq 15
                then
                    ESPADAS[4]=${JUGADOR3[$I]}
                    while test $I -lt $CARTAS3
                    do
                        JUGADOR3[$I]=${JUGADOR3[$(($I+1))]}
                    done
                    CARTA3=$(($CARTA3-1))
                    TURNO=1
                    CORRECTO=1
                fi
            fi
        fi

        if test ${JUGADOR3[$I]} -ge 21 -a ${JUGADOR3[$I]} -le 30
        then
            if test ${BASTOS[4]} -ne 0
            then
                if test ${JUGADOR3[$I]} -gt ${BASTOS[$PIVOTE_SUPB]} -a ${JUGADOR3[$I]} -eq $((${BASTOS[$PIVOTE_SUPB]}+1))
                then
                    PIVOTE_SUPB=$(($PIVOTE_SUPB+1))
                    BASTOS[$PIVOTE_SUPB]=${JUGADOR3[$I]}
                    while test $I -lt $CARTAS3
                    do
                        JUGADOR3[$I]=${JUGADOR3[$(($I+1))]}
                    done
                    CARTA3=$(($CARTA3-1))
                    TURNO=1
                    CORRECTO=1  
                fi
                if test ${JUGADOR3[$I]} -lt ${BASTOS[$PIVOTE_INFB]} -a ${JUGADOR3[$I]} -eq $((${BASTOS[$PIVOTE_INFB]}-1))
                then
                    PIVOTE_SUPB=$(($PIVOTE_SUPB-1))
                    BASTOS[$PIVOTE_INFB]=${JUGADOR3[$I]}
                    while test $I -lt $CARTAS3
                    do
                        JUGADOR3[$I]=${JUGADOR3[$(($I+1))]}
                    done
                    CARTA3=$(($CARTA3-1))
                    TURNO=1
                    CORRECTO=1
                fi
            else
                if test ${JUGADOR3[$I]} -eq 25
                then
                    BASTOS[4]=${JUGADOR3[$I]}
                    while test $I -lt $CARTAS3
                    do
                        JUGADOR3[$I]=${JUGADOR3[$(($I+1))]}
                    done
                    CARTA3=$(($CARTA3-1))
                    TURNO=1
                    CORRECTO=1
                fi
            fi
        fi

        if test ${JUGADOR3[$I]} -ge 31 -a ${JUGADOR3[$I]} -le 40
        then
            if test ${COPAS[4]} -ne 0
            then
                if test ${JUGADOR3[$I]} -gt ${COPAS[$PIVOTE_SUPC]} -a ${JUGADOR3[$I]} -eq $((${COPAS[$PIVOTE_SUPC]}+1)) 
                then
                    PIVOTE_SUPC=$(($PIVOTE_SUPC+1))
                    COPAS[$PIVOTE_SUPC]=${JUGADOR3[$I]}
                    while test $I -lt $CARTAS3
                    do
                        JUGADOR3[$I]=${JUGADOR3[$(($I+1))]}
                    done
                    CARTA3=$(($CARTA3-1))
                    TURNO=1
                    CORRECTO=1
                fi
                if test ${JUGADOR3[$I]} -lt ${COPAS[$PIVOTE_INFC]} -a ${JUGADOR3[$I]} -eq $((${COPAS[$PIVOTE_INFC]}-1))
                then
                    PIVOTE_SUPC=$(($PIVOTE_SUPC-1))
                    COPAS[$PIVOTE_INFB]=${JUGADOR3[$I]}
                    while test $I -lt $CARTAS3
                    do
                        JUGADOR3[$I]=${JUGADOR3[$(($I+1))]}
                    done
                    CARTA3=$(($CARTA3-1))
                    TURNO=1
                    CORRECTO=1
                fi
            else
                if test ${JUGADOR3[$I]} -eq 35
                then
                    COPAS[4]=${JUGADOR3[$I]}
                    while test $I -lt $CARTAS3
                    do
                        JUGADOR3[$I]=${JUGADOR3[$(($I+1))]}
                    done
                    CARTA3=$(($CARTA3-1))
                    TURNO=1
                    CORRECTO=1
                fi
            fi
        fi
    done
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
