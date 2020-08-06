while read line
do
	if [ -d $1 ] || [ -f $1 ]
	then
	echo $line
else
	echo "direct exsit"
fi
done < $1

