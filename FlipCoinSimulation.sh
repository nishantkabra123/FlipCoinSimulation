HEADS=1
TAILS=0

toss=$((RANDOM%2))

if [ $toss -eq $TAILS ]
then
    echo Tails is winner
elif [ $toss -eq $HEADS ]
then
    echo Heads is winner
fi        