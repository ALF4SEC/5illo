    #Turno del JUGADOR 4
    if test $TURNO -eq 4 -a $FINAL -eq 0
    then
        echo Turno del JUGADOR 4
        if test ${OROS[4]} -eq 0
        then
            echo "Comienza el 5 de Oros"
            OROS[4]=5
            I=0
            FIND=0
            #Buscamos el 5 de oros en el vector de los JUGADOR 4
            while test $I -lt $CARTA4 -a $FIND -eq 0
            do
                if test ${JUGADOR4[$I]} -eq 5
                then
                    FIND=1
                fi
                I=$(($I+1))
            done

            #Redimensionamos el vector
            J=$(($I-1))
            if test $FIND -eq 1
            then
                while test $I -lt $CARTA4
                do
                    JUGADOR4[$J]=${JUGADOR4[$I]}
                    I=$(($I+1))
                    J=$(($J+1))
                done
            fi
            JUGADOR4[$(($CARTA4-1))]=0
            CARTA4=$(($CARTA4-1))
            SUM_TURNO=$(($SUM_TURNO+1))
            TURNO=1
        else
            EXIT=0
            PUEDE=0
            #Comprobamos si el JUGADOR4 puede echar
            I=0
            while test $I -lt $CARTA4 -a $PUEDE -eq 0
            do
                if test ${JUGADOR4[$I]} -ge 1 -a ${JUGADOR4[$I]} -le 10 
                then
                    if test ${OROS[4]} -ne 0
                    then
                        if test ${JUGADOR4[$I]} -eq $((${OROS[$PIVOTE_SUPO]}+1))
                        then
                            PUEDE=1
                        fi
                        if test ${JUGADOR4[$I]} -eq $((${OROS[$PIVOTE_INFO]}-1))
                        then
                            PUEDE=1
                        fi
                    else
                        if test ${JUGADOR4[$I]} -eq 5
                        then
                            PUEDE=1
                        fi
                    fi
                fi

                if test ${JUGADOR4[$I]} -ge 11 -a ${JUGADOR4[$I]} -le 20 
                then
                    if test ${ESPADAS[4]} -ne 0
                    then
                        if test ${JUGADOR4[$I]} -eq $((${ESPADAS[$PIVOTE_SUPE]}+1))
                        then
                            PUEDE=1
                        fi
                        if test ${JUGADOR4[$I]} -eq $((${ESPADAS[$PIVOTE_INFE]}-1))
                        then
                            PUEDE=1
                        fi
                    else
                        if test ${JUGADOR4[$I]} -eq 15
                        then
                            PUEDE=1
                        fi
                    fi
                fi

                if test ${JUGADOR4[$I]} -ge 21 -a ${JUGADOR4[$I]} -le 30 
                then
                    if test ${BASTOS[4]} -ne 0
                    then
                        if test ${JUGADOR4[$I]} -eq $((${BASTOS[$PIVOTE_SUPB]}+1))
                        then
                            PUEDE=1
                        fi
                        if test ${JUGADOR4[$I]} -eq $((${BASTOS[$PIVOTE_INFB]}-1))
                        then
                            PUEDE=1
                        fi
                    else
                        if test ${JUGADOR4[$I]} -eq 25
                        then
                            PUEDE=1
                        fi
                    fi
                fi

                if test ${JUGADOR4[$I]} -ge 31 -a ${JUGADOR4[$I]} -le 40 
                then
                    if test ${COPAS[4]} -ne 0
                    then
                        if test ${JUGADOR4[$I]} -eq $((${COPAS[$PIVOTE_SUPC]}+1))
                        then
                            PUEDE=1
                        fi
                        if test ${JUGADOR4[$I]} -eq $((${COPAS[$PIVOTE_INFC]}-1))
                        then
                            PUEDE=1
                        fi
                    else
                        if test ${JUGADOR4[$I]} -eq 35
                        then
                            PUEDE=1
                        fi
                    fi
                fi 
                I=$(($I+1))
            done

            if test $PUEDE -eq 0
            then
                echo "El JUGADOR 4 PASA"
                TURNO=1
                SUM_TURNO=$(($SUM_TURNO+1))
                EXIT=1
            fi
            
            while test $EXIT -eq 0
            do
                
                #Estrategias
                EST=0
                if test $EST -eq 0
                then
                    if test $(($CARTA4-1)) -eq 0
                    then
                        INDICE=0
                    else
                        INDICE=$((0+ $RANDOM % $CARTA4))
                    fi
                fi
                if test $EST -eq 1
                then
                    #Al no estar implementada se usa la 0
                    if test $(($CARTA4-1)) -eq 0
                    then
                        INDICE=0
                    else
                        INDICE=$((0+ $RANDOM % $CARTA4))
                    fi
                fi
                if test $EST -eq 2
                then
                    #Al no estar implementada se usa la 0
                    if test $(($CARTA4-1)) -eq 0
                    then
                        INDICE=0
                    else
                        INDICE=$((0+ $RANDOM % $CARTA4))
                    fi
                fi

                CORRECTO=0
                if test  $INDICE -ge 0 -a $INDICE -le $(($CARTA4-1))
                then
                    I=0
                    FIND=0
                    while test $I -lt 20 -a $FIND -eq 0
                    do
                        if test ${JUGADOR4[$I]} -eq ${JUGADOR4[$INDICE]}
                        then
                            FIND=1
                        fi
                            I=$(($I+1))
                    done

                    CORRECTO=0
                    if test $FIND -eq 1
                    then
                        if test ${JUGADOR4[$INDICE]} -ge 1 -a ${JUGADOR4[$INDICE]} -le 10 
                        then
                            if test ${OROS[4]} -ne 0
                            then
                                if test ${JUGADOR4[$INDICE]} -eq $((${OROS[$PIVOTE_SUPO]}+1))
                                then
                                    PIVOTE_SUPO=$(($PIVOTE_SUPO+1))
                                    OROS[$PIVOTE_SUPO]=${JUGADOR4[$INDICE]}
                                    CORRECTO=1

                                fi
                                if test ${JUGADOR4[$INDICE]} -eq $((${OROS[$PIVOTE_INFO]}-1))
                                then
                                    PIVOTE_INFO=$(($PIVOTE_INFO-1))
                                    OROS[$PIVOTE_INFO]=${JUGADOR4[$INDICE]}
                                    CORRECTO=1
                                fi
                            fi
                        fi

                        if test ${JUGADOR4[$INDICE]} -ge 11 -a ${JUGADOR4[$INDICE]} -le 20 
                        then
                            if test ${ESPADAS[4]} -ne 0
                            then
                                if test ${JUGADOR4[$INDICE]} -eq $((${ESPADAS[$PIVOTE_SUPE]}+1))
                                then
                                    PIVOTE_SUPE=$(($PIVOTE_SUPE+1))
                                    ESPADAS[$PIVOTE_SUPE]=${JUGADOR4[$INDICE]}
                                    CORRECTO=1

                                fi
                                if test ${JUGADOR4[$INDICE]} -eq $((${ESPADAS[$PIVOTE_INFE]}-1))
                                then
                                    PIVOTE_INFE=$(($PIVOTE_INFE-1))
                                    ESPADAS[$PIVOTE_INFE]=${JUGADOR4[$INDICE]}
                                    CORRECTO=1
                                fi
                            else
                                if test ${JUGADOR4[$INDICE]} -eq 15
                                then
                                    ESPADAS[4]=${JUGADOR4[$INDICE]}
                                    CORRECTO=1
                                fi
                            fi
                        fi

                        if test ${JUGADOR4[$INDICE]} -ge 21 -a ${JUGADOR4[$INDICE]} -le 30 
                        then
                            if test ${BASTOS[4]} -ne 0
                            then
                                if test ${JUGADOR4[$INDICE]} -eq $((${BASTOS[$PIVOTE_SUPB]}+1))
                                then
                                    PIVOTE_SUPB=$(($PIVOTE_SUPB+1))
                                    BASTOS[$PIVOTE_SUPB]=${JUGADOR4[$INDICE]}
                                    CORRECTO=1

                                fi
                                if test ${JUGADOR4[$INDICE]} -eq $((${BASTOS[$PIVOTE_INFB]}-1))
                                then
                                    PIVOTE_INFB=$(($PIVOTE_INFB-1))
                                    BASTOS[$PIVOTE_INFB]=${JUGADOR4[$INDICE]}
                                    CORRECTO=1
                                fi
                            else
                                if test ${JUGADOR4[$INDICE]} -eq 25
                                then
                                    BASTOS[4]=${JUGADOR4[$INDICE]}
                                    CORRECTO=1
                                fi
                            fi
                        fi

                        if test ${JUGADOR4[$INDICE]} -ge 31 -a ${JUGADOR4[$INDICE]} -le 40 
                        then
                            if test ${COPAS[4]} -ne 0
                            then
                                if test ${JUGADOR4[$INDICE]} -eq $((${COPAS[$PIVOTE_SUPC]}+1))
                                then
                                    PIVOTE_SUPC=$(($PIVOTE_SUPC+1))
                                    COPAS[$PIVOTE_SUPC]=${JUGADOR4[$INDICE]}
                                    CORRECTO=1

                                fi
                                if test ${JUGADOR4[$INDICE]} -eq $((${COPAS[$PIVOTE_INFC]}-1))
                                then
                                    PIVOTE_INFC=$(($PIVOTE_INFC-1))
                                    COPAS[$PIVOTE_INFC]=${JUGADOR4[$INDICE]}
                                    CORRECTO=1
                                fi
                            else
                                if test ${JUGADOR4[$INDICE]} -eq 35
                                then
                                    COPAS[4]=${JUGADOR4[$INDICE]}
                                    CORRECTO=1
                                fi
                            fi
                        fi

                        if test $CORRECTO -eq 1
                        then
                            while test $I -lt $CARTA4 -a $FIND -eq 0
                            do
                                if test ${JUGADOR4[$I]} -eq 5
                                then
                                    FIND=1
                                fi
                            I=$(($I+1))
                            done

                            echo "JUGADOR4 echa ${baraja[${JUGADOR4[$INDICE]}]}"      

                            J=$(($I-1))
                            if test $FIND -eq 1
                            then
                                while test $I -lt $CARTA4
                                do
                                    JUGADOR4[$J]=${JUGADOR4[$I]}
                                    I=$(($I+1))
                                    J=$(($J+1))
                                done
                                JUGADOR4[$(($CARTA4-1))]=0
                                CARTA4=$(($CARTA4-1))
                                SUM_TURNO=$(($SUM_TURNO+1))
                                TURNO=1
                                EXIT=1
                            fi
                        fi
                    fi
                fi  
            done
        fi
    fi