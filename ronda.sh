if test $TURNO -eq 2
then
        clear  #Limpio la pantalla
        I=0
        echo "                  RONDA $RONDA                  "
         echo ----------------------------------------------------------------
        echo "POS   '|'   JUGADOR  1   '|'   JUGADOR  2   '|'   JUGADOR  3  "
        echo ----------------------------------------------------------------
        while test $I -lt $CARTA1
        do 
            echo "$I.-    ${baraja[${JUGADOR2[$I]}]}     ${baraja[${JUGADOR2[$I]}]}     ${baraja[${JUGADOR3[$I]}]}"
            I=$(($I+1))
        done
        echo ----------------------------------------------------------------
        echo "  OROS   '|'   ESPADAS   '|'   BASTOS   '|'   COPAS"
        while test $I -le 10
        do 
            echo "${baraja[${OROS[$I]}]}   ${baraja[${ESPADAS[$I]}]}    ${baraja[${BASTOS[$I]}]}   ${baraja[${COPAS[$I]}]}"
            I=$(($I+1))
        done
        echo -----------------------------------------------------------------
        echo TURNO JUGADOR 2
        if test ${OROS[4]} -eq 0
        then
            echo COMIENZA EL 5 DE OROS
            echo
            I=0
            J=0
            FIND=0
            while test $I -lt $CARTA2 && $FIND -eq 0
            do
                if test ${JUGADOR2[$I]} -eq 5 
                then
                    FIND=1
                fi
                I=$(($I+1))
            done
            if test $FIND -eq 1 
            then
                ORO[4]=${JUGADOR2[$I]}
                PIVOTE_INFO=4
                PIVOTE_SUPO=4
                J=$I
                while test $J -lt $CARTA2
                do
                    JUGADOR2[$J]=${JUGADOR2[$(($J+1))]}
                    J=$(($J+1))
                done
                CARTA2=$(($I-1))
                TURNO=1
                SUM_TURNO=$(($SUM_TURNO+1))
            fi
        else

        SALIR=0
        while test $SALIR -eq 0 
        do
            if test $EST -eq 0
            then
                CORRECTO=0
                while test $CORRECTO -eq 0 
                do
                INDICE=$((1+ $RANDOM % $CARTAS2))
                FIND=0
                I=0
                while test $I -lt $CARTA2 -a $FIND -eq 0
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
                    if test ${JUGADOR2[$INDICE]} -ge 1 && ${JUGADOR2[$INDICE]} -le 10
                    then
                        if test ${OROS[4]} -eq 0
                        then
                            if test ${JUGADOR2[$INDICE]} -eq 5
                            then
                                ORO[4]=${JUGADOR2[$I]}
                                PIVOTE_INFO=4
                                PIVOTE_SUPO=4
                                while test $J -lt $CARTA2
                                do
                                    JUGADOR2[$J]=${JUGADOR2[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA2=$(($I-1))
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                TURNO=1
                                SALIR=1
                            else
                                CORRECTO=0
                            fi
                        else
                            if test ${JUGADOR2[$INDICE]} -lt ${OROS[PIVOTE_INFO]} -a ${JUGADOR2[$INDICE]} -eq $((${OROS[$PIVOTE_INFO]}-1))
                            then
                                PIVOTE_INFO=$(($PIVOTE_INFO-1))
                                OROS[$PIVOTE_INFO]=${JUGADOR2[$INDICE]}
                                while test $J -lt $CARTA2
                                do
                                    JUGADOR2[$J]=${JUGADOR2[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA2=$(($I-1))
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                TURNO=1
                                SALIR=1
                            fi
                            if test ${JUGADOR2[$INDICE]} -lt ${OROS[PIVOTE_SUPO]} -a ${JUGADOR2[$INDICE]} -eq$((${OROS[$PIVOTE_SUPO]}+1))
                            then
                                PIVOTE_SUPO=$(($PIVOTE_SUPO+1))
                                OROS[$PIVOTE_SUPO]=${JUGADOR2[$INDICE]}
                                while test $J -lt $CARTA2
                                do
                                    JUGADOR2[$J]=${JUGADOR2[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA2=$(($I-1))
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                TURNO=1
                                SALIR=1
                            fi
                        fi
                    fi

                    #PALO DE ESPADAS
                    if test ${JUGADOR2[$INDICE]} -ge 11 && ${JUGADOR2[$INDICE]} -le 20
                    then
                        if test ${ESPADAS[4]} -eq 0
                        then
                            if test ${JUGADOR2[$INDICE]} -eq 15
                            then
                                ESPADAS[4]=${JUGADOR2[$I]}
                                PIVOTE_INFE=4
                                PIVOTE_SUPE=4
                                while test $J -lt $CARTA2
                                do
                                    JUGADOR2[$J]=${JUGADOR2[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA2=$(($I-1))
                                TURNO=1
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                SALIR=1
                            else
                                CORRECTO=0
                            fi
                        else
                            if test ${JUGADOR2[$INDICE]} -lt ${ESPADAS[PIVOTE_INFE]} -a ${JUGADOR2[$INDICE]} -eq $((${ESPADAS[$PIVOTE_INFE]}-1))
                            then
                                PIVOTE_INFE=$(($PIVOTE_INFE-1))
                                ESPADAS[$PIVOTE_INFE]=${JUGADOR2[$INDICE]}
                                while test $J -lt $CARTA2
                                do
                                    JUGADOR2[$J]=${JUGADOR2[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA2=$(($I-1))
                                TURNO=1
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                SALIR=1
                            fi
                            if test ${JUGADOR2[$INDICE]} -lt ${ESPADAS[PIVOTE_SUPE]} -a ${JUGADOR2[$INDICE]} -eq$((${ESPADAS[$PIVOTE_SUPE]}+1))
                            then
                                PIVOTE_SUPE=$(($PIVOTE_SUPE+1))
                                ESPADAS[$PIVOTE_SUPE]=${JUGADOR2[$INDICE]}
                                while test $J -lt $CARTA2
                                do
                                    JUGADOR2[$J]=${JUGADOR2[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA2=$(($I-1))
                                TURNO=1
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                SALIR=1
                            fi
                        fi
                    fi

                    #PALO DE BASTOS
                    if test ${JUGADOR2[$INDICE]} -ge 21 && ${JUGADOR2[$INDICE]} -le 30
                    then
                        if test ${BASTOS[4]} -eq 0
                        then
                            if test ${JUGADOR2[$INDICE]}-eq25
                            then
                                BASTOS[4]=${JUGADOR2[$I]}
                                PIVOTE_INFB=4
                                PIVOTE_SUPB=4
                                while test $J -lt $CARTA2
                                do
                                    JUGADOR2[$J]=${JUGADOR2[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA2=$(($I-1))
                                TURNO=1
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                SALIR=1
                            else
                                CORRECTO=0
                            fi
                        else
                            if test ${JUGADOR2[$INDICE]} -lt ${BASTOS[PIVOTE_INFB]} -a ${JUGADOR2[$INDICE]} -eq $((${BASTOS[$PIVOTE_INFB]}-1))
                            then
                                PIVOTE_INFB=$(($PIVOTE_INFB-1))
                                OROS[$PIVOTE_INFB]=${JUGADOR2[$INDICE]}
                                while test $J -lt $CARTA2
                                do
                                    JUGADOR2[$J]=${JUGADOR2[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA2=$(($I-1))
                                TURNO=1
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                SALIR=1
                            fi
                            if test ${JUGADOR2[$INDICE]} -lt ${BASTOS[PIVOTE_SUPB]} -a ${JUGADOR2[$INDICE]} -eq$((${BASTOS[$PIVOTE_SUPB]}+1))
                            then
                                PIVOTE_SUPB=$(($PIVOTE_SUPB+1))
                                OROS[$PIVOTE_SUPB]=${JUGADOR2[$INDICE]}
                                while test $J -lt $CARTA2
                                do
                                    JUGADOR2[$J]=${JUGADOR2[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA2=$(($I-1))
                                TURNO=1
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                SALIR=1
                            fi
                        fi
                    fi

                    #PALO DE COPAS
                    if test ${JUGADOR2[$INDICE]} -ge 31 && ${JUGADOR2[$INDICE]} -le 40
                    then
                        if test ${COPAS[4]}-eq0
                        then
                            if test ${JUGADOR2[$INDICE]} -eq 35
                            then
                                ORO[4]=${JUGADOR2[$I]}
                                PIVOTE_INFC=4
                                PIVOTE_SUPC=4
                                while test $J -lt $CARTA2
                                do
                                    JUGADOR2[$J]=${JUGADOR2[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA2=$(($I-1))
                                TURNO=1
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                SALIR=1
                            else
                                CORRECTO=0
                            fi
                        else
                            if test ${JUGADOR2[$INDICE]} -lt ${BASTOS[PIVOTE_INFC]} -a ${JUGADOR2[$INDICE]} -eq $((${OBASTOSROS[$PIVOTE_INFC]}-1))
                            then
                                PIVOTE_INFC=$(($PIVOTE_INFC-1))
                                OROS[$PIVOTE_INFC]=${JUGADOR2[$INDICE]}
                                while test $J -lt $CARTA2
                                do
                                    JUGADOR2[$J]=${JUGADOR2[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA2=$(($I-1))
                                TURNO=1
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                SALIR=1
                            fi
                            if test ${JUGADOR2[$INDICE]} -lt ${COPAS[PIVOTE_SUPC]} -a ${JUGADOR2[$INDICE]} -eq $((${COPAS[$PIVOTE_SUPC]}+1))
                            then
                                PIVOTE_SUPC=$(($PIVOTE_SUPC+1))
                                OROS[$PIVOTE_SUPC]=${JUGADOR2[$INDICE]}
                                while test $J -lt $CARTA2
                                do
                                    JUGADOR2[$J]=${JUGADOR2[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA2=$(($I-1))
                                TURNO=1
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                SALIR=1
                            fi
                        fi
                    fi
                else
                    echo El indice selecionado no es valido, vuelva a seleccionarlo
                fi
            done
            fi
            if test $EST -eq 1
            then
                TURNO=1
                SALIR=1
            fi
            if test $EST -eq 2
            then
                echo 1
            fi 
        done
        fi
    fi