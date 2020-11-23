HEADS=1
TAILS=0
count=0
countHead=0
countTail=0
while [ $count -ne 10 ]
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
    ((count++))
done           

echo Heads has won $countHead times
echo Tails has won $countTail times
