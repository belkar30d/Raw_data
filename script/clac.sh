calulator(){
	if [ $3 == sum ]
	then 
		sum=$(($1+$2))
		echo "Addication :- $sum"
	elif [ $3 == mult ]
	then
		mult=$(($1*$2))
		echo "multi :- $mult"
	elif [ $3 == div ]
	then
		div=$(($1/$2))
	echo "div :- $div"
elif [ $3 == sub ]
then
	sub=$(($1-$2))
	echo "substration :- $sub"
else
	echo " flag not valid"
	fi


}
calulator $1 $2 $3
