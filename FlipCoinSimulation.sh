#!/bin/bash 

HEADS=1
TAILS=0
countHead=0
countTail=0
TOTAL=21
TIE=20
isTie=0
difference=0
winner=2

function solveTie(){

    while [ $difference -lt 2 ]
    do

        toss=$((RANDOM%2))
        if [ $toss -eq $TAILS ]
        then
            ((countTail++))
            getDifference
        elif [ $toss -eq $HEADS ]
        then
            ((countHead++))    
            getDifference
        fi    
        
    done

    if [[ $difference -eq 2 && $winner -eq $HEADS ]]
    then
        echo Heads has won $countHead times by margin of $(($countHead-$countTail))
    elif [[ $difference -eq 2 && $winner -eq $TAILS ]]
    then
        echo Tails has won $countTail times by margin of $(($countTail-$countHead))
    fi   
    
}

function getDifference(){
    if [ $countHead -gt $countTail ]
    then
        difference=$(($countHead-$countTail))
        winner=$HEADS
    elif [ $countHead -eq $countTail ]
    then
        difference=0    
    elif [ $countHead -lt $countTail ]
    then
        difference=$(($countTail-$countHead))
        winner=$TAILS
    fi
}

while [[ $countHead -lt $TOTAL && $countTail -lt $TOTAL ]]
do
    toss=$((RANDOM%2))

    if [ $toss -eq $TAILS ]
    then
        ((countTail++))
        if [[ $countTail -eq $TIE &&  $countHead -eq $TIE ]]
        then
            isTie=1
            echo TIE tails is $countTail and heads is $countHead
            solveTie
            break
        fi
        echo Tails is winner
    elif [ $toss -eq $HEADS ]
    then
        ((countHead++))
         if [[ $countTail -eq $TIE &&  $countHead -eq $TIE ]]
        then
            isTie=1
            echo TIE tails is $countTail and heads is $countHead
            solveTie
            break
        fi
        echo Heads is winner
    fi
done           

if [[ $countHead -eq $TOTAL && $isTie -ne 1 ]]
then
    echo Heads has won $countHead times by margin of $(($countHead-$countTail))
elif [[ $countTail -eq $TOTAL && $isTie -ne 1 ]]
then
    echo Tails has won $countTail times by margin of $(($countTail-$countHead))
fi

