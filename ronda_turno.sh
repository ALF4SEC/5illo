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
ENCUENTRA=0
while test $FINAL -eq 0
do 
    echo RONDA $RONDA
    echo -------------
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
    echo RONDA $RONDA
    echo -------------
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

done
