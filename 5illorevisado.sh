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

        #Comprobamos si el numero de jugadores es par, sino sera impar y habrá 3 jugadores
		if test $(($JUG%2)) -eq 0		
		then
            #Si es par el numero de jugadores que hay 2 ó 4
			if test $JUG -eq 2	
			then	
			#Dos Jugadores
				#Repartimos las cartas
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
				#Fin repartir
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
					echo "--------------------------------------------------------------"
					echo "            RONDA $RONDA"
					echo "--------------------------------------------------------------"
					echo "POS |   JUGADOR 1   |    JUGADOR 2"
					while test $I -lt 20
					do
						echo "$I     ${baraja[${JUGADOR1[$I]}]}   ${baraja[${JUGADOR2[$I]}]}"
						I=$(($I+1))
					done
					I=0
					echo "--------------------------------------------------------------"
					echo "     OROS     |     ESPADAS     |     BASTOS    |     COPAS"
					while test $I -lt 10
					do
						echo " ${baraja[${OROS[$I]}]}   ${baraja[${ESPADAS[$I]}]}   ${baraja[${BASTOS[$I]}]}   ${baraja[${COPAS[$I]}]}"
						I=$(($I+1))
					done
					echo "--------------------------------------------------------------"
					echo
					sleep 3

					#TURNO DEL JUGADOR 1
					if test $TURNO -eq 1 -a $FINAL -eq 0
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
							JUGADOR1[$(($CARTA1-1))]=0
							CARTA1=$(($CARTA1-1))
							SUM_TURNO=$(($SUM_TURNO+1))
							TURNO=2
						else
							EXIT=0
							PUEDE=0
							#Comprobamos si el JUGADOR2 puede echar
							I=0
							while test $I -lt $CARTA1 -a $PUEDE -eq 0
							do
								if test ${JUGADOR1[$I]} -ge 1 -a ${JUGADOR1[$I]} -le 10 
								then
									if test ${OROS[4]} -ne 0
									then
										if test ${JUGADOR1[$I]} -eq $((${OROS[$PIVOTE_SUPO]}+1))
										then
											PUEDE=1
											EXIT=0
										fi
										if test ${JUGADOR1[$I]} -eq $((${OROS[$PIVOTE_INFO]}-1))
										then
											PUEDE=1
											EXIT=0
										fi
									else
										if test ${JUGADOR1[$I]} -eq 5
										then
											PUEDE=1
											EXIT=0
										fi
									fi
								fi

								if test ${JUGADOR1[$I]} -ge 11 -a ${JUGADOR1[$I]} -le 20 
								then
									if test ${ESPADAS[4]} -ne 0
									then
										if test ${JUGADOR1[$I]} -eq $((${ESPADAS[$PIVOTE_SUPE]}+1))
										then
											PUEDE=1
											EXIT=0
										fi
										if test ${JUGADOR1[$I]} -eq $((${ESPADAS[$PIVOTE_INFE]}-1))
										then
											PUEDE=1
											EXIT=0
										fi
									else
										if test ${JUGADOR1[$I]} -eq 15
										then
											PUEDE=1
											EXIT=0
										fi
									fi
								fi

								if test ${JUGADOR1[$I]} -ge 21 -a ${JUGADOR1[$I]} -le 30 
								then
									if test ${BASTOS[4]} -ne 0
									then
										if test ${JUGADOR1[$I]} -eq $((${BASTOS[$PIVOTE_SUPB]}+1))
										then
											PUEDE=1
											EXIT=0
										fi
										if test ${JUGADOR1[$I]} -eq $((${BASTOS[$PIVOTE_INFB]}-1))
										then
											PUEDE=1
											EXIT=0
										fi
									else
										if test ${JUGADOR1[$I]} -eq 25
										then
											PUEDE=1
											EXIT=0
										fi
									fi
								fi

								if test ${JUGADOR1[$I]} -ge 31 -a ${JUGADOR1[$I]} -le 40 
								then
									if test ${COPAS[4]} -ne 0
									then
										if test ${JUGADOR1[$I]} -eq $((${COPAS[$PIVOTE_SUPC]}+1))
										then
											PUEDE=1
											EXIT=0
										fi
										if test ${JUGADOR1[$I]} -eq $((${COPAS[$PIVOTE_INFC]}-1))
										then
											PUEDE=1
											EXIT=0
										fi
									else
										if test ${JUGADOR1[$I]} -eq 35
										then
											PUEDE=1
											EXIT=0
										fi
									fi
								fi
								I=$(($I+1))
							done
						
							if test $PUEDE -eq 0
							then
								echo "El JUGADOR 1 PASA"
								TURNO=2
								SUM_TURNO=$(($SUM_TURNO+1))
								EXIT=1
							fi

							while test $EXIT -eq 0
							do
								echo "Elige la posicion de la carta que quieres echar: "
								read INDICE
								CORRECTO=0
								if test  $INDICE -ge 0 -a $INDICE -le $(($CARTA1-1))
								then
									I=0
									FIND=0
									while test $I -lt 20 -a $FIND -eq 0
									do
										if test ${JUGADOR1[$I]} -eq ${JUGADOR1[$INDICE]}
										then
											FIND=1
										fi
											I=$(($I+1))
									done

									CORRECTO=0
									if test $FIND -eq 1
									then
										if test ${JUGADOR1[$INDICE]} -ge 1 -a ${JUGADOR1[$INDICE]} -le 10 
										then
											if test ${OROS[4]} -ne 0
											then
												if test ${JUGADOR1[$INDICE]} -eq $((${OROS[$PIVOTE_SUPO]}+1))
												then
													PIVOTE_SUPO=$(($PIVOTE_SUPO+1))
													OROS[$PIVOTE_SUPO]=${JUGADOR1[$INDICE]}
													CORRECTO=1

												fi
												if test ${JUGADOR1[$INDICE]} -eq $((${OROS[$PIVOTE_INFO]}-1))
												then
													PIVOTE_INFO=$(($PIVOTE_INFO-1))
													OROS[$PIVOTE_INFO]=${JUGADOR1[$INDICE]}
													CORRECTO=1
												fi
											fi
										fi

										if test ${JUGADOR1[$INDICE]} -ge 11 -a ${JUGADOR1[$INDICE]} -le 20 
										then
											if test ${ESPADAS[4]} -ne 0
											then
												if test ${JUGADOR1[$INDICE]} -eq $((${ESPADAS[$PIVOTE_SUPE]}+1))
												then
													PIVOTE_SUPE=$(($PIVOTE_SUPE+1))
													ESPADAS[$PIVOTE_SUPE]=${JUGADOR1[$INDICE]}
													CORRECTO=1

												fi
												if test ${JUGADOR1[$INDICE]} -eq $((${ESPADAS[$PIVOTE_INFE]}-1))
												then
													PIVOTE_INFE=$(($PIVOTE_INFE-1))
													ESPADAS[$PIVOTE_INFE]=${JUGADOR1[$INDICE]}
													CORRECTO=1
												fi
											else
												if test ${JUGADOR1[$INDICE]} -eq 15
												then
													ESPADAS[4]=${JUGADOR1[$INDICE]}
													CORRECTO=1
												fi
											fi
										fi

										if test ${JUGADOR1[$INDICE]} -ge 21 -a ${JUGADOR1[$INDICE]} -le 30 
										then
											if test ${BASTOS[4]} -ne 0
											then
												if test ${JUGADOR1[$INDICE]} -eq $((${BASTOS[$PIVOTE_SUPB]}+1))
												then
													PIVOTE_SUPB=$(($PIVOTE_SUPB+1))
													BASTOS[$PIVOTE_SUPB]=${JUGADOR1[$INDICE]}
													CORRECTO=1

												fi
												if test ${JUGADOR1[$INDICE]} -eq $((${BASTOS[$PIVOTE_INFB]}-1))
												then
													PIVOTE_INFB=$(($PIVOTE_INFB-1))
													BASTOS[$PIVOTE_INFB]=${JUGADOR1[$INDICE]}
													CORRECTO=1
												fi
											else
												if test ${JUGADOR1[$INDICE]} -eq 25
												then
													BASTOS[4]=${JUGADOR1[$INDICE]}
													CORRECTO=1
												fi
											fi
										fi

										if test ${JUGADOR1[$INDICE]} -ge 31 -a ${JUGADOR1[$INDICE]} -le 40 
										then
											if test ${COPAS[4]} -ne 0
											then
												if test ${JUGADOR1[$INDICE]} -eq $((${COPAS[$PIVOTE_SUPC]}+1))
												then
													PIVOTE_SUPC=$(($PIVOTE_SUPC+1))
													COPAS[$PIVOTE_SUPC]=${JUGADOR1[$INDICE]}
													CORRECTO=1

												fi
												if test ${JUGADOR1[$INDICE]} -eq $((${COPAS[$PIVOTE_INFC]}-1))
												then
													PIVOTE_INFC=$(($PIVOTE_INFC-1))
													COPAS[$PIVOTE_INFC]=${JUGADOR1[$INDICE]}
													CORRECTO=1
												fi
											else
												if test ${JUGADOR1[$INDICE]} -eq 35
												then
													COPAS[4]=${JUGADOR1[$INDICE]}
													CORRECTO=1
												fi
											fi
										fi

										if test $CORRECTO -eq 1
										then
											while test $I -lt $CARTA1 -a $FIND -eq 0
											do
												if test ${JUGADOR1[$I]} -eq 5
												then
													FIND=1
												fi
											I=$(($I+1))
											done

											echo "JUGADOR1 echa ${baraja[${JUGADOR1[$INDICE]}]}"

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
											
											JUGADOR1[$(($CARTA1-1))]=0
											CARTA1=$(($CARTA1-1))
											SUM_TURNO=$(($SUM_TURNO+1))
											TURNO=2
											EXIT=1
										fi
									fi
								else
									echo "El indice no es valido"
								fi  
							done
						fi
					fi


					if test $CARTA1 -eq 0;
					then
						PUNTUAJE=$CARTA2
						GANADOR=1
						FINAL=1
					fi

					#Turno del JUGADOR 2
					if test $TURNO -eq 2 -a $FINAL -eq 0
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
							JUGADOR2[$(($CARTA2-1))]=0
							CARTA2=$(($CARTA2-1))
							SUM_TURNO=$(($SUM_TURNO+1))
							TURNO=1
						else
							EXIT=0
							PUEDE=0
							#Comprobamos si el JUGADOR2 puede echar
							I=0
							while test $I -lt $CARTA2 -a $PUEDE -eq 0
							do
								if test ${JUGADOR2[$I]} -ge 1 -a ${JUGADOR2[$I]} -le 10 
								then
									if test ${OROS[4]} -ne 0
									then
										if test ${JUGADOR2[$I]} -eq $((${OROS[$PIVOTE_SUPO]}+1))
										then
											PUEDE=1
										fi
										if test ${JUGADOR2[$I]} -eq $((${OROS[$PIVOTE_INFO]}-1))
										then
											PUEDE=1
										fi
									else
										if test ${JUGADOR2[$I]} -eq 5
										then
											PUEDE=1
										fi
									fi
								fi

								if test ${JUGADOR2[$I]} -ge 11 -a ${JUGADOR2[$I]} -le 20 
								then
									if test ${ESPADAS[4]} -ne 0
									then
										if test ${JUGADOR2[$I]} -eq $((${ESPADAS[$PIVOTE_SUPE]}+1))
										then
											PUEDE=1
										fi
										if test ${JUGADOR2[$I]} -eq $((${ESPADAS[$PIVOTE_INFE]}-1))
										then
											PUEDE=1
										fi
									else
										if test ${JUGADOR2[$I]} -eq 15
										then
											PUEDE=1
										fi
									fi
								fi

								if test ${JUGADOR2[$I]} -ge 21 -a ${JUGADOR2[$I]} -le 30 
								then
									if test ${BASTOS[4]} -ne 0
									then
										if test ${JUGADOR2[$I]} -eq $((${BASTOS[$PIVOTE_SUPB]}+1))
										then
											PUEDE=1
										fi
										if test ${JUGADOR2[$I]} -eq $((${BASTOS[$PIVOTE_INFB]}-1))
										then
											PUEDE=1
										fi
									else
										if test ${JUGADOR2[$I]} -eq 25
										then
											PUEDE=1
										fi
									fi
								fi

								if test ${JUGADOR2[$I]} -ge 31 -a ${JUGADOR2[$I]} -le 40 
								then
									if test ${COPAS[4]} -ne 0
									then
										if test ${JUGADOR2[$I]} -eq $((${COPAS[$PIVOTE_SUPC]}+1))
										then
											PUEDE=1
										fi
										if test ${JUGADOR2[$I]} -eq $((${COPAS[$PIVOTE_INFC]}-1))
										then
											PUEDE=1
										fi
									else
										if test ${JUGADOR2[$I]} -eq 35
										then
											PUEDE=1
										fi
									fi
								fi 
								I=$(($I+1))
							done

							if test $PUEDE -eq 0
							then
								echo "El JUGADOR 2 PASA"
								TURNO=1
								SUM_TURNO=$(($SUM_TURNO+1))
								EXIT=1
							fi
							
							while test $EXIT -eq 0
							do
								if test $(($CARTA2-1)) -eq 0
								then
									INDICE=0
								else
									INDICE=$((0+ $RANDOM % $CARTA2))
								fi
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
													PIVOTE_SUPE=$(($PIVOTE_SUPE+1))
													ESPADAS[$PIVOTE_SUPE]=${JUGADOR2[$INDICE]}
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
												if test ${JUGADOR2[$INDICE]} -eq 35
												then
													COPAS[4]=${JUGADOR2[$INDICE]}
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

											echo "JUGADOR2 echa ${baraja[${JUGADOR2[$INDICE]}]}"      

											J=$(($I-1))
											if test $FIND -eq 1
											then
												while test $I -lt $CARTA2
												do
													JUGADOR2[$J]=${JUGADOR2[$I]}
													I=$(($I+1))
													J=$(($J+1))
												done
												JUGADOR2[$(($CARTA2-1))]=0
												CARTA2=$(($CARTA2-1))
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

					if test $CARTA2 -eq 0;
					then
						PUNTUAJE=$CARTA1
						GANADOR=2
						FINAL=1
					fi

					if test $SUM_TURNO -eq 2
					then
						RONDA=$(($RONDA+1))
						SUM_TURNO=0
					fi
				done

            else   
            	#Cuatro Jugadores
				I=0
				J=0
				CARTA1=10
				CARTA2=10
				CARTA3=10
				CARTA4=10
				CARTAS=10
				declare -A JUGADOR1
				declare -A JUGADOR2
				declare -A JUGADOR3
				declare -A JUGADOR4
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
				J=0
				CARTAS=$(($CARTA3+$CARTAS))
				while test $I -lt $CARTAS
				do
					JUGADOR3[$J]=${NUMEROS[$I]}
					I=$(($I+1))
					J=$(($J+1))
				done
				J=0
				CARTAS=$(($CARTA4+$CARTAS))
				while test $I -lt $CARTAS
				do
					JUGADOR4[$J]=${NUMEROS[$I]}
					I=$(($I+1))
					J=$(($J+1))
				done
				unset NUMEROS

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

				FINAL=0 
				while test $FINAL -eq 0
				do
					#Presentacion de los datos
					I=0
					echo "-----------------------------------------------------------------------"
					echo "            RONDA $RONDA"
					echo "-----------------------------------------------------------------------"
					echo "POS |   JUGADOR 1   |    JUGADOR 2    |    JUGADOR 3    |    JUGADOR 4"
					while test $I -lt 10
					do
						echo "$I     ${baraja[${JUGADOR1[$I]}]}   ${baraja[${JUGADOR2[$I]}]}   ${baraja[${JUGADOR3[$I]}]}   ${baraja[${JUGADOR3[$I]}]}"
						I=$(($I+1))
					done
					I=0
					echo "-----------------------------------------------------------------------"
					echo "     OROS     |     ESPADAS     |     BASTOS    |     COPAS"
					while test $I -lt 10
					do
						echo " ${baraja[${OROS[$I]}]}   ${baraja[${ESPADAS[$I]}]}   ${baraja[${BASTOS[$I]}]}   ${baraja[${COPAS[$I]}]}"
						I=$(($I+1))
					done
					echo "-----------------------------------------------------------------------"
					echo
					sleep 3

					#TURNO DEL JUGADOR 1
					if test $TURNO -eq 1 -a $FINAL -eq 0
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
							JUGADOR1[$(($CARTA1-1))]=0
							CARTA1=$(($CARTA1-1))
							SUM_TURNO=$(($SUM_TURNO+1))
							TURNO=2
						else
							EXIT=0
							PUEDE=0
							#Comprobamos si el JUGADOR2 puede echar
							I=0
							while test $I -lt $CARTA1 -a $PUEDE -eq 0
							do
								if test ${JUGADOR1[$I]} -ge 1 -a ${JUGADOR1[$I]} -le 10 
								then
									if test ${OROS[4]} -ne 0
									then
										if test ${JUGADOR1[$I]} -eq $((${OROS[$PIVOTE_SUPO]}+1))
										then
											PUEDE=1
											EXIT=0
										fi
										if test ${JUGADOR1[$I]} -eq $((${OROS[$PIVOTE_INFO]}-1))
										then
											PUEDE=1
											EXIT=0
										fi
									else
										if test ${JUGADOR1[$I]} -eq 5
										then
											PUEDE=1
											EXIT=0
										fi
									fi
								fi

								if test ${JUGADOR1[$I]} -ge 11 -a ${JUGADOR1[$I]} -le 20 
								then
									if test ${ESPADAS[4]} -ne 0
									then
										if test ${JUGADOR1[$I]} -eq $((${ESPADAS[$PIVOTE_SUPE]}+1))
										then
											PUEDE=1
											EXIT=0
										fi
										if test ${JUGADOR1[$I]} -eq $((${ESPADAS[$PIVOTE_INFE]}-1))
										then
											PUEDE=1
											EXIT=0
										fi
									else
										if test ${JUGADOR1[$I]} -eq 15
										then
											PUEDE=1
											EXIT=0
										fi
									fi
								fi

								if test ${JUGADOR1[$I]} -ge 21 -a ${JUGADOR1[$I]} -le 30 
								then
									if test ${BASTOS[4]} -ne 0
									then
										if test ${JUGADOR1[$I]} -eq $((${BASTOS[$PIVOTE_SUPB]}+1))
										then
											PUEDE=1
											EXIT=0
										fi
										if test ${JUGADOR1[$I]} -eq $((${BASTOS[$PIVOTE_INFB]}-1))
										then
											PUEDE=1
											EXIT=0
										fi
									else
										if test ${JUGADOR1[$I]} -eq 25
										then
											PUEDE=1
											EXIT=0
										fi
									fi
								fi

								if test ${JUGADOR1[$I]} -ge 31 -a ${JUGADOR1[$I]} -le 40 
								then
									if test ${COPAS[4]} -ne 0
									then
										if test ${JUGADOR1[$I]} -eq $((${COPAS[$PIVOTE_SUPC]}+1))
										then
											PUEDE=1
											EXIT=0
										fi
										if test ${JUGADOR1[$I]} -eq $((${COPAS[$PIVOTE_INFC]}-1))
										then
											PUEDE=1
											EXIT=0
										fi
									else
										if test ${JUGADOR1[$I]} -eq 35
										then
											PUEDE=1
											EXIT=0
										fi
									fi
								fi
								I=$(($I+1))
							done
						
							if test $PUEDE -eq 0
							then
								echo "El JUGADOR 1 PASA"
								TURNO=2
								SUM_TURNO=$(($SUM_TURNO+1))
								EXIT=1
							fi

							while test $EXIT -eq 0
							do
								echo "Elige la posicion de la carta que quieres echar: "
								read INDICE
								CORRECTO=0
								if test  $INDICE -ge 0 -a $INDICE -le $(($CARTA1-1))
								then
									I=0
									FIND=0
									while test $I -lt 20 -a $FIND -eq 0
									do
										if test ${JUGADOR1[$I]} -eq ${JUGADOR1[$INDICE]}
										then
											FIND=1
										fi
											I=$(($I+1))
									done

									CORRECTO=0
									if test $FIND -eq 1
									then
										if test ${JUGADOR1[$INDICE]} -ge 1 -a ${JUGADOR1[$INDICE]} -le 10 
										then
											if test ${OROS[4]} -ne 0
											then
												if test ${JUGADOR1[$INDICE]} -eq $((${OROS[$PIVOTE_SUPO]}+1))
												then
													PIVOTE_SUPO=$(($PIVOTE_SUPO+1))
													OROS[$PIVOTE_SUPO]=${JUGADOR1[$INDICE]}
													CORRECTO=1

												fi
												if test ${JUGADOR1[$INDICE]} -eq $((${OROS[$PIVOTE_INFO]}-1))
												then
													PIVOTE_INFO=$(($PIVOTE_INFO-1))
													OROS[$PIVOTE_INFO]=${JUGADOR1[$INDICE]}
													CORRECTO=1
												fi
											fi
										fi

										if test ${JUGADOR1[$INDICE]} -ge 11 -a ${JUGADOR1[$INDICE]} -le 20 
										then
											if test ${ESPADAS[4]} -ne 0
											then
												if test ${JUGADOR1[$INDICE]} -eq $((${ESPADAS[$PIVOTE_SUPE]}+1))
												then
													PIVOTE_SUPE=$(($PIVOTE_SUPE+1))
													ESPADAS[$PIVOTE_SUPE]=${JUGADOR1[$INDICE]}
													CORRECTO=1

												fi
												if test ${JUGADOR1[$INDICE]} -eq $((${ESPADAS[$PIVOTE_INFE]}-1))
												then
													PIVOTE_INFE=$(($PIVOTE_INFE-1))
													ESPADAS[$PIVOTE_INFE]=${JUGADOR1[$INDICE]}
													CORRECTO=1
												fi
											else
												if test ${JUGADOR1[$INDICE]} -eq 15
												then
													ESPADAS[4]=${JUGADOR1[$INDICE]}
													CORRECTO=1
												fi
											fi
										fi

										if test ${JUGADOR1[$INDICE]} -ge 21 -a ${JUGADOR1[$INDICE]} -le 30 
										then
											if test ${BASTOS[4]} -ne 0
											then
												if test ${JUGADOR1[$INDICE]} -eq $((${BASTOS[$PIVOTE_SUPB]}+1))
												then
													PIVOTE_SUPB=$(($PIVOTE_SUPB+1))
													BASTOS[$PIVOTE_SUPB]=${JUGADOR1[$INDICE]}
													CORRECTO=1

												fi
												if test ${JUGADOR1[$INDICE]} -eq $((${BASTOS[$PIVOTE_INFB]}-1))
												then
													PIVOTE_INFB=$(($PIVOTE_INFB-1))
													BASTOS[$PIVOTE_INFB]=${JUGADOR1[$INDICE]}
													CORRECTO=1
												fi
											else
												if test ${JUGADOR1[$INDICE]} -eq 25
												then
													BASTOS[4]=${JUGADOR1[$INDICE]}
													CORRECTO=1
												fi
											fi
										fi

										if test ${JUGADOR1[$INDICE]} -ge 31 -a ${JUGADOR1[$INDICE]} -le 40 
										then
											if test ${COPAS[4]} -ne 0
											then
												if test ${JUGADOR1[$INDICE]} -eq $((${COPAS[$PIVOTE_SUPC]}+1))
												then
													PIVOTE_SUPC=$(($PIVOTE_SUPC+1))
													COPAS[$PIVOTE_SUPC]=${JUGADOR1[$INDICE]}
													CORRECTO=1

												fi
												if test ${JUGADOR1[$INDICE]} -eq $((${COPAS[$PIVOTE_INFC]}-1))
												then
													PIVOTE_INFC=$(($PIVOTE_INFC-1))
													COPAS[$PIVOTE_INFC]=${JUGADOR1[$INDICE]}
													CORRECTO=1
												fi
											else
												if test ${JUGADOR1[$INDICE]} -eq 35
												then
													COPAS[4]=${JUGADOR1[$INDICE]}
													CORRECTO=1
												fi
											fi
										fi

										if test $CORRECTO -eq 1
										then
											while test $I -lt $CARTA1 -a $FIND -eq 0
											do
												if test ${JUGADOR1[$I]} -eq 5
												then
													FIND=1
												fi
											I=$(($I+1))
											done

											echo "JUGADOR1 echa ${baraja[${JUGADOR1[$INDICE]}]}"

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
											
											JUGADOR1[$(($CARTA1-1))]=0
											CARTA1=$(($CARTA1-1))
											SUM_TURNO=$(($SUM_TURNO+1))
											TURNO=2
											EXIT=1
										fi
									fi
								else
									echo "El indice no es valido"
								fi  
							done
						fi
					fi


					if test $CARTA1 -eq 0;
					then
						PUNTUAJE=$(($CARTA2+$CARTA3))
						PUNTUAJE=$(($PUNTUAJE+$CARTA4))
						GANADOR=1
						FINAL=1
					fi

					#Turno del JUGADOR 2
					if test $TURNO -eq 2 -a $FINAL -eq 0
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
							JUGADOR2[$(($CARTA2-1))]=0
							CARTA2=$(($CARTA2-1))
							SUM_TURNO=$(($SUM_TURNO+1))
							TURNO=3
						else
							EXIT=0
							PUEDE=0
							#Comprobamos si el JUGADOR2 puede echar
							I=0
							while test $I -lt $CARTA2 -a $PUEDE -eq 0
							do
								if test ${JUGADOR2[$I]} -ge 1 -a ${JUGADOR2[$I]} -le 10 
								then
									if test ${OROS[4]} -ne 0
									then
										if test ${JUGADOR2[$I]} -eq $((${OROS[$PIVOTE_SUPO]}+1))
										then
											PUEDE=1
										fi
										if test ${JUGADOR2[$I]} -eq $((${OROS[$PIVOTE_INFO]}-1))
										then
											PUEDE=1
										fi
									else
										if test ${JUGADOR2[$I]} -eq 5
										then
											PUEDE=1
										fi
									fi
								fi

								if test ${JUGADOR2[$I]} -ge 11 -a ${JUGADOR2[$I]} -le 20 
								then
									if test ${ESPADAS[4]} -ne 0
									then
										if test ${JUGADOR2[$I]} -eq $((${ESPADAS[$PIVOTE_SUPE]}+1))
										then
											PUEDE=1
										fi
										if test ${JUGADOR2[$I]} -eq $((${ESPADAS[$PIVOTE_INFE]}-1))
										then
											PUEDE=1
										fi
									else
										if test ${JUGADOR2[$I]} -eq 15
										then
											PUEDE=1
										fi
									fi
								fi

								if test ${JUGADOR2[$I]} -ge 21 -a ${JUGADOR2[$I]} -le 30 
								then
									if test ${BASTOS[4]} -ne 0
									then
										if test ${JUGADOR2[$I]} -eq $((${BASTOS[$PIVOTE_SUPB]}+1))
										then
											PUEDE=1
										fi
										if test ${JUGADOR2[$I]} -eq $((${BASTOS[$PIVOTE_INFB]}-1))
										then
											PUEDE=1
										fi
									else
										if test ${JUGADOR2[$I]} -eq 25
										then
											PUEDE=1
										fi
									fi
								fi

								if test ${JUGADOR2[$I]} -ge 31 -a ${JUGADOR2[$I]} -le 40 
								then
									if test ${COPAS[4]} -ne 0
									then
										if test ${JUGADOR2[$I]} -eq $((${COPAS[$PIVOTE_SUPC]}+1))
										then
											PUEDE=1
										fi
										if test ${JUGADOR2[$I]} -eq $((${COPAS[$PIVOTE_INFC]}-1))
										then
											PUEDE=1
										fi
									else
										if test ${JUGADOR2[$I]} -eq 35
										then
											PUEDE=1
										fi
									fi
								fi 
								I=$(($I+1))
							done

							if test $PUEDE -eq 0
							then
								echo "El JUGADOR 2 PASA"
								TURNO=3
								SUM_TURNO=$(($SUM_TURNO+1))
								EXIT=1
							fi
							
							while test $EXIT -eq 0
							do
								if test $(($CARTA2-1)) -eq 0
								then
									INDICE=0
								else
									INDICE=$((0+ $RANDOM % $CARTA2))
								fi
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
													PIVOTE_SUPE=$(($PIVOTE_SUPE+1))
													ESPADAS[$PIVOTE_SUPE]=${JUGADOR2[$INDICE]}
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
												if test ${JUGADOR2[$INDICE]} -eq 35
												then
													COPAS[4]=${JUGADOR2[$INDICE]}
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

											echo "JUGADOR2 echa ${baraja[${JUGADOR2[$INDICE]}]}"      

											J=$(($I-1))
											if test $FIND -eq 1
											then
												while test $I -lt $CARTA2
												do
													JUGADOR2[$J]=${JUGADOR2[$I]}
													I=$(($I+1))
													J=$(($J+1))
												done
												JUGADOR2[$(($CARTA2-1))]=0
												CARTA2=$(($CARTA2-1))
												SUM_TURNO=$(($SUM_TURNO+1))
												TURNO=3
												EXIT=1
											fi
										fi
									fi
								fi  
							done
						fi
					fi

					if test $CARTA2 -eq 0;
					then
						PUNTUAJE=$(($CARTA1+$CARTA4))
						PUNTUAJE=$(($PUNTUAJE+$CARTA3))
						GANADOR=2
						FINAL=1
					fi

					#Turno del JUGADOR 3
					if test $TURNO -eq 3 -a $FINAL -eq 0
					then
						echo Turno del JUGADOR 3
						if test ${OROS[4]} -eq 0
						then
							echo "Comienza el 5 de Oros"
							OROS[4]=5
							I=0
							FIND=0
							#Buscamos el 5 de oros en el vector de los JUGADOR 1
							while test $I -lt $CARTA3 -a $FIND -eq 0
							do
								if test ${JUGADOR3[$I]} -eq 5
								then
									FIND=1
								fi
								I=$(($I+1))
							done

							#Redimensionamos el vector
							J=$(($I-1))
							if test $FIND -eq 1
							then
								while test $I -lt $CARTA3
								do
									JUGADOR3[$J]=${JUGADOR3[$I]}
									I=$(($I+1))
									J=$(($J+1))
								done
							fi
							JUGADOR3[$(($CARTA3-1))]=0
							CARTA3=$(($CARTA3-1))
							SUM_TURNO=$(($SUM_TURNO+1))
							TURNO=4
						else
							EXIT=0
							PUEDE=0
							#Comprobamos si el JUGADOR3 puede echar
							I=0
							while test $I -lt $CARTA3 -a $PUEDE -eq 0
							do
								if test ${JUGADOR3[$I]} -ge 1 -a ${JUGADOR3[$I]} -le 10 
								then
									if test ${OROS[4]} -ne 0
									then
										if test ${JUGADOR3[$I]} -eq $((${OROS[$PIVOTE_SUPO]}+1))
										then
											PUEDE=1
										fi
										if test ${JUGADOR3[$I]} -eq $((${OROS[$PIVOTE_INFO]}-1))
										then
											PUEDE=1
										fi
									else
										if test ${JUGADOR3[$I]} -eq 5
										then
											PUEDE=1
										fi
									fi
								fi

								if test ${JUGADOR3[$I]} -ge 11 -a ${JUGADOR3[$I]} -le 20 
								then
									if test ${ESPADAS[4]} -ne 0
									then
										if test ${JUGADOR3[$I]} -eq $((${ESPADAS[$PIVOTE_SUPE]}+1))
										then
											PUEDE=1
										fi
										if test ${JUGADOR3[$I]} -eq $((${ESPADAS[$PIVOTE_INFE]}-1))
										then
											PUEDE=1
										fi
									else
										if test ${JUGADOR3[$I]} -eq 15
										then
											PUEDE=1
										fi
									fi
								fi

								if test ${JUGADOR3[$I]} -ge 21 -a ${JUGADOR3[$I]} -le 30 
								then
									if test ${BASTOS[4]} -ne 0
									then
										if test ${JUGADOR3[$I]} -eq $((${BASTOS[$PIVOTE_SUPB]}+1))
										then
											PUEDE=1
										fi
										if test ${JUGADOR3[$I]} -eq $((${BASTOS[$PIVOTE_INFB]}-1))
										then
											PUEDE=1
										fi
									else
										if test ${JUGADOR3[$I]} -eq 25
										then
											PUEDE=1
										fi
									fi
								fi

								if test ${JUGADOR3[$I]} -ge 31 -a ${JUGADOR3[$I]} -le 40 
								then
									if test ${COPAS[4]} -ne 0
									then
										if test ${JUGADOR3[$I]} -eq $((${COPAS[$PIVOTE_SUPC]}+1))
										then
											PUEDE=1
										fi
										if test ${JUGADOR3[$I]} -eq $((${COPAS[$PIVOTE_INFC]}-1))
										then
											PUEDE=1
										fi
									else
										if test ${JUGADOR3[$I]} -eq 35
										then
											PUEDE=1
										fi
									fi
								fi 
								I=$(($I+1))
							done

							if test $PUEDE -eq 0
							then
								echo "El JUGADOR 3 PASA"
								TURNO=4
								SUM_TURNO=$(($SUM_TURNO+1))
								EXIT=1
							fi
							
							while test $EXIT -eq 0
							do
								
								#Estrategias
								EST=0
								if test $EST -eq 0
								then
									if test $(($CARTA3-1)) -eq 0
									then
										INDICE=0
									else
										INDICE=$((0+ $RANDOM % $CARTA3))
									fi
								fi
								if test $EST -eq 1
								then
									#Al no estar implementada se usa la 0
									if test $(($CARTA3-1)) -eq 0
									then
										INDICE=0
									else
										INDICE=$((0+ $RANDOM % $CARTA3))
									fi
								fi
								if test $EST -eq 2
								then
									#Al no estar implementada se usa la 0
									if test $(($CARTA3-1)) -eq 0
									then
										INDICE=0
									else
										INDICE=$((0+ $RANDOM % $CARTA3))
									fi
								fi

								CORRECTO=0
								if test  $INDICE -ge 0 -a $INDICE -le $(($CARTA3-1))
								then
									I=0
									FIND=0
									while test $I -lt 20 -a $FIND -eq 0
									do
										if test ${JUGADOR3[$I]} -eq ${JUGADOR3[$INDICE]}
										then
											FIND=1
										fi
											I=$(($I+1))
									done

									CORRECTO=0
									if test $FIND -eq 1
									then
										if test ${JUGADOR3[$INDICE]} -ge 1 -a ${JUGADOR3[$INDICE]} -le 10 
										then
											if test ${OROS[4]} -ne 0
											then
												if test ${JUGADOR3[$INDICE]} -eq $((${OROS[$PIVOTE_SUPO]}+1))
												then
													PIVOTE_SUPO=$(($PIVOTE_SUPO+1))
													OROS[$PIVOTE_SUPO]=${JUGADOR3[$INDICE]}
													CORRECTO=1

												fi
												if test ${JUGADOR3[$INDICE]} -eq $((${OROS[$PIVOTE_INFO]}-1))
												then
													PIVOTE_INFO=$(($PIVOTE_INFO-1))
													OROS[$PIVOTE_INFO]=${JUGADOR3[$INDICE]}
													CORRECTO=1
												fi
											fi
										fi

										if test ${JUGADOR3[$INDICE]} -ge 11 -a ${JUGADOR3[$INDICE]} -le 20 
										then
											if test ${ESPADAS[4]} -ne 0
											then
												if test ${JUGADOR3[$INDICE]} -eq $((${ESPADAS[$PIVOTE_SUPE]}+1))
												then
													PIVOTE_SUPE=$(($PIVOTE_SUPE+1))
													ESPADAS[$PIVOTE_SUPE]=${JUGADOR3[$INDICE]}
													CORRECTO=1

												fi
												if test ${JUGADOR3[$INDICE]} -eq $((${ESPADAS[$PIVOTE_INFE]}-1))
												then
													PIVOTE_INFE=$(($PIVOTE_INFE-1))
													ESPADAS[$PIVOTE_INFE]=${JUGADOR3[$INDICE]}
													CORRECTO=1
												fi
											else
												if test ${JUGADOR3[$INDICE]} -eq 15
												then
													ESPADAS[4]=${JUGADOR3[$INDICE]}
													CORRECTO=1
												fi
											fi
										fi

										if test ${JUGADOR3[$INDICE]} -ge 21 -a ${JUGADOR3[$INDICE]} -le 30 
										then
											if test ${BASTOS[4]} -ne 0
											then
												if test ${JUGADOR3[$INDICE]} -eq $((${BASTOS[$PIVOTE_SUPB]}+1))
												then
													PIVOTE_SUPB=$(($PIVOTE_SUPB+1))
													BASTOS[$PIVOTE_SUPB]=${JUGADOR3[$INDICE]}
													CORRECTO=1

												fi
												if test ${JUGADOR3[$INDICE]} -eq $((${BASTOS[$PIVOTE_INFB]}-1))
												then
													PIVOTE_INFB=$(($PIVOTE_INFB-1))
													BASTOS[$PIVOTE_INFB]=${JUGADOR3[$INDICE]}
													CORRECTO=1
												fi
											else
												if test ${JUGADOR3[$INDICE]} -eq 25
												then
													BASTOS[4]=${JUGADOR3[$INDICE]}
													CORRECTO=1
												fi
											fi
										fi

										if test ${JUGADOR3[$INDICE]} -ge 31 -a ${JUGADOR3[$INDICE]} -le 40 
										then
											if test ${COPAS[4]} -ne 0
											then
												if test ${JUGADOR3[$INDICE]} -eq $((${COPAS[$PIVOTE_SUPC]}+1))
												then
													PIVOTE_SUPC=$(($PIVOTE_SUPC+1))
													COPAS[$PIVOTE_SUPC]=${JUGADOR3[$INDICE]}
													CORRECTO=1

												fi
												if test ${JUGADOR3[$INDICE]} -eq $((${COPAS[$PIVOTE_INFC]}-1))
												then
													PIVOTE_INFC=$(($PIVOTE_INFC-1))
													COPAS[$PIVOTE_INFC]=${JUGADOR3[$INDICE]}
													CORRECTO=1
												fi
											else
												if test ${JUGADOR3[$INDICE]} -eq 35
												then
													COPAS[4]=${JUGADOR3[$INDICE]}
													CORRECTO=1
												fi
											fi
										fi

										if test $CORRECTO -eq 1
										then
											while test $I -lt $CARTA3 -a $FIND -eq 0
											do
												if test ${JUGADOR3[$I]} -eq 5
												then
													FIND=1
												fi
											I=$(($I+1))
											done

											echo "JUGADOR3 echa ${baraja[${JUGADOR3[$INDICE]}]}"      

											J=$(($I-1))
											if test $FIND -eq 1
											then
												while test $I -lt $CARTA3
												do
													JUGADOR3[$J]=${JUGADOR3[$I]}
													I=$(($I+1))
													J=$(($J+1))
												done
												JUGADOR3[$(($CARTA3-1))]=0
												CARTA3=$(($CARTA3-1))
												SUM_TURNO=$(($SUM_TURNO+1))
												TURNO=4
												EXIT=1
											fi
										fi
									fi
								fi  
							done
						fi
					fi

					if test $CARTA3 -eq 0;
					then
						PUNTUAJE=$(($CARTA1+$CARTA2))
						PUNTUAJE=$(($PUNTUAJE+$CARTA4))
						GANADOR=2
						FINAL=1
					fi

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

					if test $CARTA4 -eq 0;
					then
						PUNTUAJE=$(($CARTA1+$CARTA2))
						PUNTUAJE=$(($PUNTUAJE+$CARTA3))
						GANADOR=2
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
			#Tres Jugadores
			I=0
			J=0
			CARTA1=14
			CARTA2=13
			CARTA3=13
			CARTAS=0
			declare -A JUGADOR1
			declare -A JUGADOR2
			declare -A JUGADOR3
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
			J=0
			CARTAS=$(($CARTA3+$CARTAS))
			while test $I -lt $CARTAS
			do
				JUGADOR3[$J]=${NUMEROS[$I]}
				I=$(($I+1))
				J=$(($J+1))
			done
			JUGADOR2[$(($CARTA-1))]=0
			JUGADOR3[$(($CARTA-1))]=0
			unset NUMEROS

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

			I=0
			EMPIEZA3=0
			while test $I -lt $CARTA3 -a $EMPIEZA3 -eq 0
			do 
				if test ${JUGADOR2[$I]} -eq 5
				then
					EMPIEZA3=1
				fi
				I=$(($I+1))
			done

			if test $EMPIEZA3 -eq 1
			then
				TURNO=3;
			fi

			FINAL=0 
			while test $FINAL -eq 0
			do
				#Presentacion de los datos
				I=0
				echo "--------------------------------------------------------------"
				echo "            RONDA $RONDA"
				echo "--------------------------------------------------------------"
				echo "POS |   JUGADOR 1   |    JUGADOR 2    |    JUGADOR 3"
				while test $I -lt 13
				do
					echo "$I     ${baraja[${JUGADOR1[$I]}]}   ${baraja[${JUGADOR2[$I]}]}   ${baraja[${JUGADOR3[$I]}]}"
					I=$(($I+1))
				done
				echo "$I     ${baraja[${JUGADOR1[13]}]} "
				I=0
				echo "--------------------------------------------------------------"
				echo "     OROS     |     ESPADAS     |     BASTOS    |     COPAS"
				while test $I -lt 10
				do
					echo " ${baraja[${OROS[$I]}]}   ${baraja[${ESPADAS[$I]}]}   ${baraja[${BASTOS[$I]}]}   ${baraja[${COPAS[$I]}]}"
					I=$(($I+1))
				done
				echo "--------------------------------------------------------------"
				echo
				sleep 3

				#TURNO DEL JUGADOR 1
				if test $TURNO -eq 1 -a $FINAL -eq 0
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
						JUGADOR1[$(($CARTA1-1))]=0
						CARTA1=$(($CARTA1-1))
						SUM_TURNO=$(($SUM_TURNO+1))
						TURNO=2
					else
						EXIT=0
						PUEDE=0
						#Comprobamos si el JUGADOR2 puede echar
						I=0
						while test $I -lt $CARTA1 -a $PUEDE -eq 0
						do
							if test ${JUGADOR1[$I]} -ge 1 -a ${JUGADOR1[$I]} -le 10 
							then
								if test ${OROS[4]} -ne 0
								then
									if test ${JUGADOR1[$I]} -eq $((${OROS[$PIVOTE_SUPO]}+1))
									then
										PUEDE=1
										EXIT=0
									fi
									if test ${JUGADOR1[$I]} -eq $((${OROS[$PIVOTE_INFO]}-1))
									then
										PUEDE=1
										EXIT=0
									fi
								else
									if test ${JUGADOR1[$I]} -eq 5
									then
										PUEDE=1
										EXIT=0
									fi
								fi
							fi

							if test ${JUGADOR1[$I]} -ge 11 -a ${JUGADOR1[$I]} -le 20 
							then
								if test ${ESPADAS[4]} -ne 0
								then
									if test ${JUGADOR1[$I]} -eq $((${ESPADAS[$PIVOTE_SUPE]}+1))
									then
										PUEDE=1
										EXIT=0
									fi
									if test ${JUGADOR1[$I]} -eq $((${ESPADAS[$PIVOTE_INFE]}-1))
									then
										PUEDE=1
										EXIT=0
									fi
								else
									if test ${JUGADOR1[$I]} -eq 15
									then
										PUEDE=1
										EXIT=0
									fi
								fi
							fi

							if test ${JUGADOR1[$I]} -ge 21 -a ${JUGADOR1[$I]} -le 30 
							then
								if test ${BASTOS[4]} -ne 0
								then
									if test ${JUGADOR1[$I]} -eq $((${BASTOS[$PIVOTE_SUPB]}+1))
									then
										PUEDE=1
										EXIT=0
									fi
									if test ${JUGADOR1[$I]} -eq $((${BASTOS[$PIVOTE_INFB]}-1))
									then
										PUEDE=1
										EXIT=0
									fi
								else
									if test ${JUGADOR1[$I]} -eq 25
									then
										PUEDE=1
										EXIT=0
									fi
								fi
							fi

							if test ${JUGADOR1[$I]} -ge 31 -a ${JUGADOR1[$I]} -le 40 
							then
								if test ${COPAS[4]} -ne 0
								then
									if test ${JUGADOR1[$I]} -eq $((${COPAS[$PIVOTE_SUPC]}+1))
									then
										PUEDE=1
										EXIT=0
									fi
									if test ${JUGADOR1[$I]} -eq $((${COPAS[$PIVOTE_INFC]}-1))
									then
										PUEDE=1
										EXIT=0
									fi
								else
									if test ${JUGADOR1[$I]} -eq 35
									then
										PUEDE=1
										EXIT=0
									fi
								fi
							fi
							I=$(($I+1))
						done
					
						if test $PUEDE -eq 0
						then
							echo "El JUGADOR 1 PASA"
							TURNO=2
							SUM_TURNO=$(($SUM_TURNO+1))
							EXIT=1
						fi

						while test $EXIT -eq 0
						do
							echo "Elige la posicion de la carta que quieres echar: "
							read INDICE
							CORRECTO=0
							if test  $INDICE -ge 0 -a $INDICE -le $(($CARTA1-1))
							then
								I=0
								FIND=0
								while test $I -lt 20 -a $FIND -eq 0
								do
									if test ${JUGADOR1[$I]} -eq ${JUGADOR1[$INDICE]}
									then
										FIND=1
									fi
										I=$(($I+1))
								done

								CORRECTO=0
								if test $FIND -eq 1
								then
									if test ${JUGADOR1[$INDICE]} -ge 1 -a ${JUGADOR1[$INDICE]} -le 10 
									then
										if test ${OROS[4]} -ne 0
										then
											if test ${JUGADOR1[$INDICE]} -eq $((${OROS[$PIVOTE_SUPO]}+1))
											then
												PIVOTE_SUPO=$(($PIVOTE_SUPO+1))
												OROS[$PIVOTE_SUPO]=${JUGADOR1[$INDICE]}
												CORRECTO=1

											fi
											if test ${JUGADOR1[$INDICE]} -eq $((${OROS[$PIVOTE_INFO]}-1))
											then
												PIVOTE_INFO=$(($PIVOTE_INFO-1))
												OROS[$PIVOTE_INFO]=${JUGADOR1[$INDICE]}
												CORRECTO=1
											fi
										fi
									fi

									if test ${JUGADOR1[$INDICE]} -ge 11 -a ${JUGADOR1[$INDICE]} -le 20 
									then
										if test ${ESPADAS[4]} -ne 0
										then
											if test ${JUGADOR1[$INDICE]} -eq $((${ESPADAS[$PIVOTE_SUPE]}+1))
											then
												PIVOTE_SUPE=$(($PIVOTE_SUPE+1))
												ESPADAS[$PIVOTE_SUPE]=${JUGADOR1[$INDICE]}
												CORRECTO=1

											fi
											if test ${JUGADOR1[$INDICE]} -eq $((${ESPADAS[$PIVOTE_INFE]}-1))
											then
												PIVOTE_INFE=$(($PIVOTE_INFE-1))
												ESPADAS[$PIVOTE_INFE]=${JUGADOR1[$INDICE]}
												CORRECTO=1
											fi
										else
											if test ${JUGADOR1[$INDICE]} -eq 15
											then
												ESPADAS[4]=${JUGADOR1[$INDICE]}
												CORRECTO=1
											fi
										fi
									fi

									if test ${JUGADOR1[$INDICE]} -ge 21 -a ${JUGADOR1[$INDICE]} -le 30 
									then
										if test ${BASTOS[4]} -ne 0
										then
											if test ${JUGADOR1[$INDICE]} -eq $((${BASTOS[$PIVOTE_SUPB]}+1))
											then
												PIVOTE_SUPB=$(($PIVOTE_SUPB+1))
												BASTOS[$PIVOTE_SUPB]=${JUGADOR1[$INDICE]}
												CORRECTO=1

											fi
											if test ${JUGADOR1[$INDICE]} -eq $((${BASTOS[$PIVOTE_INFB]}-1))
											then
												PIVOTE_INFB=$(($PIVOTE_INFB-1))
												BASTOS[$PIVOTE_INFB]=${JUGADOR1[$INDICE]}
												CORRECTO=1
											fi
										else
											if test ${JUGADOR1[$INDICE]} -eq 25
											then
												BASTOS[4]=${JUGADOR1[$INDICE]}
												CORRECTO=1
											fi
										fi
									fi

									if test ${JUGADOR1[$INDICE]} -ge 31 -a ${JUGADOR1[$INDICE]} -le 40 
									then
										if test ${COPAS[4]} -ne 0
										then
											if test ${JUGADOR1[$INDICE]} -eq $((${COPAS[$PIVOTE_SUPC]}+1))
											then
												PIVOTE_SUPC=$(($PIVOTE_SUPC+1))
												COPAS[$PIVOTE_SUPC]=${JUGADOR1[$INDICE]}
												CORRECTO=1

											fi
											if test ${JUGADOR1[$INDICE]} -eq $((${COPAS[$PIVOTE_INFC]}-1))
											then
												PIVOTE_INFC=$(($PIVOTE_INFC-1))
												COPAS[$PIVOTE_INFC]=${JUGADOR1[$INDICE]}
												CORRECTO=1
											fi
										else
											if test ${JUGADOR1[$INDICE]} -eq 35
											then
												COPAS[4]=${JUGADOR1[$INDICE]}
												CORRECTO=1
											fi
										fi
									fi

									if test $CORRECTO -eq 1
									then
										while test $I -lt $CARTA1 -a $FIND -eq 0
										do
											if test ${JUGADOR1[$I]} -eq 5
											then
												FIND=1
											fi
										I=$(($I+1))
										done

										echo "JUGADOR1 echa ${baraja[${JUGADOR1[$INDICE]}]}"

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
										
										JUGADOR1[$(($CARTA1-1))]=0
										CARTA1=$(($CARTA1-1))
										SUM_TURNO=$(($SUM_TURNO+1))
										TURNO=2
										EXIT=1
									fi
								fi
							else
								echo "El indice no es valido"
							fi  
						done
					fi
				fi


				if test $CARTA1 -eq 0;
				then
					PUNTUAJE=$(($CARTA3+$CARTA2))
					GANADOR=1
					FINAL=1
				fi

				#Turno del JUGADOR 2
				if test $TURNO -eq 2 -a $FINAL -eq 0
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
						JUGADOR2[$(($CARTA2-1))]=0
						CARTA2=$(($CARTA2-1))
						SUM_TURNO=$(($SUM_TURNO+1))
						TURNO=3
					else
						EXIT=0
						PUEDE=0
						#Comprobamos si el JUGADOR2 puede echar
						I=0
						while test $I -lt $CARTA2 -a $PUEDE -eq 0
						do
							if test ${JUGADOR2[$I]} -ge 1 -a ${JUGADOR2[$I]} -le 10 
							then
								if test ${OROS[4]} -ne 0
								then
									if test ${JUGADOR2[$I]} -eq $((${OROS[$PIVOTE_SUPO]}+1))
									then
										PUEDE=1
									fi
									if test ${JUGADOR2[$I]} -eq $((${OROS[$PIVOTE_INFO]}-1))
									then
										PUEDE=1
									fi
								else
									if test ${JUGADOR2[$I]} -eq 5
									then
										PUEDE=1
									fi
								fi
							fi

							if test ${JUGADOR2[$I]} -ge 11 -a ${JUGADOR2[$I]} -le 20 
							then
								if test ${ESPADAS[4]} -ne 0
								then
									if test ${JUGADOR2[$I]} -eq $((${ESPADAS[$PIVOTE_SUPE]}+1))
									then
										PUEDE=1
									fi
									if test ${JUGADOR2[$I]} -eq $((${ESPADAS[$PIVOTE_INFE]}-1))
									then
										PUEDE=1
									fi
								else
									if test ${JUGADOR2[$I]} -eq 15
									then
										PUEDE=1
									fi
								fi
							fi

							if test ${JUGADOR2[$I]} -ge 21 -a ${JUGADOR2[$I]} -le 30 
							then
								if test ${BASTOS[4]} -ne 0
								then
									if test ${JUGADOR2[$I]} -eq $((${BASTOS[$PIVOTE_SUPB]}+1))
									then
										PUEDE=1
									fi
									if test ${JUGADOR2[$I]} -eq $((${BASTOS[$PIVOTE_INFB]}-1))
									then
										PUEDE=1
									fi
								else
									if test ${JUGADOR2[$I]} -eq 25
									then
										PUEDE=1
									fi
								fi
							fi

							if test ${JUGADOR2[$I]} -ge 31 -a ${JUGADOR2[$I]} -le 40 
							then
								if test ${COPAS[4]} -ne 0
								then
									if test ${JUGADOR2[$I]} -eq $((${COPAS[$PIVOTE_SUPC]}+1))
									then
										PUEDE=1
									fi
									if test ${JUGADOR2[$I]} -eq $((${COPAS[$PIVOTE_INFC]}-1))
									then
										PUEDE=1
									fi
								else
									if test ${JUGADOR2[$I]} -eq 35
									then
										PUEDE=1
									fi
								fi
							fi 
							I=$(($I+1))
						done

						if test $PUEDE -eq 0
						then
							echo "El JUGADOR 2 PASA"
							TURNO=3
							SUM_TURNO=$(($SUM_TURNO+1))
							EXIT=1
						fi
						
						while test $EXIT -eq 0
						do
							if test $(($CARTA2-1)) -eq 0
							then
								INDICE=0
							else
								INDICE=$((0+ $RANDOM % $CARTA2))
							fi
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
												PIVOTE_SUPE=$(($PIVOTE_SUPE+1))
												ESPADAS[$PIVOTE_SUPE]=${JUGADOR2[$INDICE]}
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
											if test ${JUGADOR2[$INDICE]} -eq 35
											then
												COPAS[4]=${JUGADOR2[$INDICE]}
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

										echo "JUGADOR2 echa ${baraja[${JUGADOR2[$INDICE]}]}"      

										J=$(($I-1))
										if test $FIND -eq 1
										then
											while test $I -lt $CARTA2
											do
												JUGADOR2[$J]=${JUGADOR2[$I]}
												I=$(($I+1))
												J=$(($J+1))
											done
											JUGADOR2[$(($CARTA2-1))]=0
											CARTA2=$(($CARTA2-1))
											SUM_TURNO=$(($SUM_TURNO+1))
											TURNO=3
											EXIT=1
										fi
									fi
								fi
							fi  
						done
					fi
				fi

				if test $CARTA2 -eq 0;
				then
					PUNTUAJE=$(($CARTA1+$CARTA3))
					GANADOR=2
					FINAL=1
				fi

				#Turno del JUGADOR 3
				if test $TURNO -eq 3 -a $FINAL -eq 0
				then
					echo Turno del JUGADOR 3
					if test ${OROS[4]} -eq 0
					then
						echo "Comienza el 5 de Oros"
						OROS[4]=5
						I=0
						FIND=0
						#Buscamos el 5 de oros en el vector de los JUGADOR 1
						while test $I -lt $CARTA3 -a $FIND -eq 0
						do
							if test ${JUGADOR3[$I]} -eq 5
							then
								FIND=1
							fi
							I=$(($I+1))
						done

						#Redimensionamos el vector
						J=$(($I-1))
						if test $FIND -eq 1
						then
							while test $I -lt $CARTA3
							do
								JUGADOR3[$J]=${JUGADOR3[$I]}
								I=$(($I+1))
								J=$(($J+1))
							done
						fi
						JUGADOR3[$(($CARTA3-1))]=0
						CARTA3=$(($CARTA3-1))
						SUM_TURNO=$(($SUM_TURNO+1))
						TURNO=1
					else
						EXIT=0
						PUEDE=0
						#Comprobamos si el JUGADOR3 puede echar
						I=0
						while test $I -lt $CARTA3 -a $PUEDE -eq 0
						do
							if test ${JUGADOR3[$I]} -ge 1 -a ${JUGADOR3[$I]} -le 10 
							then
								if test ${OROS[4]} -ne 0
								then
									if test ${JUGADOR3[$I]} -eq $((${OROS[$PIVOTE_SUPO]}+1))
									then
										PUEDE=1
									fi
									if test ${JUGADOR3[$I]} -eq $((${OROS[$PIVOTE_INFO]}-1))
									then
										PUEDE=1
									fi
								else
									if test ${JUGADOR3[$I]} -eq 5
									then
										PUEDE=1
									fi
								fi
							fi

							if test ${JUGADOR3[$I]} -ge 11 -a ${JUGADOR3[$I]} -le 20 
							then
								if test ${ESPADAS[4]} -ne 0
								then
									if test ${JUGADOR3[$I]} -eq $((${ESPADAS[$PIVOTE_SUPE]}+1))
									then
										PUEDE=1
									fi
									if test ${JUGADOR3[$I]} -eq $((${ESPADAS[$PIVOTE_INFE]}-1))
									then
										PUEDE=1
									fi
								else
									if test ${JUGADOR3[$I]} -eq 15
									then
										PUEDE=1
									fi
								fi
							fi

							if test ${JUGADOR3[$I]} -ge 21 -a ${JUGADOR3[$I]} -le 30 
							then
								if test ${BASTOS[4]} -ne 0
								then
									if test ${JUGADOR3[$I]} -eq $((${BASTOS[$PIVOTE_SUPB]}+1))
									then
										PUEDE=1
									fi
									if test ${JUGADOR3[$I]} -eq $((${BASTOS[$PIVOTE_INFB]}-1))
									then
										PUEDE=1
									fi
								else
									if test ${JUGADOR3[$I]} -eq 25
									then
										PUEDE=1
									fi
								fi
							fi

							if test ${JUGADOR3[$I]} -ge 31 -a ${JUGADOR3[$I]} -le 40 
							then
								if test ${COPAS[4]} -ne 0
								then
									if test ${JUGADOR3[$I]} -eq $((${COPAS[$PIVOTE_SUPC]}+1))
									then
										PUEDE=1
									fi
									if test ${JUGADOR3[$I]} -eq $((${COPAS[$PIVOTE_INFC]}-1))
									then
										PUEDE=1
									fi
								else
									if test ${JUGADOR3[$I]} -eq 35
									then
										PUEDE=1
									fi
								fi
							fi 
							I=$(($I+1))
						done

						if test $PUEDE -eq 0
						then
							echo "El JUGADOR 3 PASA"
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
								if test $(($CARTA3-1)) -eq 0
								then
									INDICE=0
								else
									INDICE=$((0+ $RANDOM % $CARTA3))
								fi
							fi
							if test $EST -eq 1
							then
								#Al no estar implementada se usa la 0
								if test $(($CARTA3-1)) -eq 0
								then
									INDICE=0
								else
									INDICE=$((0+ $RANDOM % $CARTA3))
								fi
							fi
							if test $EST -eq 2
							then
								#Al no estar implementada se usa la 0
								if test $(($CARTA3-1)) -eq 0
								then
									INDICE=0
								else
									INDICE=$((0+ $RANDOM % $CARTA3))
								fi
							fi

							CORRECTO=0
							if test  $INDICE -ge 0 -a $INDICE -le $(($CARTA3-1))
							then
								I=0
								FIND=0
								while test $I -lt 20 -a $FIND -eq 0
								do
									if test ${JUGADOR3[$I]} -eq ${JUGADOR3[$INDICE]}
									then
										FIND=1
									fi
										I=$(($I+1))
								done

								CORRECTO=0
								if test $FIND -eq 1
								then
									if test ${JUGADOR3[$INDICE]} -ge 1 -a ${JUGADOR3[$INDICE]} -le 10 
									then
										if test ${OROS[4]} -ne 0
										then
											if test ${JUGADOR3[$INDICE]} -eq $((${OROS[$PIVOTE_SUPO]}+1))
											then
												PIVOTE_SUPO=$(($PIVOTE_SUPO+1))
												OROS[$PIVOTE_SUPO]=${JUGADOR3[$INDICE]}
												CORRECTO=1

											fi
											if test ${JUGADOR3[$INDICE]} -eq $((${OROS[$PIVOTE_INFO]}-1))
											then
												PIVOTE_INFO=$(($PIVOTE_INFO-1))
												OROS[$PIVOTE_INFO]=${JUGADOR3[$INDICE]}
												CORRECTO=1
											fi
										fi
									fi

									if test ${JUGADOR3[$INDICE]} -ge 11 -a ${JUGADOR3[$INDICE]} -le 20 
									then
										if test ${ESPADAS[4]} -ne 0
										then
											if test ${JUGADOR3[$INDICE]} -eq $((${ESPADAS[$PIVOTE_SUPE]}+1))
											then
												PIVOTE_SUPE=$(($PIVOTE_SUPE+1))
												ESPADAS[$PIVOTE_SUPE]=${JUGADOR3[$INDICE]}
												CORRECTO=1

											fi
											if test ${JUGADOR3[$INDICE]} -eq $((${ESPADAS[$PIVOTE_INFE]}-1))
											then
												PIVOTE_INFE=$(($PIVOTE_INFE-1))
												ESPADAS[$PIVOTE_INFE]=${JUGADOR3[$INDICE]}
												CORRECTO=1
											fi
										else
											if test ${JUGADOR3[$INDICE]} -eq 15
											then
												ESPADAS[4]=${JUGADOR3[$INDICE]}
												CORRECTO=1
											fi
										fi
									fi

									if test ${JUGADOR3[$INDICE]} -ge 21 -a ${JUGADOR3[$INDICE]} -le 30 
									then
										if test ${BASTOS[4]} -ne 0
										then
											if test ${JUGADOR3[$INDICE]} -eq $((${BASTOS[$PIVOTE_SUPB]}+1))
											then
												PIVOTE_SUPB=$(($PIVOTE_SUPB+1))
												BASTOS[$PIVOTE_SUPB]=${JUGADOR3[$INDICE]}
												CORRECTO=1

											fi
											if test ${JUGADOR3[$INDICE]} -eq $((${BASTOS[$PIVOTE_INFB]}-1))
											then
												PIVOTE_INFB=$(($PIVOTE_INFB-1))
												BASTOS[$PIVOTE_INFB]=${JUGADOR3[$INDICE]}
												CORRECTO=1
											fi
										else
											if test ${JUGADOR3[$INDICE]} -eq 25
											then
												BASTOS[4]=${JUGADOR3[$INDICE]}
												CORRECTO=1
											fi
										fi
									fi

									if test ${JUGADOR3[$INDICE]} -ge 31 -a ${JUGADOR3[$INDICE]} -le 40 
									then
										if test ${COPAS[4]} -ne 0
										then
											if test ${JUGADOR3[$INDICE]} -eq $((${COPAS[$PIVOTE_SUPC]}+1))
											then
												PIVOTE_SUPC=$(($PIVOTE_SUPC+1))
												COPAS[$PIVOTE_SUPC]=${JUGADOR3[$INDICE]}
												CORRECTO=1

											fi
											if test ${JUGADOR3[$INDICE]} -eq $((${COPAS[$PIVOTE_INFC]}-1))
											then
												PIVOTE_INFC=$(($PIVOTE_INFC-1))
												COPAS[$PIVOTE_INFC]=${JUGADOR3[$INDICE]}
												CORRECTO=1
											fi
										else
											if test ${JUGADOR3[$INDICE]} -eq 35
											then
												COPAS[4]=${JUGADOR3[$INDICE]}
												CORRECTO=1
											fi
										fi
									fi

									if test $CORRECTO -eq 1
									then
										while test $I -lt $CARTA3 -a $FIND -eq 0
										do
											if test ${JUGADOR3[$I]} -eq 5
											then
												FIND=1
											fi
										I=$(($I+1))
										done

										echo "JUGADOR3 echa ${baraja[${JUGADOR3[$INDICE]}]}"      

										J=$(($I-1))
										if test $FIND -eq 1
										then
											while test $I -lt $CARTA3
											do
												JUGADOR3[$J]=${JUGADOR3[$I]}
												I=$(($I+1))
												J=$(($J+1))
											done
											JUGADOR3[$(($CARTA3-1))]=0
											CARTA3=$(($CARTA3-1))
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

				if test $CARTA3 -eq 0;
				then
					PUNTUAJE=$(($CARTA1+$CARTA2))
					GANADOR=2
					FINAL=1
				fi

				if test $SUM_TURNO -eq 3
				then
					RONDA=$(($RONDA+1))
					SUM_TURNO=0
				fi
			done			

        fi
        #Pondremos esto al finalizar cada partida
		TIME=$(($SECONDS - $START_TIME))
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
