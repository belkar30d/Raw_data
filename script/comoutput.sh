while read line
do
	echo " ######output of $line ###"
	$line
	if [ ! -z $line ]
	then 
		yum install $line -y
	else
		echo "error"
#else
#	echo "error done"
fi
done < /opt/com.txt
