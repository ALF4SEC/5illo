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
	
	#El usuario selecciona cual opcion configurar
	
	echo J')'Jugadores
	echo E')'Estrategia
	echo L')'Fichero LOG
	echo S')'Salir
	echo Elija que desea configurar
	read OPCIONCFG
	case $OPCIONCFG in
		j|J)
		
		
		#El usuario selecciona con cuantos jugadores desea jugar
		echo 2')'2 Jugadores
		echo 3')'3 Jugadores
		echo 4')'4 Jugadores
		read OPCIONJGD
		case $OPCIONJGD in
			2)
			
			#El usuario ha seleccionado jugador con dos jugadores, asi que modificaremos el fichero config.cfg.
			JUG=2
			cat >config.cfg <<END	#cat sirve para modificar el fichero especificado. No solo permite modificarlo, sino tambien mostrar por pantalla su contenido y otras opciones. Lo utilizaremos para sobreeescribir todo el contenido de config.cfg con el contenido entre ambos END '('Es decir, tanto el contenido modificado como el antiguo')'. El END final no debe estar tabulado o pueden darse errores. Puede sustituirse END por EOF.
			
			JUGADORES=$JUG
			ESTRATEGIA=$EST
			LOG=$LG
END
			;;
			3)
			
			#El usuario ha seleccionado jugador con tres jugadores, asi que modificaremos el fichero config.cfg.
			JUG=3
			cat >config.cfg <<END
			JUGADORES=$JUG
			ESTRATEGIA=$EST
			LOG=$LG
END
			;;
			4)
			
			#El usuario ha seleccionado jugador con cuatro jugadores, asi que modificaremos el fichero config.cfg.
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
		
		#El usuario selecciona con que estrategia desea jugar.
		
		echo 0')'Random estrategia
		echo 1')'Estrategia 1
		echo 2')'Estrategia 2
		read OPCIONEST
		case $OPCIONEST in
			0)
			
			#Modificaremos el fichero config.cfg con la estrategia escogida, la 0 en este caso.
			EST=0
			cat >config.cfg <<END #Repetimos el uso de cat para sobreescribir el fichero config.cfg con la nueva informacion y la anterior.
			JUGADORES=$JUG
			ESTRATEGIA=$EST
			LOG=$LG
END
			;;
			1)
			
			#Modificaremos el fichero config.cfg con la estrategia escogida, la 1 en este caso.
			EST=1
			cat >config.cfg <<END
			JUGADORES=$JUG
			ESTRATEGIA=$EST
			LOG=$LG
