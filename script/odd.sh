i=1
while [ $i -le 100 ]
do
	o=$((i % 2))
	if [ $o -eq 0 ]
	then 
		echo "This is even number $i"
	else
		echo "This is odd Number $i"

	fi
	i=$((i+1))
done
