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
			EST=$((1+$RANDOM%$ESTRATEGIA))
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
		if test $(($JUGADORES%2)) -eq 0		#Comprobamos si el numero de jugadores es par, sino sera impar y habrá 3 jugadores
		then
			if test $JUGADORES -eq 2	#Si es par el numero de jugadores que hay 2 ó 4
			then	
			I=0
			J=0
			declare -A JUGADOR1
			declare -A JUGADOR2
			while test $I -le $(($BARAJA/2))
			do
				JUGADOR1[$J]=${NUMEROS[$I]}
				I=$(($I+1))
				J=$(($J+1))
			done
			J=0
			while test $I -le $BARAJA
			do
				JUGADOR2[$J]=${NUMEROS[$I]}
				I=$(($I+1))
				J=$(($J+1))
			done
			unset NUMEROS #Desdefinimos el vector de numeros aleatorios

			else
			CARTAS=10
			declare -A JUGADOR1
			declare -A JUGADOR2
			declare -A JUGADOR3
			declare -A JUGADOR4
			while test $I -le $CARTAS
			do
				JUGADOR1[$J]=${NUMEROS[$I]}
				I=$(($I+1))
				J=$(($J+1))
			done
			J=0
			while test $I -le $CARTAS
			do
				JUGADOR2[$J]=${NUMEROS[$I]}
				I=$(($I+1))
				J=$(($J+1))
			done
			J=0
			while test $I -le $CARTAS
			do
				JUGADOR3[$J]=${NUMEROS[$I]}
				I=$(($I+1))
				J=$(($J+1))
			done
			J=0
			while test $I -le $CARTAS
			do
				JUGADOR4[$J]=${NUMEROS[$I]}
				I=$(($I+1))
				J=$(($J+1))
			done

			unset NUMEROS #Desdefinimos el vector de numeros aleatorios


			fi
		else
		declare -A JUGADOR1
		declare -A JUGADOR2
		declare -A JUGADOR3 
		while test $I -le $CARTAS
		do
			JUGADOR1[$J]=${NUMEROS[$I]}
			I=$(($I+1))
			J=$(($J+1))
		done
		J=0
		while test $I -le $CARTAS
		do
			JUGADOR2[$J]=${NUMEROS[$I]}
			I=$(($I+1))
			J=$(($J+1))
		done
		J=0
		while test $I -le $CARTAS
		do
			JUGADOR3[$J]=${NUMEROS[$I]}
			I=$(($I+1))
			J=$(($J+1))
		done

		
		fi
		
		TIME=$(($SECONDS - $START_TIME)) #Pondremos esto al finalizar cada partida
		echo -e "$(date '+%d-%m-%Y')|$(date '+%H')|$JUG|$TIME|Rondas|Ganador|PuntosGanador|CartasJugadores" >> fichero.log
	;;
	e|E)
	

		#Codigo para saber el numero de lineas, osea, partidas, del fichero.log
		NUMPARTIDAS=$(sed -n '$=' fichero.log) 
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

		done < fichero.log

		echo "El tiempo total entre todas las partidas es de $TIEMPO segundos"
		#Fin del codigo

		#Media de los puntos obtenidos por el ganador en todas las partidas
		PUNTOS=0
		while IFS= read -r LINEA || [[ -n "$LINEA" ]]
		do
		PUNTOS=$(($(echo "$LINEA" | cut -d '|' -f7) + "$PUNTOS"))

		done < fichero.log

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
		    
		done < fichero.log
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
		LINEA=$(head -n 1 fichero.log)
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

		    
		done < fichero.log
		PART=$(head -n "$NUMP" fichero.log | tail -1)
		echo "La partida mas corta es la $NUMP => $PART"

		#Fin del codigo

		#Partida mas larga
		LINEA=$(head -n 1 fichero.log)
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

		    
		done < fichero.log
		PART=$(head -n "$NUMP" fichero.log | tail -1)
		echo "La partida mas larga es la $NUMP => $PART"

		#Fin del codigo

		#Partida con mayor numero de rondas
		LINEA=$(head -n 1 fichero.log)
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

		    
		done < fichero.log
		PART=$(head -n "$NUMP" fichero.log | tail -1)
		echo "La partida con mayor numero de rondas es la $NUMP => $PART"
		#Fin del codigo


		#Partida con menor numero de rondas
		LINEA=$(head -n 1 fichero.log)
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

		    
		done < fichero.log
		PART=$(head -n "$NUMP" fichero.log | tail -1)
		echo "La partida con menor numero de rondas es la $NUMP => $PART"

		#Fin del codigo


		#Partida con mayor numero de puntos obtenidos por el ganador
		LINEA=$(head -n 1 fichero.log)
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
		    
		done < fichero.log    
		PART=$(head -n "$NUMP" fichero.log | tail -1)
		echo "La partida con mayor numero de puntos del ganador es la $NUMP => $PART"    
		#Fin del codigo



		#Partida donde jugador 1 acabo con mayor numero de cartas
		LINEA=$(head -n 1 fichero.log)
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

		    
		done < fichero.log    
		PART1=$(head -n "$NUMP" fichero.log | tail -1)
		NUMP1="$NUMP"
		CARTAS1="$CARTASMAY"

		#Fin del codigo

		#Partida donde jugador 2 acabo con mas cartas
		LINEA=$(head -n 1 fichero.log)
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

		    
		done < fichero.log    
		PART2=$(head -n "$NUMP" fichero.log | tail -1)
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
		done < fichero.log    
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
			    
			done < fichero.log 
		    PART3=$(head -n "$NUMP" fichero.log | tail -1)
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
		done < fichero.log    
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
			done < fichero.log 
		    PART4=$(head -n "$NUMP" fichero.log | tail -1)
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
