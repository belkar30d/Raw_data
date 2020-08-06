if [ -d $1 ]
then
	echo " Directory exist"
elif [ -f $1 ]
then
	#echo "File exist"
if [ -s $1 ]
then
	echo "This is not empty"
	while read -r line
	do
		echo $line
	done < $1

else
	echo "empty file"
	echo “programming a fun stuff.” > $1
	fi
fi
