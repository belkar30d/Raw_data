read x
read y

if [ $x -lt $y ]
then
	echo "x is less than y"
elif [ $x -gt $y ]
then
	echo "x is greater than y"
elif [ $x -eq $y ]
then
	echo "x is equal to y"
fi

