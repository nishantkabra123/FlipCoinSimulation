HEADS=1
TAILS=0
countHead=0
countTail=0
TOTAL=21
while [[ $countHead -lt $TOTAL && $countTail -lt $TOTAL ]]
do
    toss=$((RANDOM%2))

    if [ $toss -eq $TAILS ]
    then
        ((countTail++))
        echo Tails is winner
    elif [ $toss -eq $HEADS ]
    then
        ((countHead++))
        echo Heads is winner
    fi
done           

if [ $countHead -eq $TOTAL ]
then
    echo Heads has won $countHead times by margin of $(($countHead-$countTail))
elif [ $countTail -eq $TOTAL ]
then
    echo Tails has won $countTail times by margin of $(($countTail-$countHead))
fi
