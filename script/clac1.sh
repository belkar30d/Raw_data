echo "Enter Number and Operator"
if [ $1 == "sum" ]
then 
	var=$(($2+$3))
	echo "Sum is this $2, $3 :- $var"
elif [ $1 == "/" ]
then
	var=$(($2/$3))
	echo "div is this $2, $3 :- $var"

fi
