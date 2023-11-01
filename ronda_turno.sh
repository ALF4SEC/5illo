FINAL=0
PIVOTE_SUPO=10
PIVOTE_INFO=1
PIVOTE_SUPO=20
PIVOTE_INFO=11
PIVOTE_SUPO=30
PIVOTE_INFO=21
PIVOTE_SUPO=40
PIVOTE_INFO=31
RONDA=1
TURNO=0
BARAJA=40
FIND=0
while test $FINAL -eq 0
do  
    clear  #Limpio la pantalla
    I=0
    
    echo "                  RONDA $RONDA                  "
    echo --------------------------------------------------
    echo "  JUGADOR  1  '|'  JUGADOR  2  '|'  JUGADOR  3  "
    echo --------------------------------------------------
    echo "  POS.- CARTA '|'  POS.- CARTA '|'  POS.- CARTA "
    while test $I -le CARTAS3
    do 
        echo "$I.- ${JUGADOR1[$I]}   $I.- ${JUGADOR2[$I]}   $I.- ${JUGADOR3[$I]}"
    done
    if $RONDA -eq 1
    then 
    echo COMIENZA EL 5 DE OROS
    I=0
    while test $I -lt $CARTAS1 -a $ENCUENTRA -eq 0
    do
        if ${JUGADOR1[$I]} -eq 5
        then
        ENCUENTRA=1
        ORO[4]=5
        else
        I=$(($I+1))
        fi
    done
    while test $I -lt $CARTAS2 -a $ENCUENTRA -eq 0
    do
        if ${JUGADOR2[$I]} -eq 5
        then
        ENCUENTRA=1
        ORO[4]=5
        else
        I=$(($I+1))
        fi
    done
    while test $I -lt $CARTAS3 -a $ENCUENTRA -eq 0
    do
        if ${JUGADOR3[$I]} -eq 5
        then
        ENCUENTRA=1
        ORO[4]=5
        else
        I=$(($I+1))
        fi
    done
    
    done
     
    else
    if test $TURNO -eq 1
    then
    while test $I -eq $CARTAS -a $PUEDE -eq 0
    do
        if test ${JUGADOR1[$I]} -ge 1 -a  ${JUGADOR1[$I]} -le 10
        then
        if test ${JUGADOR1[$I]} -eq ${JUGADOR1[$(($PIVOTE_INFO+1))]} -a ${JUGADOR1[$I]} -eq ${JUGADOR1[$(($PIVOTE_SUPO+1))]}
        then
        PUEDE=1
        fi
        if test ${JUGADOR1[$I]} -ge 11 -a  ${JUGADOR1[$I]} -le 20
        then
        if test ${JUGADOR1[$I]} -eq ${JUGADOR1[$(($PIVOTE_INFE+1))]} -a ${JUGADOR1[$I]} -eq ${JUGADOR1[$(($PIVOTE_SUPE+1))]}
        then
        PUEDE=1
        fi
        fi
        if test ${JUGADOR1[$I]} -ge 21 -a  ${JUGADOR1[$I]} -le 30
        then
        if test ${JUGADOR1[$I]} -eq ${JUGADOR1[$(($PIVOTE_INFB+1))]} -a ${JUGADOR1[$I]} -eq ${JUGADOR1[$(($PIVOTE_SUPB+1))]}
        then
        PUEDE=1
        fi  
        fi
        if test ${JUGADOR1[$I]} -ge 31 -a  ${JUGADOR1[$I]} -le 40
        then
        if test ${JUGADOR1[$I]} -eq ${JUGADOR1[$(($PIVOTE_INFC+1))]} -a ${JUGADOR1[$I]} -eq ${JUGADOR1[$(($PIVOTE_SUPC+1))]}
        then
        PUEDE=1
        fi  
        fi
    done

    if test $PUEDE -eq 1
    test
    I=0
    echo "Dame el indice de la carta que quieres echar: "
    read $INDICE
    while test $I -le CARTAS1
    do
        if test $I -eq $INDICE
        then
        if test ${JUGADOR1[$I]} -ge 1 -a  ${JUGADOR1[$I]} -le 10
        then
        if test 
        fi
        if test ${JUGADOR1[$I]} -ge 11 -a  ${JUGADOR1[$I]} -le 20
        then
        
        fi
        if test ${JUGADOR1[$I]} -ge 21 -a  ${JUGADOR1[$I]} -le 30
        then
          
        fi
        if test ${JUGADOR1[$I]} -ge 31 -a  ${JUGADOR1[$I]} -le 40
        then
        
        fi
        
    done
    fi
    fi
    fi

done



-----------------------------------------------------------------------------
 if test ${JUGADOR1[$I]} -ge 1 -a  ${JUGADOR1[$I]} -le 10
    then
    if test ${JUGADOR1[$I]} -eq ${JUGADOR1[$(($PIVOTE_INFO+1))]} -a ${JUGADOR1[$I]} -eq ${JUGADOR1[$(($PIVOTE_SUPO+1))]}
    then
    PUEDE=1
    fi
    fi
    if test ${JUGADOR1[$I]} -ge 11 -a  ${JUGADOR1[$I]} -le 20
    then
    if test ${JUGADOR1[$I]} -eq ${JUGADOR1[$(($PIVOTE_INFE+1))]} -a ${JUGADOR1[$I]} -eq ${JUGADOR1[$(($PIVOTE_SUPE+1))]}
    then
    PUEDE=1
    fi
    fi
    if test ${JUGADOR1[$I]} -ge 21 -a  ${JUGADOR1[$I]} -le 30
    then
    if test ${JUGADOR1[$I]} -eq ${JUGADOR1[$(($PIVOTE_INFB+1))]} -a ${JUGADOR1[$I]} -eq ${JUGADOR1[$(($PIVOTE_SUPB+1))]}
    then
    PUEDE=1
    fi  
    fi
    if test ${JUGADOR1[$I]} -ge 31 -a  ${JUGADOR1[$I]} -le 40
    then
    if test ${JUGADOR1[$I]} -eq ${JUGADOR1[$(($PIVOTE_INFC+1))]} -a ${JUGADOR1[$I]} -eq ${JUGADOR1[$(($PIVOTE_SUPC+1))]}
    then
    PUEDE=1
    fi  
    fi