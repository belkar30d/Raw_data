read -p "Enter your Number:- " a
while [ $a -le 11 ]
do
	echo "this is $a time"
	if [ "$b" -le "10" ]
	then 
		(($b*2))

	fi

	a=$((a*2))
	echo "multi :- $a"
	((++a))

done
