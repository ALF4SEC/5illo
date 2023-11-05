#!/bin/bash

SALIR=0
source config.cfg #otra opciOn serIa ./config.cfg
EST=$ESTRATEGIA
JUG=$JUGADORES
LG=$LOG
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

while test $SALIR -eq 0
do
#Presentacion del menu
echo 5illo
echo C')' Configuracion
echo J')' Jugar
echo E')' Estadisticas
echo F')' Clasificacion
echo S')' Salir

#Peticion de la opcion
echo Introduzca una opcion:
read OPCION

#Switch del menu
case $OPCION in
	c|C)
	SALIRCFG=0
	while test $SALIRCFG -eq 0
	do
	echo J')'Jugadores
	echo E')'Estrategia
	echo L')'Fichero LOG
	echo S')'Salir
	echo Elija que desea configurar
	read OPCIONCFG
	case $OPCIONCFG in
		j|J)
		echo 2')'2 Jugadores
		echo 3')'3 Jugadores
		echo 4')'4 Jugadores
		read OPCIONJGD
		case $OPCIONJGD in
			2)
			JUG=2
			cat >config.cfg <<END
			JUGADORES=$JUG
			ESTRATEGIA=$EST
			LOG=$LG
END
			;;
			3)
			JUG=3
			cat >config.cfg <<END
			JUGADORES=$JUG
			ESTRATEGIA=$EST
			LOG=$LG
END
			;;
			4)
			JUG=4
			cat >config.cfg <<END
			JUGADORES=$JUG
			ESTRATEGIA=$EST
			LOG=$LG
END
			;;
			*)
			echo "Opcion no valida"
			;;
		esac
		;;
		e|E)
		echo 0')'Cualquier estrategia
		echo 1')'Estrategia 1
		echo 2')'Estrategia 2
		read OPCIONEST
		case $OPCIONEST in
			0)
			EST=$((1+$RANDOM% 2))
			cat >config.cfg <<END
			JUGADORES=$JUG
			ESTRATEGIA=$EST
			LOG=$LG
END
			;;
			1)
			EST=1
			cat >config.cfg <<END
			JUGADORES=$JUG
			ESTRATEGIA=$EST
			LOG=$LG
END
			;;
			2)
			EST=2
			cat >config.cfg <<END
			JUGADORES=$JUG
			ESTRATEGIA=$EST
			LOG=$LG
END
			;;
			*)
			echo "Opcion no valida"
			;;
		esac
		;;	
		l|L)
		echo Escriba la direcciOn del fichero log
		read LG
		cat >config.cfg <<END
		JUGADORES=$JUG
		ESTRATEGIA=$EST
		LOG=$LG
END
		;;
		s|S)
		SALIRCFG=1
		;;
		*)
		echo "Error, opcion no valida"
		;;
	esac	
	done	
	;;
	j|J)
		clear
		START_TIME=$SECONDS #Pondremos esto al principio de cada partida
		
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
		if test $(($JUG%2)) -eq 0		#Comprobamos si el numero de jugadores es par, sino sera impar y habrá 3 jugadores
		then
			if test $JUG -eq 2	#Si es par el numero de jugadores que hay 2 ó 4
			then	
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
			    CARTAS=$(($CARTAS+$CARTAS2))
			    while test $I -le $CARTAS
			    do
				    JUGADOR2[$J]=${NUMEROS[$I]}
				    I=$(($I+1))
				    J=$(($J+1))
			    done
			    unset NUMEROS #Desdefinimos el vector de numeros aleatorios
                
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
                while test $FINAL -eq 0
                do  
                #Jugador1
                #USUARIO
                if test $TURNO -eq 1
                then
                clear  #Limpio la pantalla
                I=0
                echo "                  RONDA $RONDA                  "
                echo ----------------------------------------------------------------
                echo "POS   '|'   JUGADOR  1   '|'   JUGADOR  2"
                echo ----------------------------------------------------------------
                while test $I -lt $CARTA1
                do 
                    echo "$I.-    ${baraja[${JUGADOR1[$I]}]}     ${baraja[${JUGADOR2[$I]}]}"
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
                echo TURNO JUGADOR 1
                if test ${OROS[4]} -eq 0
                then
                echo COMIENZA EL 5 DE OROS
            echo
            I=0
            J=0
            FIND=0
            while test $I -lt $CARTA1 && $FIND -eq 0
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

        SALIR=0
        while test $SALIR -eq 0 
        do
        echo MENU JUGADOR 1
        echo 1')'Echar carta
        echo 2')'Pasar
        echo Dame la opcion
        read OPCION

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
                                SALIR=1
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
                                SALIR=1
                            fi
                            if test ${JUGADOR1[$INDICE]} -lt ${OROS[PIVOTE_SUPO]} -a ${JUGADOR1[$INDICE]} -eq$((${OROS[$PIVOTE_SUPO]}+1))
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
                                SALIR=1
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
                                SALIR=1
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
                                SALIR=1
                            fi
                            if test ${JUGADOR1[$INDICE]} -lt ${ESPADAS[PIVOTE_SUPE]} -a ${JUGADOR1[$INDICE]} -eq$((${ESPADAS[$PIVOTE_SUPE]}+1))
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
                                SALIR=1
                            fi
                        fi
                    fi

                    #PALO DE BASTOS
                    if test ${JUGADOR1[$INDICE]} -ge 21 && ${JUGADOR1[$INDICE]} -le 30
                    then
                        if test ${BASTOS[4]} -eq 0
                        then
                            if test ${JUGADOR1[$INDICE]}-eq25
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
                                SALIR=1
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
                                SALIR=1
                            fi
                            if test ${JUGADOR1[$INDICE]} -lt ${BASTOS[PIVOTE_SUPB]} -a ${JUGADOR1[$INDICE]} -eq$((${BASTOS[$PIVOTE_SUPB]}+1))
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
                                SALIR=1
                            fi
                        fi
                    fi

                    #PALO DE COPAS
                    if test ${JUGADOR1[$INDICE]} -ge 31 && ${JUGADOR1[$INDICE]} -le 40
                    then
                        if test ${COPAS[4]}-eq0
                        then
                            if test ${JUGADOR1[$INDICE]} -eq 35
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
                                SALIR=1
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
                                SALIR=1
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
                                SALIR=1
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
                SALIR=1
            ;;
            *)
                echo La opcion introducida no es valida, introduzcala otra vez
            ;;
        esac
        done
        fi
    fi
                #Fin Jugador1

                #Jugador2
                if test $TURNO -eq 2
    then
        clear  #Limpio la pantalla
        I=0
        echo "                  RONDA $RONDA                  "
         echo ----------------------------------------------------------------
        echo "POS   '|'   JUGADOR  1   '|'   JUGADOR  2   "
        echo ----------------------------------------------------------------
        while test $I -lt $CARTA1
        do 
            echo "$I.-    ${baraja[${JUGADOR2[$I]}]}     ${baraja[${JUGADOR2[$I]}]}     "
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
        if test [[${OROS[4]} -eq 0]]
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
                echo Estrategia no implementada
                CORRECTO=1
                TURNO=1
                SALIR=1
            fi
            if test $EST -eq 2
            then
                echo Estrategia no implementada
                CORRECTO=1
                TURNO=1
                SALIR=1
            fi 
        done
        fi
    fi
                #Fin Jugador2

        done
			else
			    CARTA1=10
			    CARTA2=10
			    CARTA3=10
			    CARTA4=10
			    CARTAS=0
			    declare -A JUGADOR1
			    declare -A JUGADOR2
			    declare -A JUGADOR3
			    declare -A JUGADOR4
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
			    J=0
			    CARTAS=$(($CARTAS+$CARTA3))
			    while test $I -le $CARTAS
			    do
				    JUGADOR3[$J]=${NUMEROS[$I]}
				    I=$(($I+1))
				    J=$(($J+1))
			    done
			    J=0
			    CARTAS=$(($CARTAS+$CARTA4))
			    while test $I -le $CARTAS
			    do
				    JUGADOR4[$J]=${NUMEROS[$I]}
				    I=$(($I+1))
				    J=$(($J+1))
			    done
                unset NUMEROS #Desdefinimos el vector de numeros aleatorios


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

                I=0
                EMPIEZA3=0
                while test $I -lt $CARTA3 -a $EMPIEZA3 -eq 0
                do 
                if test ${JUGADOR3[$I]} -eq 5
                then
                    EMPIEZA3=1
                fi
                    I=$(($I+1))
                done

                if test $EMPIEZA3 -eq 1
                then
                    TURNO=3;
                fi

                I=0
                EMPIEZA4=0
                while test $I -lt $CARTA4 -a $EMPIEZA4 -eq 0
                do 
                if test ${JUGADOR4[$I]} -eq 5
                then
                    EMPIEZA4=1
                fi
                    I=$(($I+1))
                done

                if test $EMPIEZA4 -eq 1
                then
                    TURNO=4;
                fi

                while test $FINAL -eq 0
                do
                    #Jugador1
                    if test $TURNO -eq 1
    then
        clear  #Limpio la pantalla
        I=0
        echo "                  RONDA $RONDA                  "
         echo ----------------------------------------------------------------
        echo "POS   '|'   JUGADOR  1   '|'   JUGADOR  2   '|'   JUGADOR  3  '|'   JUGADOR  4  "
        echo ----------------------------------------------------------------
        while test $I -lt $CARTA1
        do 
            echo "$I.-    ${baraja[${JUGADOR1[$I]}]}     ${baraja[${JUGADOR2[$I]}]}     ${baraja[${JUGADOR3[$I]}]}     ${baraja[${JUGADOR4[$I]}]}"
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
        echo TURNO JUGADOR 1
        if test ${OROS[4]} -eq 0
        then
            echo COMIENZA EL 5 DE OROS
            echo
            I=0
            J=0
            FIND=0
            while test $I -lt $CARTA1 && $FIND -eq 0
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

        SALIR=0
        while test $SALIR -eq 0 
        do
        echo MENU JUGADOR 1
        echo 1')'Echar carta
        echo 2')'Pasar
        echo Dame la opcion
        read OPCION

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
                                SALIR=1
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
                                SALIR=1
                            fi
                            if test ${JUGADOR1[$INDICE]} -lt ${OROS[PIVOTE_SUPO]} -a ${JUGADOR1[$INDICE]} -eq$((${OROS[$PIVOTE_SUPO]}+1))
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
                                SALIR=1
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
                                SALIR=1
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
                                SALIR=1
                            fi
                            if test ${JUGADOR1[$INDICE]} -lt ${ESPADAS[PIVOTE_SUPE]} -a ${JUGADOR1[$INDICE]} -eq$((${ESPADAS[$PIVOTE_SUPE]}+1))
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
                                SALIR=1
                            fi
                        fi
                    fi

                    #PALO DE BASTOS
                    if test ${JUGADOR1[$INDICE]} -ge 21 && ${JUGADOR1[$INDICE]} -le 30
                    then
                        if test ${BASTOS[4]} -eq 0
                        then
                            if test ${JUGADOR1[$INDICE]}-eq25
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
                                SALIR=1
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
                                SALIR=1
                            fi
                            if test ${JUGADOR1[$INDICE]} -lt ${BASTOS[PIVOTE_SUPB]} -a ${JUGADOR1[$INDICE]} -eq$((${BASTOS[$PIVOTE_SUPB]}+1))
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
                                SALIR=1
                            fi
                        fi
                    fi

                    #PALO DE COPAS
                    if test ${JUGADOR1[$INDICE]} -ge 31 && ${JUGADOR1[$INDICE]} -le 40
                    then
                        if test ${COPAS[4]}-eq0
                        then
                            if test ${JUGADOR1[$INDICE]} -eq 35
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
                                SALIR=1
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
                                SALIR=1
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
                                SALIR=1
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
                SALIR=1
            ;;
            *)
                echo La opcion introducida no es valida, introduzcala otra vez
            ;;
        esac
        done
        fi
    fi
                    #Fin Jugador1

                    #Jugador2
                    if test $TURNO -eq 2
    then
        clear  #Limpio la pantalla
        I=0
        echo "                  RONDA $RONDA                  "
         echo ----------------------------------------------------------------
        echo "POS   '|'   JUGADOR  1   '|'   JUGADOR  2   '|'   JUGADOR  3  '|'   JUGADOR  4  "
        echo ----------------------------------------------------------------
        while test $I -lt $CARTA1
        do 
            echo "$I.-    ${baraja[${JUGADOR2[$I]}]}     ${baraja[${JUGADOR2[$I]}]}     ${baraja[${JUGADOR3[$I]}]}     ${baraja[${JUGADOR4[$I]}]}"
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
        if test [[${OROS[4]} -eq 0]]
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
                TURNO=2
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
                                TURNO=2
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
                                TURNO=2
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
                                TURNO=2
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
                                TURNO=2
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
                                TURNO=2
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
                                TURNO=2
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
                                TURNO=2
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
                                TURNO=2
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
                                TURNO=2
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
                                TURNO=2
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
                                TURNO=2
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
                                TURNO=2
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
                echo Estrategia no implementada
                CORRECTO=1
                TURNO=2
                SALIR=1
            fi
            if test $EST -eq 2
            then
                echo Estrategia no implementada
                CORRECTO=1
                TURNO=2
                SALIR=1
            fi 
        done
        fi
    fi
                    #Fin Jugador2

                    #Jugador3
