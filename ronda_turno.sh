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

        if test $VACIO -eq 0 
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
                    PIVOTE_INFO=4
                    PIVOTE_SUPO=4
                    J=$I
                    while test $J -lt $CARTA2
                    do
                        JUGADOR2[$J]=${JUGADOR2[$(($J+1))]}
                    done
                    TURNO=3
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
                    then
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
                    then
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
                    then
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
                then
                    PUEDE=1
                else
                    I=$(($I+1))
                fi
            fi
        fi
        TURNO=3
        PASAR=1
        done

        while test $CORRECTO -eq 0 -a $PASAR -ne 1
        do
        echo Dame el indice de la carta que quieres echar
        read INDICE
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
                        while test $I -lt $CARTA2
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
                        while test $I -lt $CARTA2
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
                        while test $I -lt $CARTA2
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
                        while test $I -lt $CARTA2
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
                        while test $I -lt $CARTA2
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
                        while test $I -lt $CARTA2
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
                        while test $I -lt $CARTA21
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
                        while test $I -lt $CARTA2
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
                        while test $I -lt $CARTA2
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
                        while test $I -lt $CARTA2
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
                        while test $I -lt $CARTA2
                        do
                            JUGADOR2[$I]=${JUGADOR2[$(($I+1))]}
                        done
                        CARTA2=$(($CARTA2-1))
                        TURNO=3
                        CORRECTO=1
                    fi
                fi
            fi
        fi    
        done
    fi