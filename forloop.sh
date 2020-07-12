sc=("Albert Enstien" "Ramanujan" "Arybhat" "Galileo")
for i in "${sc[@]}"
do 
	if [ "$i" == "Albert Enstien" ]
	then
		echo "$i Thery of relivatiry"
	elif 
		[ "$i" == "Ramanujan" ]
	then 
		echo "$i is grate math"
	elif 
		[ "$i" == "Arybhat" ]
	then 
		echo "$i is astoronut"
	else
		echo "$i is invented telescope"
	fi
done