if test $TURNO -eq 3
    then
        clear  #Limpio la pantalla
        I=0
        echo "                  RONDA $RONDA                  "
         echo ----------------------------------------------------------------
        echo "POS   '|'   JUGADOR  1   '|'   JUGADOR  2   '|'   JUGADOR  3  '|'   JUGADOR  4  "
        echo ----------------------------------------------------------------
        while test $I -lt $CARTA1
        do 
            echo "$I.-    ${baraja[${JUGADOR3[$I]}]}     ${baraja[${JUGADOR3[$I]}]}     ${baraja[${JUGADOR3[$I]}]}      ${baraja[${JUGADOR3[$I]}]}"
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
        echo TURNO JUGADOR 3
        if test [[${OROS[4]} -eq 0]]
        then
            echo COMIENZA EL 5 DE OROS
            echo
            I=0
            J=0
            FIND=0
            while test $I -lt $CARTA2 && $FIND -eq 0
            do
                if test ${JUGADOR3[$I]} -eq 5 
                then
                    FIND=1
                fi
                I=$(($I+1))
            done
            if test $FIND -eq 1 
            then
                ORO[4]=${JUGADOR3[$I]}
                PIVOTE_INFO=4
                PIVOTE_SUPO=4
                J=$I
                while test $J -lt $CARTA3
                do
                    JUGADOR3[$J]=${JUGADOR3[$(($J+1))]}
                    J=$(($J+1))
                done
                CARTA3=$(($I-1))
                TURNO=4
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
                while test $I -lt $CARTA3 -a $FIND -eq 0
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
                    if test ${JUGADOR3[$INDICE]} -ge 1 && ${JUGADOR3[$INDICE]} -le 10
                    then
                        if test ${OROS[4]} -eq 0
                        then
                            if test ${JUGADOR3[$INDICE]} -eq 5
                            then
                                ORO[4]=${JUGADOR3[$I]}
                                PIVOTE_INFO=4
                                PIVOTE_SUPO=4
                                while test $J -lt $CARTA3
                                do
                                    JUGADOR3[$J]=${JUGADOR3[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA3=$(($I-1))
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                TURNO=4
                                SALIR=1
                            else
                                CORRECTO=0
                            fi
                        else
                            if test ${JUGADOR3[$INDICE]} -lt ${OROS[PIVOTE_INFO]} -a ${JUGADOR3[$INDICE]} -eq $((${OROS[$PIVOTE_INFO]}-1))
                            then
                                PIVOTE_INFO=$(($PIVOTE_INFO-1))
                                OROS[$PIVOTE_INFO]=${JUGADOR3[$INDICE]}
                                while test $J -lt $CARTA3
                                do
                                    JUGADOR3[$J]=${JUGADOR3[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA3=$(($I-1))
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                TURNO=4
                                SALIR=1
                            fi
                            if test ${JUGADOR3[$INDICE]} -lt ${OROS[PIVOTE_SUPO]} -a ${JUGADOR3[$INDICE]} -eq$((${OROS[$PIVOTE_SUPO]}+1))
                            then
                                PIVOTE_SUPO=$(($PIVOTE_SUPO+1))
                                OROS[$PIVOTE_SUPO]=${JUGADOR3[$INDICE]}
                                while test $J -lt $CARTA3
                                do
                                    JUGADOR3[$J]=${JUGADOR3[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA3=$(($I-1))
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                TURNO=4
                                SALIR=1
                            fi
                        fi
                    fi

                    #PALO DE ESPADAS
                    if test ${JUGADOR3[$INDICE]} -ge 11 && ${JUGADOR3[$INDICE]} -le 20
                    then
                        if test ${ESPADAS[4]} -eq 0
                        then
                            if test ${JUGADOR3[$INDICE]} -eq 15
                            then
                                ESPADAS[4]=${JUGADOR3[$I]}
                                PIVOTE_INFE=4
                                PIVOTE_SUPE=4
                                while test $J -lt $CARTA3
                                do
                                    JUGADOR3[$J]=${JUGADOR3[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA3=$(($I-1))
                                TURNO=4
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                SALIR=1
                            else
                                CORRECTO=0
                            fi
                        else
                            if test ${JUGADOR3[$INDICE]} -lt ${ESPADAS[PIVOTE_INFE]} -a ${JUGADOR3[$INDICE]} -eq $((${ESPADAS[$PIVOTE_INFE]}-1))
                            then
                                PIVOTE_INFE=$(($PIVOTE_INFE-1))
                                ESPADAS[$PIVOTE_INFE]=${JUGADOR3[$INDICE]}
                                while test $J -lt $CARTA3
                                do
                                    JUGADOR3[$J]=${JUGADOR3[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA3=$(($I-1))
                                TURNO=4
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                SALIR=1
                            fi
                            if test ${JUGADOR3[$INDICE]} -lt ${ESPADAS[PIVOTE_SUPE]} -a ${JUGADOR3[$INDICE]} -eq$((${ESPADAS[$PIVOTE_SUPE]}+1))
                            then
                                PIVOTE_SUPE=$(($PIVOTE_SUPE+1))
                                ESPADAS[$PIVOTE_SUPE]=${JUGADOR3[$INDICE]}
                                while test $J -lt $CARTA3
                                do
                                    JUGADOR3[$J]=${JUGADOR3[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA3=$(($I-1))
                                TURNO=4
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                SALIR=1
                            fi
                        fi
                    fi

                    #PALO DE BASTOS
                    if test ${JUGADOR3[$INDICE]} -ge 21 && ${JUGADOR3[$INDICE]} -le 30
                    then
                        if test ${BASTOS[4]} -eq 0
                        then
                            if test ${JUGADOR3[$INDICE]}-eq25
                            then
                                BASTOS[4]=${JUGADOR3[$I]}
                                PIVOTE_INFB=4
                                PIVOTE_SUPB=4
                                while test $J -lt $CARTA3
                                do
                                    JUGADOR3[$J]=${JUGADOR3[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA3=$(($I-1))
                                TURNO=4
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                SALIR=1
                            else
                                CORRECTO=0
                            fi
                        else
                            if test ${JUGADOR3[$INDICE]} -lt ${BASTOS[PIVOTE_INFB]} -a ${JUGADOR3[$INDICE]} -eq $((${BASTOS[$PIVOTE_INFB]}-1))
                            then
                                PIVOTE_INFB=$(($PIVOTE_INFB-1))
                                OROS[$PIVOTE_INFB]=${JUGADOR3[$INDICE]}
                                while test $J -lt $CARTA3
                                do
                                    JUGADOR3[$J]=${JUGADOR3[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA3=$(($I-1))
                                TURNO=4
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                SALIR=1
                            fi
                            if test ${JUGADOR3[$INDICE]} -lt ${BASTOS[PIVOTE_SUPB]} -a ${JUGADOR3[$INDICE]} -eq$((${BASTOS[$PIVOTE_SUPB]}+1))
                            then
                                PIVOTE_SUPB=$(($PIVOTE_SUPB+1))
                                OROS[$PIVOTE_SUPB]=${JUGADOR3[$INDICE]}
                                while test $J -lt $CARTA3
                                do
                                    JUGADOR3[$J]=${JUGADOR3[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA3=$(($I-1))
                                TURNO=4
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                SALIR=1
                            fi
                        fi
                    fi

                    #PALO DE COPAS
                    if test ${JUGADOR3[$INDICE]} -ge 31 && ${JUGADOR3[$INDICE]} -le 40
                    then
                        if test ${COPAS[4]}-eq0
                        then
                            if test ${JUGADOR3[$INDICE]} -eq 35
                            then
                                ORO[4]=${JUGADOR3[$I]}
                                PIVOTE_INFC=4
                                PIVOTE_SUPC=4
                                while test $J -lt $CARTA3
                                do
                                    JUGADOR3[$J]=${JUGADOR3[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA3=$(($I-1))
                                TURNO=4
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                SALIR=1
                            else
                                CORRECTO=0
                            fi
                        else
                            if test ${JUGADOR3[$INDICE]} -lt ${BASTOS[PIVOTE_INFC]} -a ${JUGADOR3[$INDICE]} -eq $((${OBASTOSROS[$PIVOTE_INFC]}-1))
                            then
                                PIVOTE_INFC=$(($PIVOTE_INFC-1))
                                OROS[$PIVOTE_INFC]=${JUGADOR3[$INDICE]}
                                while test $J -lt $CARTA3
                                do
                                    JUGADOR3[$J]=${JUGADOR3[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA3=$(($I-1))
                                TURNO=4
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                SALIR=1
                            fi
                            if test ${JUGADOR3[$INDICE]} -lt ${COPAS[PIVOTE_SUPC]} -a ${JUGADOR3[$INDICE]} -eq $((${COPAS[$PIVOTE_SUPC]}+1))
                            then
                                PIVOTE_SUPC=$(($PIVOTE_SUPC+1))
                                OROS[$PIVOTE_SUPC]=${JUGADOR3[$INDICE]}
                                while test $J -lt $CARTA3
                                do
                                    JUGADOR3[$J]=${JUGADOR3[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA3=$(($I-1))
                                TURNO=4
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
                echo Estrategia no implementada
                CORRECTO=1
                TURNO=4
                SALIR=1
            fi
            if test $EST -eq 2
            then
                echo Estrategia no implementada
                CORRECTO=1
                TURNO=4
                SALIR=1
            fi 
        done
        fi
    fi
                    #Fin Jugador3

                    #Jugador4
            if test $TURNO -eq 4
    then
        clear  #Limpio la pantalla
        I=0
        echo "                  RONDA $RONDA                  "
         echo ----------------------------------------------------------------
        echo "POS   '|'   JUGADOR  1   '|'   JUGADOR  2   '|'   JUGADOR  3  '|'   JUGADOR  4  "
        echo ----------------------------------------------------------------
        while test $I -lt $CARTA1
        do 
            echo "$I.-    ${baraja[${JUGADOR4[$I]}]}     ${baraja[${JUGADOR4[$I]}]}     ${baraja[${JUGADOR4[$I]}]}      ${baraja[${JUGADOR4[$I]}]}"
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
        echo TURNO JUGADOR 4
        if test [[${OROS[4]} -eq 0]]
        then
            echo COMIENZA EL 5 DE OROS
            echo
            I=0
            J=0
            FIND=0
            while test $I -lt $CARTA2 && $FIND -eq 0
            do
                if test ${JUGADOR4[$I]} -eq 5 
                then
                    FIND=1
                fi
                I=$(($I+1))
            done
            if test $FIND -eq 1 
            then
                ORO[4]=${JUGADOR4[$I]}
                PIVOTE_INFO=4
                PIVOTE_SUPO=4
                J=$I
                while test $J -lt $CARTA4
                do
                    JUGADOR4[$J]=${JUGADOR4[$(($J+1))]}
                    J=$(($J+1))
                done
                CARTA4=$(($I-1))
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
                while test $I -lt $CARTA4 -a $FIND -eq 0
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
                    if test ${JUGADOR4[$INDICE]} -ge 1 && ${JUGADOR4[$INDICE]} -le 10
                    then
                        if test ${OROS[4]} -eq 0
                        then
                            if test ${JUGADOR4[$INDICE]} -eq 5
                            then
                                ORO[4]=${JUGADOR4[$I]}
                                PIVOTE_INFO=4
                                PIVOTE_SUPO=4
                                while test $J -lt $CARTA4
                                do
                                    JUGADOR4[$J]=${JUGADOR4[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA4=$(($I-1))
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                TURNO=1
                                SALIR=1
                            else
                                CORRECTO=0
                            fi
                        else
                            if test ${JUGADOR4[$INDICE]} -lt ${OROS[PIVOTE_INFO]} -a ${JUGADOR4[$INDICE]} -eq $((${OROS[$PIVOTE_INFO]}-1))
                            then
                                PIVOTE_INFO=$(($PIVOTE_INFO-1))
                                OROS[$PIVOTE_INFO]=${JUGADOR4[$INDICE]}
                                while test $J -lt $CARTA4
                                do
                                    JUGADOR4[$J]=${JUGADOR4[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA4=$(($I-1))
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                TURNO=1
                                SALIR=1
                            fi
                            if test ${JUGADOR4[$INDICE]} -lt ${OROS[PIVOTE_SUPO]} -a ${JUGADOR4[$INDICE]} -eq$((${OROS[$PIVOTE_SUPO]}+1))
                            then
                                PIVOTE_SUPO=$(($PIVOTE_SUPO+1))
                                OROS[$PIVOTE_SUPO]=${JUGADOR4[$INDICE]}
                                while test $J -lt $CARTA4
                                do
                                    JUGADOR4[$J]=${JUGADOR4[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA4=$(($I-1))
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                TURNO=1
                                SALIR=1
                            fi
                        fi
                    fi

                    #PALO DE ESPADAS
                    if test ${JUGADOR4[$INDICE]} -ge 11 && ${JUGADOR4[$INDICE]} -le 20
                    then
                        if test ${ESPADAS[4]} -eq 0
                        then
                            if test ${JUGADOR4[$INDICE]} -eq 15
                            then
                                ESPADAS[4]=${JUGADOR4[$I]}
                                PIVOTE_INFE=4
                                PIVOTE_SUPE=4
                                while test $J -lt $CARTA4
                                do
                                    JUGADOR4[$J]=${JUGADOR4[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA4=$(($I-1))
                                TURNO=1
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                SALIR=1
                            else
                                CORRECTO=0
                            fi
                        else
                            if test ${JUGADOR4[$INDICE]} -lt ${ESPADAS[PIVOTE_INFE]} -a ${JUGADOR4[$INDICE]} -eq $((${ESPADAS[$PIVOTE_INFE]}-1))
                            then
                                PIVOTE_INFE=$(($PIVOTE_INFE-1))
                                ESPADAS[$PIVOTE_INFE]=${JUGADOR4[$INDICE]}
                                while test $J -lt $CARTA4
                                do
                                    JUGADOR4[$J]=${JUGADOR4[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA4=$(($I-1))
                                TURNO=1
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                SALIR=1
                            fi
                            if test ${JUGADOR4[$INDICE]} -lt ${ESPADAS[PIVOTE_SUPE]} -a ${JUGADOR4[$INDICE]} -eq$((${ESPADAS[$PIVOTE_SUPE]}+1))
                            then
                                PIVOTE_SUPE=$(($PIVOTE_SUPE+1))
                                ESPADAS[$PIVOTE_SUPE]=${JUGADOR4[$INDICE]}
                                while test $J -lt $CARTA4
                                do
                                    JUGADOR4[$J]=${JUGADOR4[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA4=$(($I-1))
                                TURNO=1
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                SALIR=1
                            fi
                        fi
                    fi

                    #PALO DE BASTOS
                    if test ${JUGADOR4[$INDICE]} -ge 21 && ${JUGADOR4[$INDICE]} -le 30
                    then
                        if test ${BASTOS[4]} -eq 0
                        then
                            if test ${JUGADOR4[$INDICE]}-eq25
                            then
                                BASTOS[4]=${JUGADOR4[$I]}
                                PIVOTE_INFB=4
                                PIVOTE_SUPB=4
                                while test $J -lt $CARTA4
                                do
                                    JUGADOR4[$J]=${JUGADOR4[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA4=$(($I-1))
                                TURNO=1
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                SALIR=1
                            else
                                CORRECTO=0
                            fi
                        else
                            if test ${JUGADOR4[$INDICE]} -lt ${BASTOS[PIVOTE_INFB]} -a ${JUGADOR4[$INDICE]} -eq $((${BASTOS[$PIVOTE_INFB]}-1))
                            then
                                PIVOTE_INFB=$(($PIVOTE_INFB-1))
                                OROS[$PIVOTE_INFB]=${JUGADOR4[$INDICE]}
                                while test $J -lt $CARTA4
                                do
                                    JUGADOR4[$J]=${JUGADOR4[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA4=$(($I-1))
                                TURNO=1
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                SALIR=1
                            fi
                            if test ${JUGADOR4[$INDICE]} -lt ${BASTOS[PIVOTE_SUPB]} -a ${JUGADOR4[$INDICE]} -eq$((${BASTOS[$PIVOTE_SUPB]}+1))
                            then
                                PIVOTE_SUPB=$(($PIVOTE_SUPB+1))
                                OROS[$PIVOTE_SUPB]=${JUGADOR4[$INDICE]}
                                while test $J -lt $CARTA4
                                do
                                    JUGADOR4[$J]=${JUGADOR4[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA4=$(($I-1))
                                TURNO=1
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                SALIR=1
                            fi
                        fi
                    fi

                    #PALO DE COPAS
                    if test ${JUGADOR4[$INDICE]} -ge 31 && ${JUGADOR4[$INDICE]} -le 40
                    then
                        if test ${COPAS[4]}-eq0
                        then
                            if test ${JUGADOR4[$INDICE]} -eq 35
                            then
                                ORO[4]=${JUGADOR4[$I]}
                                PIVOTE_INFC=4
                                PIVOTE_SUPC=4
                                while test $J -lt $CARTA4
                                do
                                    JUGADOR4[$J]=${JUGADOR4[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA4=$(($I-1))
                                TURNO=1
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                SALIR=1
                            else
                                CORRECTO=0
                            fi
                        else
                            if test ${JUGADOR4[$INDICE]} -lt ${BASTOS[PIVOTE_INFC]} -a ${JUGADOR4[$INDICE]} -eq $((${OBASTOSROS[$PIVOTE_INFC]}-1))
                            then
                                PIVOTE_INFC=$(($PIVOTE_INFC-1))
                                OROS[$PIVOTE_INFC]=${JUGADOR4[$INDICE]}
                                while test $J -lt $CARTA4
                                do
                                    JUGADOR4[$J]=${JUGADOR4[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA4=$(($I-1))
                                TURNO=1
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                SALIR=1
                            fi
                            if test ${JUGADOR4[$INDICE]} -lt ${COPAS[PIVOTE_SUPC]} -a ${JUGADOR4[$INDICE]} -eq $((${COPAS[$PIVOTE_SUPC]}+1))
                            then
                                PIVOTE_SUPC=$(($PIVOTE_SUPC+1))
                                OROS[$PIVOTE_SUPC]=${JUGADOR4[$INDICE]}
                                while test $J -lt $CARTA4
                                do
                                    JUGADOR4[$J]=${JUGADOR4[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA4=$(($I-1))
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
                echo Estrategia no implementada
                CORRECTO=1
                TURNO=1
                SALIR=1
            fi
            if test $EST -eq 2
            then
                echo Estrategia no implementada
                CORRECTO=1
                TURNO=1
                SALIR=1
            fi 
        done
        fi
    fi

                    #Fin Jugador4
                    if test $CARTA1 -eq 0
                    then
                    GANADOR=1
                    PUNTUAJE=$CARTA2+$CARTA3+$CARTA4
                    FINAL=1
                    fi

                    if test $CARTA2 -eq 0
                    then
                        GANADOR=2
                        PUNTUAJE=$CARTA1+$CARTA3+$CARTA4
                        FINAL=1
                    fi

                    if test $CARTA3 -eq 0
                    then
                        GANADOR=3
                        PUNTUAJE=$CARTA1+$CARTA2+$CARTA4
                        FINAL=1
                    fi

                    if test $CARTA4 -eq 0
                    then
                        GANADOR=4
                        PUNTUAJE=$CARTA1+$CARTA2+$CARTA3
                        FINAL=1
                    fi

                    if test $SUM_TURNO -eq 4
                    then 
                        RONDA=$(($RONDA+1))
                        SUM_TURNO=0
                    fi
                done

			fi
		else
		    CARTA1=14
		    CARTA2=13
		    CARTA3=13
		    CARTAS=0
		    declare -A JUGADOR1
		    declare -A JUGADOR2
		    declare -A JUGADOR3 
		    while test $I -le $CARTA1
		    do
			    JUGADOR1[$J]=${NUMEROS[$I]}
			    I=$(($I+1))
			    J=$(($J+1))
		    done
		    J=0
		    CARTAS=$(($CARTA1+$CARTA2))
		    while test $I -le $CARTAS
		    do
			    JUGADOR2[$J]=${NUMEROS[$I]}
			    I=$(($I+1))
			    J=$(($J+1))
		    done
		    J=0
		    CARTAS=$(($CARTAS+$CARTA3))
		    while test $I -le $CARTAS
		    do
			    JUGADOR3[$J]=${NUMEROS[$I]}
			    I=$(($I+1))
			    J=$(($J+1))
		    done

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

                I=0
                EMPIEZA3=0
                while test $I -lt $CARTA3 -a $EMPIEZA3 -eq 0
                do 
                if test ${JUGADOR3[$I]} -eq 5
                then
                    EMPIEZA3=1
                fi
                    I=$(($I+1))
                done

                if test $EMPIEZA3 -eq 1
                then
                    TURNO=3;
                fi

                while test $FINAL -eq 0
                do
                    #Jugador1
                    if test $TURNO -eq 1
    then
        clear  #Limpio la pantalla
        I=0
        echo "                  RONDA $RONDA                  "
         echo ----------------------------------------------------------------
        echo "POS   '|'   JUGADOR  1   '|'   JUGADOR  2   '|'   JUGADOR  3  "
        echo ----------------------------------------------------------------
        while test $I -lt $CARTA1
        do 
            echo "$I.-    ${baraja[${JUGADOR1[$I]}]}     ${baraja[${JUGADOR2[$I]}]}     ${baraja[${JUGADOR3[$I]}]}"
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
        echo TURNO JUGADOR 1
        if test ${OROS[4]} -eq 0
        then
            echo COMIENZA EL 5 DE OROS
            echo
            I=0
            J=0
            FIND=0
            while test $I -lt $CARTA1 && $FIND -eq 0
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

        SALIR=0
        while test $SALIR -eq 0 
        do
        echo MENU JUGADOR 1
        echo 1')'Echar carta
        echo 2')'Pasar
        echo Dame la opcion
        read OPCION

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
                                SALIR=1
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
                                SALIR=1
                            fi
                            if test ${JUGADOR1[$INDICE]} -lt ${OROS[PIVOTE_SUPO]} -a ${JUGADOR1[$INDICE]} -eq$((${OROS[$PIVOTE_SUPO]}+1))
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
                                SALIR=1
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
                                SALIR=1
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
                                SALIR=1
                            fi
                            if test ${JUGADOR1[$INDICE]} -lt ${ESPADAS[PIVOTE_SUPE]} -a ${JUGADOR1[$INDICE]} -eq$((${ESPADAS[$PIVOTE_SUPE]}+1))
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
                                SALIR=1
                            fi
                        fi
                    fi

                    #PALO DE BASTOS
                    if test ${JUGADOR1[$INDICE]} -ge 21 && ${JUGADOR1[$INDICE]} -le 30
                    then
                        if test ${BASTOS[4]} -eq 0
                        then
                            if test ${JUGADOR1[$INDICE]}-eq25
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
                                SALIR=1
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
                                SALIR=1
                            fi
                            if test ${JUGADOR1[$INDICE]} -lt ${BASTOS[PIVOTE_SUPB]} -a ${JUGADOR1[$INDICE]} -eq$((${BASTOS[$PIVOTE_SUPB]}+1))
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
                                SALIR=1
                            fi
                        fi
                    fi

                    #PALO DE COPAS
                    if test ${JUGADOR1[$INDICE]} -ge 31 && ${JUGADOR1[$INDICE]} -le 40
                    then
                        if test ${COPAS[4]}-eq0
                        then
                            if test ${JUGADOR1[$INDICE]} -eq 35
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
                                SALIR=1
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
                                SALIR=1
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
                                SALIR=1
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
                SALIR=1
            ;;
            *)
                echo La opcion introducida no es valida, introduzcala otra vez
            ;;
        esac
        done
        fi
    fi
                    #Fin Jugador1

                    #Jugador2
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
        if test [[${OROS[4]} -eq 0]]
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
                TURNO=3
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
                                TURNO=3
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
                                TURNO=3
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
                                TURNO=3
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
                                TURNO=3
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
                                TURNO=3
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
                                TURNO=3
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
                                TURNO=3
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
                                TURNO=3
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
                                TURNO=3
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
                                TURNO=3
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
                                TURNO=3
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
                                TURNO=3
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
                echo Estrategia no implementada
                CORRECTO=1
                TURNO=3
                SALIR=1
            fi
            if test $EST -eq 2
            then
                echo Estrategia no implementada
                CORRECTO=1
                TURNO=3
                SALIR=1
            fi 
        done
        fi
    fi
                    #Fin Jugador2

                    #Jugador3
                    if test $TURNO -eq 3
    then
        clear  #Limpio la pantalla
        I=0
        echo "                  RONDA $RONDA                  "
         echo ----------------------------------------------------------------
        echo "POS   '|'   JUGADOR  1   '|'   JUGADOR  2   '|'   JUGADOR  3  '|'   JUGADOR  4  "
        echo ----------------------------------------------------------------
        while test $I -lt $CARTA1
        do 
            echo "$I.-    ${baraja[${JUGADOR3[$I]}]}     ${baraja[${JUGADOR3[$I]}]}     ${baraja[${JUGADOR3[$I]}]}      ${baraja[${JUGADOR3[$I]}]}"
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
        echo TURNO JUGADOR 3
        if test [[${OROS[4]} -eq 0]]
        then
            echo COMIENZA EL 5 DE OROS
            echo
            I=0
            J=0
            FIND=0
            while test $I -lt $CARTA2 && $FIND -eq 0
            do
                if test ${JUGADOR3[$I]} -eq 5 
                then
                    FIND=1
                fi
                I=$(($I+1))
            done
            if test $FIND -eq 1 
            then
                ORO[4]=${JUGADOR3[$I]}
                PIVOTE_INFO=4
                PIVOTE_SUPO=4
                J=$I
                while test $J -lt $CARTA3
                do
                    JUGADOR3[$J]=${JUGADOR3[$(($J+1))]}
                    J=$(($J+1))
                done
                CARTA3=$(($I-1))
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
                while test $I -lt $CARTA3 -a $FIND -eq 0
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
                    if test ${JUGADOR3[$INDICE]} -ge 1 && ${JUGADOR3[$INDICE]} -le 10
                    then
                        if test ${OROS[4]} -eq 0
                        then
                            if test ${JUGADOR3[$INDICE]} -eq 5
                            then
                                ORO[4]=${JUGADOR3[$I]}
                                PIVOTE_INFO=4
                                PIVOTE_SUPO=4
                                while test $J -lt $CARTA3
                                do
                                    JUGADOR3[$J]=${JUGADOR3[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA3=$(($I-1))
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                TURNO=2
                                SALIR=1
                            else
                                CORRECTO=0
                            fi
                        else
                            if test ${JUGADOR3[$INDICE]} -lt ${OROS[PIVOTE_INFO]} -a ${JUGADOR3[$INDICE]} -eq $((${OROS[$PIVOTE_INFO]}-1))
                            then
                                PIVOTE_INFO=$(($PIVOTE_INFO-1))
                                OROS[$PIVOTE_INFO]=${JUGADOR3[$INDICE]}
                                while test $J -lt $CARTA3
                                do
                                    JUGADOR3[$J]=${JUGADOR3[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA3=$(($I-1))
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                TURNO=2
                                SALIR=1
                            fi
                            if test ${JUGADOR3[$INDICE]} -lt ${OROS[PIVOTE_SUPO]} -a ${JUGADOR3[$INDICE]} -eq$((${OROS[$PIVOTE_SUPO]}+1))
                            then
                                PIVOTE_SUPO=$(($PIVOTE_SUPO+1))
                                OROS[$PIVOTE_SUPO]=${JUGADOR3[$INDICE]}
                                while test $J -lt $CARTA3
                                do
                                    JUGADOR3[$J]=${JUGADOR3[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA3=$(($I-1))
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                TURNO=2
                                SALIR=1
                            fi
                        fi
                    fi

                    #PALO DE ESPADAS
                    if test ${JUGADOR3[$INDICE]} -ge 11 && ${JUGADOR3[$INDICE]} -le 20
                    then
                        if test ${ESPADAS[4]} -eq 0
                        then
                            if test ${JUGADOR3[$INDICE]} -eq 15
                            then
                                ESPADAS[4]=${JUGADOR3[$I]}
                                PIVOTE_INFE=4
                                PIVOTE_SUPE=4
                                while test $J -lt $CARTA3
                                do
                                    JUGADOR3[$J]=${JUGADOR3[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA3=$(($I-1))
                                TURNO=2
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                SALIR=1
                            else
                                CORRECTO=0
                            fi
                        else
                            if test ${JUGADOR3[$INDICE]} -lt ${ESPADAS[PIVOTE_INFE]} -a ${JUGADOR3[$INDICE]} -eq $((${ESPADAS[$PIVOTE_INFE]}-1))
                            then
                                PIVOTE_INFE=$(($PIVOTE_INFE-1))
                                ESPADAS[$PIVOTE_INFE]=${JUGADOR3[$INDICE]}
                                while test $J -lt $CARTA3
                                do
                                    JUGADOR3[$J]=${JUGADOR3[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA3=$(($I-1))
                                TURNO=2
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                SALIR=1
                            fi
                            if test ${JUGADOR3[$INDICE]} -lt ${ESPADAS[PIVOTE_SUPE]} -a ${JUGADOR3[$INDICE]} -eq$((${ESPADAS[$PIVOTE_SUPE]}+1))
                            then
                                PIVOTE_SUPE=$(($PIVOTE_SUPE+1))
                                ESPADAS[$PIVOTE_SUPE]=${JUGADOR3[$INDICE]}
                                while test $J -lt $CARTA3
                                do
                                    JUGADOR3[$J]=${JUGADOR3[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA3=$(($I-1))
                                TURNO=2
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                SALIR=1
                            fi
                        fi
                    fi

                    #PALO DE BASTOS
                    if test ${JUGADOR3[$INDICE]} -ge 21 && ${JUGADOR3[$INDICE]} -le 30
                    then
                        if test ${BASTOS[4]} -eq 0
                        then
                            if test ${JUGADOR3[$INDICE]}-eq25
                            then
                                BASTOS[4]=${JUGADOR3[$I]}
                                PIVOTE_INFB=4
                                PIVOTE_SUPB=4
                                while test $J -lt $CARTA3
                                do
                                    JUGADOR3[$J]=${JUGADOR3[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA3=$(($I-1))
                                TURNO=2
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                SALIR=1
                            else
                                CORRECTO=0
                            fi
                        else
                            if test ${JUGADOR3[$INDICE]} -lt ${BASTOS[PIVOTE_INFB]} -a ${JUGADOR3[$INDICE]} -eq $((${BASTOS[$PIVOTE_INFB]}-1))
                            then
                                PIVOTE_INFB=$(($PIVOTE_INFB-1))
                                OROS[$PIVOTE_INFB]=${JUGADOR3[$INDICE]}
                                while test $J -lt $CARTA3
                                do
                                    JUGADOR3[$J]=${JUGADOR3[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA3=$(($I-1))
                                TURNO=2
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                SALIR=1
                            fi
                            if test ${JUGADOR3[$INDICE]} -lt ${BASTOS[PIVOTE_SUPB]} -a ${JUGADOR3[$INDICE]} -eq$((${BASTOS[$PIVOTE_SUPB]}+1))
                            then
                                PIVOTE_SUPB=$(($PIVOTE_SUPB+1))
                                OROS[$PIVOTE_SUPB]=${JUGADOR3[$INDICE]}
                                while test $J -lt $CARTA3
                                do
                                    JUGADOR3[$J]=${JUGADOR3[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA3=$(($I-1))
                                TURNO=2
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                SALIR=1
                            fi
                        fi
                    fi

                    #PALO DE COPAS
                    if test ${JUGADOR3[$INDICE]} -ge 31 && ${JUGADOR3[$INDICE]} -le 40
                    then
                        if test ${COPAS[4]}-eq0
                        then
                            if test ${JUGADOR3[$INDICE]} -eq 35
                            then
                                ORO[4]=${JUGADOR3[$I]}
                                PIVOTE_INFC=4
                                PIVOTE_SUPC=4
                                while test $J -lt $CARTA3
                                do
                                    JUGADOR3[$J]=${JUGADOR3[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA3=$(($I-1))
                                TURNO=2
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                SALIR=1
                            else
                                CORRECTO=0
                            fi
                        else
                            if test ${JUGADOR3[$INDICE]} -lt ${BASTOS[PIVOTE_INFC]} -a ${JUGADOR3[$INDICE]} -eq $((${OBASTOSROS[$PIVOTE_INFC]}-1))
                            then
                                PIVOTE_INFC=$(($PIVOTE_INFC-1))
                                OROS[$PIVOTE_INFC]=${JUGADOR3[$INDICE]}
                                while test $J -lt $CARTA3
                                do
                                    JUGADOR3[$J]=${JUGADOR3[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA3=$(($I-1))
                                TURNO=2
                                SUM_TURNO=$(($SUM_TURNO+1))
                                CORRECTO=1
                                SALIR=1
                            fi
                            if test ${JUGADOR3[$INDICE]} -lt ${COPAS[PIVOTE_SUPC]} -a ${JUGADOR3[$INDICE]} -eq $((${COPAS[$PIVOTE_SUPC]}+1))
                            then
                                PIVOTE_SUPC=$(($PIVOTE_SUPC+1))
                                OROS[$PIVOTE_SUPC]=${JUGADOR3[$INDICE]}
                                while test $J -lt $CARTA3
                                do
                                    JUGADOR3[$J]=${JUGADOR3[$(($J+1))]}
                                    J=$(($J+1))
                                done
                                CARTA3=$(($I-1))
                                TURNO=2
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
                echo Estrategia no implementada
                CORRECTO=1
                TURNO=2
                SALIR=1
            fi
            if test $EST -eq 2
            then
                echo Estrategia no implementada
                CORRECTO=1
                TURNO=2
                SALIR=1
            fi 
        done
        fi
    fi
                    #Fin Jugador3

                    if test $CARTA1 -eq 0
                    then
                    GANADOR=1
                    PUNTUAJE=$CARTA2+$CARTA3
                    FINAL=1
                    fi

                    if test $CARTA2 -eq 0
                    then
                        GANADOR=2
                        PUNTUAJE=$CARTA1+$CARTA3
                        FINAL=1
                    fi

                    if test $CARTA3 -eq 0
                    then
                        GANADOR=3
                        PUNTUAJE=$CARTA1+$CARTA2
                        FINAL=1
                    fi

                    if test $SUM_TURNO -eq 3
                    then 
                        RONDA=$(($RONDA+1))
                        SUM_TURNO=0
                    fi
                done

		
		
		TIME=$(($SECONDS - $START_TIME)) #Pondremos esto al finalizar cada partida
		echo -e "$(date '+%d-%m-%Y')|$(date '+%H')|$JUG|$TIME|$RONDA|$GANADOR|$PUNTUAJE|$CARTA1-$CARTA2-$CARTA3-$CARTA4" >> fichero.log
	;;
	e|E)
	

		#Codigo para saber el numero de lineas, osea, partidas, del fichero.log
		NUMPARTIDAS=$(sed -n '$=' $LG) 
		echo "Se han jugado un total de $NUMPARTIDAS partidas" 
		#Fin del Codigo

		#Codigo para calcular el tiempo medio de todas las partidas jugadas
		TIEMPO=0
		while IFS= read -r LINEA || [[ -n "$LINEA" ]]
		do
		TIEMPO=$(($(echo "$LINEA" | cut -d '|' -f4) + "$TIEMPO"))

		done < fichero.log
		MEDIA=$(awk -v var1=$TIEMPO -v var2=$NUMPARTIDAS 'BEGIN { print  ( var1 / var2 ) }')
		echo "El tiempo medio de las partidas es de $MEDIA segundos"
		#Fin del codigo

		#Tiempo total entre todas las partidas
		TIEMPO=0
		while IFS= read -r LINEA || [[ -n "$LINEA" ]]
		do
		TIEMPO=$(($(echo "$LINEA" | cut -d '|' -f4) + "$TIEMPO"))

		done < $LG

		echo "El tiempo total entre todas las partidas es de $TIEMPO segundos"
		#Fin del codigo

		#Media de los puntos obtenidos por el ganador en todas las partidas
		PUNTOS=0
		while IFS= read -r LINEA || [[ -n "$LINEA" ]]
		do
		PUNTOS=$(($(echo "$LINEA" | cut -d '|' -f7) + "$PUNTOS"))

		done < $LG

		MEDIA=$(awk -v var1=$PUNTOS -v var2=$NUMPARTIDAS 'BEGIN { print  ( var1 / var2 ) }')
		echo "La media de los puntos obtenidos por el ganador en todas las partidas es de $MEDIA puntos"

		#Fin del codigo


		#Porcentaje de victorias respecto a partidas jugadas de cada jugador

		JUEG1=0
		JUEG1GAN=0
		JUEG2=0
		JUEG2GAN=0
		JUEG3=0
		JUEG3GAN=0
		JUEG4=0
		JUEG4GAN=0
		while IFS=" " read -r LINEA || [[ -n "$LINEA" ]]
		do
		    #Porcentaje del jugador 1
		    CARTAS1=$(echo "$LINEA" | cut -d'-' -f 3)
		    if [[ "$CARTAS1" != "*" ]]
		    then 
			JUEG1=$((JUEG1 + 1))
			PART1GAN=$(echo "$LINEA" | cut  -d'|' -f 6)
			
			if [[ "$PART1GAN" == "1" ]]
			then
			    JUEG1GAN=$((JUEG1GAN+ 1))
			    
			fi    
		    fi

		    #Porcentaje del jugador 2
		    CARTAS2=$(echo "$LINEA" | cut -d'-' -f 4)
		    if [[ "$CARTAS2" != "*" ]]
		    then 
			JUEG2=$((JUEG2 + 1))
			PART2GAN=$(echo "$LINEA" | cut  -d'|' -f 6)
			
			if [[ "$PART2GAN" == "2" ]]
			then
			    JUEG2GAN=$((JUEG2GAN+ 1))
			    
			fi    
		    fi
		    
		    #Porcentaje del jugador 3
		    CARTAS3=$(echo "$LINEA" | cut -d'-' -f 5)
		    if [[ "$CARTAS3" != "*" ]]
		    then 
			JUEG3=$((JUEG3 + 1))
			PART3GAN=$(echo "$LINEA" | cut  -d'|' -f 6)
		      
			if [[ "$PART3GAN" == "3" ]]
			then
			    JUEG3GAN=$((JUEG3GAN+ 1))
			    
			fi    
		    fi
		  
		    #Porcentaje del jugador 4
		    CARTAS4=${LINEA: -1}
		    if [[ "$CARTAS4" != "*" ]]
		    then 
			JUEG4=$((JUEG4 + 1))
			PART4GAN=$(echo "$LINEA" | cut  -d'|' -f 6)
			
			
			if [[ "$PART4GAN" == "4" ]]
			then
			    JUEG4GAN=$((JUEG4GAN+ 1))
			    
			fi    
		    fi
		    
		done < $LG
		PORCENTAJE1=$((JUEG1GAN * 100 / JUEG1))
		PORCENTAJE2=$((JUEG2GAN * 100 / JUEG2))
		PORCENTAJE3=$((JUEG3GAN * 100 / JUEG3))
		PORCENTAJE4=$((JUEG4GAN * 100 / JUEG4))
		echo "El jugador 1 ha ganado un $PORCENTAJE1% de las partidas que ha jugado"
		echo "El jugador 2 ha ganado un $PORCENTAJE2% de las partidas que ha jugado"
		echo "El jugador 3 ha ganado un $PORCENTAJE3% de las partidas que ha jugado"
		echo "El jugador 4 ha ganado un $PORCENTAJE4% de las partidas que ha jugado"


		#Fin del codigo


	;;
	f|F)
		#Partida mas corta
		LINEA=$(head -n 1 $LG)
		TIEMPO=$(echo "$LINEA" | cut -d'|' -f 4 )
		TIEMPOMEN="$TIEMPO"
		NUMP=1
		CONT=0
		while IFS=" " read -r LINEA || [[ -n "$LINEA" ]]
		do
		    
		    TIEMPO=$(echo "$LINEA" | cut -d'|' -f 4)
		    CONT=$(("$CONT" + 1))
		    if [[ "$TIEMPOMEN" -gt "$TIEMPO" ]]
		    then 
			
			TIEMPOMEN=$TIEMPO
			NUMP=$CONT
			
			  
		    fi

		    
		done < $LG
		PART=$(head -n "$NUMP" $LG | tail -1)
		echo "La partida mas corta es la $NUMP => $PART"

		#Fin del codigo

		#Partida mas larga
		LINEA=$(head -n 1 $LG)
		TIEMPO=$(echo "$LINEA" | cut -d'|' -f 4 )
		TIEMPOMAY="$TIEMPO"
		NUMP=1
		CONT=0
		while IFS=" " read -r LINEA || [[ -n "$LINEA" ]]
		do
		    
		    TIEMPO=$(echo "$LINEA" | cut -d'|' -f 4)
		    CONT=$(("$CONT" + 1))
		    if [[ "$TIEMPOMAY" -lt "$TIEMPO" ]]
		    then 
			
			TIEMPOMAY=$TIEMPO
			NUMP=$CONT
			
			  
		    fi

		    
		done < $LG
		PART=$(head -n "$NUMP" $LG | tail -1)
		echo "La partida mas larga es la $NUMP => $PART"

		#Fin del codigo

		#Partida con mayor numero de rondas
		LINEA=$(head -n 1 $LG)
		RONDAS=$(echo "$LINEA" | cut -d'|' -f 5 )
		RONDASMAY="$TIEMPO"
		NUMP=1
		CONT=0
		while IFS=" " read -r LINEA || [[ -n "$LINEA" ]]
		do
		    
		    RONDAS=$(echo "$LINEA" | cut -d'|' -f 5)
		    CONT=$(("$CONT" + 1))
		    if [[ "$RONDASMAY" -lt "$RONDAS" ]]
		    then 
			
			RONDASMAY=$RONDAS
			NUMP=$CONT
			
			  
		    fi

		    
		done < $LG
		PART=$(head -n "$NUMP" $LG | tail -1)
		echo "La partida con mayor numero de rondas es la $NUMP => $PART"
		#Fin del codigo


		#Partida con menor numero de rondas
		LINEA=$(head -n 1 $LG)
		RONDAS=$(echo "$LINEA" | cut -d'|' -f 5 )
		RONDASMEN="$TIEMPO"
		NUMP=1
		CONT=0
		while IFS=" " read -r LINEA || [[ -n "$LINEA" ]]
		do
		    
		    RONDAS=$(echo "$LINEA" | cut -d'|' -f 5)
		    CONT=$(("$CONT" + 1))
		    if [[ "$RONDASMEN" -gt "$RONDAS" ]]
		    then 
			
			RONDASMEN=$RONDAS
			NUMP=$CONT
			
			  
		    fi

		    
		done < $LG
		PART=$(head -n "$NUMP" $LG | tail -1)
		echo "La partida con menor numero de rondas es la $NUMP => $PART"

		#Fin del codigo


		#Partida con mayor numero de puntos obtenidos por el ganador
		LINEA=$(head -n 1 $LG)
		PUNTOS=$(echo "$LINEA" | cut -d'|' -f 7 )
		PUNTOSGAN="$PUNTOS"
		NUMP=1
		CONT=0
		while IFS=" " read -r LINEA || [[ -n "$LINEA" ]]
		do
		    
		    PUNTOS=$(echo "$LINEA" | cut -d'|' -f 7)
		    CONT=$(("$CONT" + 1))
		    if [[ "$PUNTOSGAN" -lt "$PUNTOS" ]]
		    then 
			
			PUNTOSGAN=$PUNTOS
			NUMP=$CONT
			
			  
		    fi
		    
		done < $LG  
		PART=$(head -n "$NUMP" $LG | tail -1)
		echo "La partida con mayor numero de puntos del ganador es la $NUMP => $PART"    
		#Fin del codigo



		#Partida donde jugador 1 acabo con mayor numero de cartas
		LINEA=$(head -n 1 $LG)
		CARTAS=$(echo "$LINEA" | cut -d'|' -f8- )
		CARTAS=$(echo "$CARTAS" | cut -d'-' -f 1)
		CARTASMAY="$CARTAS" 
		NUMP=1
		CONT=0
		while IFS=" " read -r LINEA || [[ -n "$LINEA" ]]
		do
		    
		    CARTAS=$(echo "$LINEA" | cut -d'|' -f8- )
		    CARTAS=$(echo "$CARTAS" | cut -d'-' -f 1)
		    CONT=$(("$CONT" + 1))
		    
		    if [[ "$CARTASMAY" -lt "$CARTAS" ]]
		    then 
			
			CARTASMAY=$CARTAS
			NUMP=$CONT
			
			  
		    fi

		    
		done < $LG  
		PART1=$(head -n "$NUMP" $LG | tail -1)
		NUMP1="$NUMP"
		CARTAS1="$CARTASMAY"

		#Fin del codigo

		#Partida donde jugador 2 acabo con mas cartas
		LINEA=$(head -n 1 $LG)
		CARTAS=$(echo "$LINEA" | cut -d'|' -f8- )
		CARTAS=$(echo "$CARTAS" | cut -d'-' -f 2)
		CARTASMAY="$CARTAS" 
		NUMP=1
		CONT=0
		while IFS=" " read -r LINEA || [[ -n "$LINEA" ]]
		do
		    
		    CARTAS=$(echo "$LINEA" | cut -d'|' -f8- )
		    CARTAS=$(echo "$CARTAS" | cut -d'-' -f 2)
		    CONT=$(("$CONT" + 1))
		    
		    if [[ "$CARTASMAY" -lt "$CARTAS" ]]
		    then 
			
			CARTASMAY=$CARTAS
			NUMP=$CONT
			
			  
		    fi

		    
		done < $LG   
		PART2=$(head -n "$NUMP" $LG | tail -1)
		NUMP2="$NUMP"
		CARTAS2="$CARTASMAY"


		#Fin del codigo


		#Partida donde el jugador 3 acabo con mayor numero de cartas
		NUMP=1
		CONT=0
		#Buscamos un valor para iniciar la comparaciOn


		CARTASMAYN="*"
		while IFS=" " read -r LINEA || [[ -n "$LINEA" ]]
		do
		    CARTAS=$(echo "$LINEA" | cut -d'|' -f8- )
		    CARTAS=$(echo "$CARTAS" | cut -d'-' -f 3)
		    CARTASMAY="$CARTAS" 
		    if [[ "$CARTASMAY" != "*" ]]
		    then
			CARTASMAYN="$CARTASMAY"
		    fi
		done < $LG   
		CARTASMAY="$CARTASMAYN"
		#Realizamos la comparacion
		if [[ "$CARTASMAY" != "*" ]]
		then
		    while IFS=" " read -r LINEA || [[ -n "$LINEA" ]]
			do
			    
			    CARTAS=$(echo "$LINEA" | cut -d'|' -f8- )
			    CARTAS=$(echo "$CARTAS" | cut -d'-' -f 3)
			    CONT=$(("$CONT" + 1))
			    
			    if [[ "$CARTAS" != "*" ]]
			    then
				if [[ "$CARTASMAY" -le "$CARTAS" ]]
				then 
				    
				    CARTASMAY=$CARTAS
				    NUMP=$CONT
				    
				      
				fi
			    fi
			    
			done < $LG
		    PART3=$(head -n "$NUMP" $LG | tail -1)
		    NUMP3="$NUMP"
		    CARTAS3="$CARTASMAY"
		else    
		    PART3="*"
		    NUMP3="*"
		    CARTAS3="*"
		fi

		#Fin del codigo


		#Partida donde el jugador 4 acabo con mayor numero de cartas
		NUMP=1
		CONT=0
		#Buscamos un valor para iniciar la comparaciOn


		CARTASMAYN="*"
		while IFS=" " read -r LINEA || [[ -n "$LINEA" ]]
		do
		    CARTAS=${LINEA: -1}
		    CARTASMAY="$CARTAS" 
		    if [[ "$CARTASMAY" != "*" ]]
		    then
			CARTASMAYN="$CARTASMAY"
		    fi
		done < $LG   
		CARTASMAY="$CARTASMAYN"


		#Realizamos la comparacion
		if [[ "$CARTASMAY" != "*" ]]
		then
		    
		    while IFS=" " read -r LINEA || [[ -n "$LINEA" ]]
			do
		    
			    CARTAS=${LINEA: -1}
			    CONT=$(("$CONT" + 1))
			    
			    
			    if [[ "$CARTAS" != "*" ]]  
			    then
				
				if [[ "$CARTASMAY" -le "$CARTAS" ]]
				then 
				    
				    CARTASMAY=$CARTAS
				    NUMP=$CONT
				    
				      
				fi
			    fi
			done < $LG
		    PART4=$(head -n "$NUMP" $LG | tail -1)
		    NUMP4="$NUMP"
		    CARTAS4="$CARTASMAY"
		else    
		    PART4="*"
		    NUMP4="*"
		    CARTAS4="*"
		fi



		#Comparamos los dos primeros jugadores

		PARTM1="$PART1"
		NUMPM1="$NUMP1"
		CARTASM1="$CARTAS1"

		if [[ "$CARTAS1" -lt "$CARTAS2" ]]
		then
		    PARTM1="$PART2"
		    NUMPM1="$NUMP2"
		    CARTASM1="$CARTAS2"
		fi


		#Comparamos los dos ultimos jugadores, los cuales no necesariamente participaran siempre

		if [[ "$PART3" == "*" && "$PART4" == "*" ]]
		then
		    PARTM2="*"
		    NUMPM2="*"
		    CARTASM2="*"
		    
		fi    
		if [[ "$PART3" != "*" && "$PART4" != "*" ]]
		then
		    PARTM2="$PART3"
		    NUMPM2="$NUMP3"
		    CARTASM2="$CARTAS3"
		    if [[ "$CARTAS3" -lt "$CARTAS4" ]]
		    then
			PARTM2="$PART4"
			NUMPM2="$NUMP4"
			CARTASM2="$CARTAS4"
		    fi        
		fi  

		if [[ "$PART3" != "*" && "$PART4" == "*" ]]
		then
		    PARTM2="$PART3"
		    NUMPM2="$NUMP3"
		    CARTASM2="$CARTAS3"
		fi 

		if [[ "$PART3" == "*" && "$PART4" != "*" ]]
		then
		    PARTM2="$PART4"
		    NUMPM2="$NUMP4"
		    CARTASM2="$CARTAS4"
			  
		fi 


		#Comparamos los dos resultados finales
		if [[ "$PARTM1" != "*" && "$PARTM2" != "*" ]]
		then
		    PARTF="$PARTM1"
		    NUMPF="$NUMPM1"
		    CARTASF="$CARTASM1"
		    if [[ "$CARTASM1" -lt "$CARTASM2" ]]
		    then
			PARTF="$PARTM2"
			NUMPF="$NUMPM2"
			CARTASF="$CARTASM2"
		    fi        
		fi
		if [[ "$PARTM1" != "*" && "$PARTM2" == "*" ]]
		then
		    PARTF="$PARTM1"
		    NUMPF="$NUMPM1"
		    CARTASF="$CARTASM1"
			  
		fi

		echo "La partida donde un jugador ha quedado con el mayor numero de cartas es la $NUMPF => $PARTF"
	;;
	s|S)
	#echo Opcion S
	SALIR=1
	;;
	*)
	echo La opcion elegida no es valida
	;;
esac
done
exit 0
