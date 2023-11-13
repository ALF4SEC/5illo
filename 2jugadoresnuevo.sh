            SALIR=0
            while test $SALIR -eq 0
            do
                INDICE=$((0+ $RANDOM % $(($CARTA2-1))))
                CORRECTO=0
                if test  $INDICE -ge 0 -a $INDICE -le $(($CARTA2-1))
                then
                    I=0
                    FIND=0
                    while test $I -lt 20 -a $FIND -eq 0
                    do
                        if test ${JUGADOR2[$I]} -eq ${JUGADOR2[$INDICE]}
                        then
                            FIND=1
                        fi
                            I=$(($I+1))
                    done

                    CORRECTO=0
                    if test $FIND -eq 1
                    then
                        if test ${JUGADOR2[$INDICE]} -ge 1 -a ${JUGADOR2[$INDICE]} -le 10 
                        then
                            if test ${OROS[4]} -ne 0
                            then
                                if test ${JUGADOR2[$INDICE]} -eq $((${OROS[$PIVOTE_SUPO]}+1))
                                then
                                    PIVOTE_SUPO=$(($PIVOTE_SUPO+1))
                                    OROS[$PIVOTE_SUPO]=${JUGADOR2[$INDICE]}
                                    CORRECTO=1

                                fi
                                if test ${JUGADOR2[$INDICE]} -eq $((${OROS[$PIVOTE_INFO]}-1))
                                then
                                    PIVOTE_INFO=$(($PIVOTE_INFO-1))
                                    OROS[$PIVOTE_INFO]=${JUGADOR2[$INDICE]}
                                    CORRECTO=1
                                fi
                            fi
                        fi

                        if test ${JUGADOR2[$INDICE]} -ge 11 -a ${JUGADOR2[$INDICE]} -le 20 
                        then
                            if test ${ESPADAS[4]} -ne 0
                            then
                                if test ${JUGADOR2[$INDICE]} -eq $((${ESPADAS[$PIVOTE_SUPE]}+1))
                                then
                                    PIVOTE_SUPO=$(($PIVOTE_SUPE+1))
                                    OROS[$PIVOTE_SUPE]=${JUGADOR2[$INDICE]}
                                    CORRECTO=1

                                fi
                                if test ${JUGADOR2[$INDICE]} -eq $((${ESPADAS[$PIVOTE_INFE]}-1))
                                then
                                    PIVOTE_INFE=$(($PIVOTE_INFE-1))
                                    ESPADAS[$PIVOTE_INFE]=${JUGADOR2[$INDICE]}
                                    CORRECTO=1
                                fi
                            else
                                if test ${JUGADOR2[$INDICE]} -eq 15
                                then
                                    ESPADAS[4]=${JUGADOR2[$INDICE]}
                                    CORRECTO=1
                                fi
                            fi
                        fi

                        if test ${JUGADOR2[$INDICE]} -ge 21 -a ${JUGADOR2[$INDICE]} -le 30 
                        then
                            if test ${BASTOS[4]} -ne 0
                            then
                                if test ${JUGADOR2[$INDICE]} -eq $((${BASTOS[$PIVOTE_SUPB]}+1))
                                then
                                    PIVOTE_SUPB=$(($PIVOTE_SUPB+1))
                                    BASTOS[$PIVOTE_SUPB]=${JUGADOR2[$INDICE]}
                                    CORRECTO=1

                                fi
                                if test ${JUGADOR2[$INDICE]} -eq $((${BASTOS[$PIVOTE_INFB]}-1))
                                then
                                    PIVOTE_INFB=$(($PIVOTE_INFB-1))
                                    BASTOS[$PIVOTE_INFB]=${JUGADOR2[$INDICE]}
                                    CORRECTO=1
                                fi
                            else
                                if test ${JUGADOR2[$INDICE]} -eq 25
                                then
                                    BASTOS[4]=${JUGADOR2[$INDICE]}
                                    CORRECTO=1
                                fi
                            fi
                        fi

                        if test ${JUGADOR2[$INDICE]} -ge 31 -a ${JUGADOR2[$INDICE]} -le 40 
                        then
                            if test ${COPAS[4]} -ne 0
                            then
                                if test ${JUGADOR2[$INDICE]} -eq $((${COPAS[$PIVOTE_SUPC]}+1))
                                then
                                    PIVOTE_SUPC=$(($PIVOTE_SUPC+1))
                                    COPAS[$PIVOTE_SUPC]=${JUGADOR2[$INDICE]}
                                    CORRECTO=1

                                fi
                                if test ${JUGADOR2[$INDICE]} -eq $((${COPAS[$PIVOTE_INFC]}-1))
                                then
                                    PIVOTE_INFC=$(($PIVOTE_INFC-1))
                                    COPAS[$PIVOTE_INFC]=${JUGADOR2[$INDICE]}
                                    CORRECTO=1
                                fi
                            else
                                if test ${JUGADOR2[$INDICE]} -eq 25
                                then
                                    BASTOS[4]=${JUGADOR2[$INDICE]}
                                    CORRECTO=1
                                fi
                            fi
                        fi

                        if test $CORRECTO -eq 1
                        then
                            while test $I -lt $CARTA2 -a $FIND -eq 0
                            do
                                if test ${JUGADOR2[$I]} -eq 5
                                then
                                    FIND=1
                                fi
                            I=$(($I+1))
                            done

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
                            JUGADOR2[$(($CARTA2-1))]=0
                            CARTA1=$(($CARTA2-1))
                            SUM_TURNO=$(($SUM_TURNO+1))
                            TURNO=1
                            SALIR=1
                        fi
                    fi
                fi  
            done