END
			;;
			2)
			
			#Modificaremos el fichero config.cfg con la estrategia escogida, la 2 en este caso.
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
		
		#El usuario debera introducir la direccion de fichero.log, donde se almacenan los datos de las partidas jugadas.
		echo Escriba la direcciOn del fichero log
		read LG
		cat >config.cfg <<END #Se vuelve a utilizar cat para sobreescribir el fichero config.cfg.
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


                    fi
                else
                CARTA1=14
                CARTA2=13
                CARTA3=13
                CARTAS=0
                declare -A JUGADOR1
                declare -A JUGADOR2
                declare -A JUGADOR3 
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
                    if test ${JUGADOR1[$I]} -gt ${OROS[$PIVOTE_SUPO]} -a ${JUGADOR1[$I]} -eq $((${OROS[$PIVOTE_SUPO]}+1)) || ${JUGADOR1[$I]} -lt ${OROS[$PIVOTE_INFO]} -a ${JUGADOR1[$I]} -eq $((${OROS[$PIVOTE_INFO]}-1))
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
                INDICE=$((0+ $RANDOM % $CARTA2))
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
                INDICE=$((0+ $RANDOM % $CARTA2))
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
                
            fi
		TIME=$(($SECONDS - $START_TIME)) #Pondremos esto al finalizar cada partida
		echo -e "$(date '+%d-%m-%Y')|$(date '+%H')|$JUG|$TIME|$RONDA|$GANADOR|$PUNTUAJE|$CARTA1-$CARTA2-$CARTA3-$CARTA4" >> fichero.log
	;;
	e|E)
	

		#Codigo para saber el numero de lineas, osea, partidas, del fichero.log
		
		#Utilizamos sed, una herramienta de bash que permite analizar y transformar texto. Utilizaremos esta sentencia para contar el numero de lineas del fichero config.cfg, cuya direccion viene almacenada en la variable LG, siendo, cada linea, una partida. 
		
		#sed, por defecto, imprime por pantalla aquello que procesa, asi que es necesario usar "-n" para indicarle que solo imprima aquello que le indiquemos que imprima, en este caso, nada.
		
		NUMPARTIDAS=$(sed -n '$=' $LG) 
		echo "Se han jugado un total de $NUMPARTIDAS partidas" 
		#Fin del Codigo




		#IMPORTANTE en las siguientes sentencias, se utiliza constantemente el mismo patron. Este consiste en utilizar un bucle while, que leera linea a linea el fichero especificado al lado de "done". 
		
		#IFS= servira para que se lean tambien los espacios en blanco al principio y final de cada linea
		#read es la propia instruccion de lectura
		#-r servira para que no se interpreten los escapes de barra invertida "\"
		#LINEA sera la variable donde iremos almacenando cada linea completa
		#[[ -n "$LINEA" ]] es muy importante. Si no se incluye, no se leeran aquellas lineas que no vayan seguidas de un salto de linea. Por tanto, de no incluirse, nunca se leera la ultima linea del fichero
		
		
		#Dependiendo del dato que debamos leer, deberemos cambiar elegir un campo u otro, delimitado por '|' o '-'
		#Seleccionaremos la variable donde esta almacenada la linea, en nuestro programa, LINEA. Utilizamos la orden cut para obtener solo cierta informacion del fichero. La informacion estara delimitada por '|' o '-', y asi deberemos especificarlo despues de '-d'. Despues, seleccionaremos el campo, delimitado por el caracter que hayamos especificado, que queremos leer mediante -fX, siendo X el numero de tal campo '('ojo, los campos se consideran aquello que esta a la izquierda del caracter delimitador. En el ultimo dato de cada linea, ya que no estara delimitado por un caracter, deberemos emplear otro metodo para extraer la informacion')'






		#Codigo para calcular el tiempo medio de todas las partidas jugadas
		#Primero, iremos sumando el tiempo total entre todas las partidas
		TIEMPO=0
		while IFS= read -r LINEA || [[ -n "$LINEA" ]]
		do
		
		TIEMPO=$(($(echo "$LINEA" | cut -d '|' -f4) + "$TIEMPO"))

		done < fichero.log
		
		#Finalmente, utilizaremos el lenguaje awk para dividir el tiempo total entre las partidas jugadas. Este lenguaje es mas potente en procesamiento de texto que el propio bash, que es mas util como launcher
		MEDIA=$(awk -v var1=$TIEMPO -v var2=$NUMPARTIDAS 'BEGIN { print  ( var1 / var2 ) }')
		echo "El tiempo medio de las partidas es de $MEDIA segundos"
		#Fin del codigo
		
		
		
		
		
		
		
		
		#Tiempo total entre todas las partidas
		#Sumaremos el tiempo invertido entre todas las partidas jugadas
		TIEMPO=0
		while IFS= read -r LINEA || [[ -n "$LINEA" ]]
		do
		TIEMPO=$(($(echo "$LINEA" | cut -d '|' -f4) + "$TIEMPO"))

		done < $LG

		echo "El tiempo total entre todas las partidas es de $TIEMPO segundos"
		#Fin del codigo
		
		
		
		
		
		
		
		

		#Media de los puntos obtenidos por el ganador en todas las partidas
		#Sumamos los puntos obtenidos entre todos los ganadores
		PUNTOS=0
		while IFS= read -r LINEA || [[ -n "$LINEA" ]]
		do
		PUNTOS=$(($(echo "$LINEA" | cut -d '|' -f7) + "$PUNTOS"))

		done < $LG
		
		
		#Una vez mas, utilizamos el lenguaje wk para realizar la division
		MEDIA=$(awk -v var1=$PUNTOS -v var2=$NUMPARTIDAS 'BEGIN { print  ( var1 / var2 ) }')
		echo "La media de los puntos obtenidos por el ganador en todas las partidas es de $MEDIA puntos"
		#Fin del codigo










		#Porcentaje de victorias respecto a partidas jugadas de cada jugador

		JUEG1=0		#Partidas jugadas por jugador 1
		JUEG1GAN=0	#Partidas ganadas por jugador 1
		JUEG2=0		#Partidas jugadas por j2
		JUEG2GAN=0	#Partidas ganadas por j2
		JUEG3=0		#Partidas jugadas por j3
		JUEG3GAN=0	#Partidas ganadas por j3
		JUEG4=0		#Partidas jugadas por j4
		JUEG4GAN=0	#Partidas ganadas por j4
		
		#En este apartado, iremos, jugador por jugador, comprobando en que partidas han participado. Tambien se realizara la comprobacion en el jugador 1 y 2, porque somos unos chulos. Despues de realizar la comprobacion con un if, valiendonos del caracter '*', comprobaremos si esa partida fue ganada o no por el jugador pertinente, y aumentaremos la variable adecuada en consecuencia para, finalmente, calcular los porcentajes con los datos obtenidos.
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
		#Sleccionamos la primera linea, considerandola como la partida mas corta, usando head -n 1, y luego la iremos comparando con el resto hasta encontrar aquella que se corresponde con la partida mas corta
		LINEA=$(head -n 1 $LG)
		TIEMPO=$(echo "$LINEA" | cut -d'|' -f 4 )
		
		TIEMPOMEN="$TIEMPO" #Almacenamos aqui el tiempo menor
		NUMP=1 #Variable para indicar el numero de la partida mas corta
		CONT=0 #LO utilizaremos para ir almacenando el numero de la partida actual
		while IFS=" " read -r LINEA || [[ -n "$LINEA" ]] #IFS=" " y IFS= son equivalentes
		do
		    
		    TIEMPO=$(echo "$LINEA" | cut -d'|' -f 4)
		    CONT=$(("$CONT" + 1))
		    if [[ "$TIEMPOMEN" -gt "$TIEMPO" ]]
		    then 
			
			TIEMPOMEN=$TIEMPO
			NUMP=$CONT
			
			  
		    fi

		    
		done < $LG
		#La siguiente sentencia permite elegir una linea del fichero sabiendo el numero de esta. tail se suele utilizar para imprimir las ultimas lineas de un fichero. En este caso, lo utilizamos para imprimir solo una, siendo la especificada en "$NUMP"
		PART=$(head -n "$NUMP" $LG | tail -1)
		echo "La partida mas corta es la $NUMP => $PART"

		#Fin del codigo








		#Partida mas larga
		#Practicamente igual al caso anterior
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
		#Similar a los casos anteriores, pero con el valor de las rondas
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
		#Similar al caso anterior
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
		#Similar al caso anterior
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




		
		
		
		#Finalmente, iremos calculando, jugador por jugador, las partidas en las que estos se quedaron con mas cartas al finalizar esta. Iremos almacenando el numero de la partida, asi como el propio contenido de esta para mostrarlo por pantalla 

		#Partida donde jugador 1 acabo con mayor numero de cartas
		#Elegimos como referencia la primera linea, e iremos comparandola y sustituyendo con el resto
		LINEA=$(head -n 1 $LG)
		#Nos quedamos con el campo asociado a las cartas restantes de cada jugador
		CARTAS=$(echo "$LINEA" | cut -d'|' -f8- )
		#De ese campo, elegimos el jugador que nos interese, teniendo en cuenta el nuevo caracter delimitador
		CARTAS=$(echo "$CARTAS" | cut -d'-' -f 1)
		CARTASMAY="$CARTAS" 
		NUMP=1
		CONT=0
		while IFS=" " read -r LINEA || [[ -n "$LINEA" ]]
		do
		    
		    #Nos quedamos con el campo asociado a las cartas restantes de cada jugador
		    CARTAS=$(echo "$LINEA" | cut -d'|' -f8- )
		    #De ese campo, elegimos el jugador que nos interese, teniendo en cuenta el nuevo caracter delimitador
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
		#Similar a lo hecho con el jugador 1
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




		#IMPORTANTE Los casos de los jugadores 3 y 4 son similares a los anteriores. Sin embargo, tendremos que comprobar que han participado en las partidas valiendonos de '*'

		
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