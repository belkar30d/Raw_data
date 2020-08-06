read x
read y
read z
if [ $x -eq $y ] && [ $x -eq $z ] && [ $y -eq $z ]
then
        echo "EQUILATERAL"
#elif [  $x -eq $y ] && [ $x -eq $z ] || [ $y -eq $z ]
else
	if [  $x -eq $y ] || [ $x -eq $z ] || [ $y -eq $z ]
	then
		echo "ISOSCELES"
	else
#		if [ $x -eq $z ] && [ $y -eq $z ]
#		 then 
#			 echo "ISOSCELES"
#		 else
			 echo "SCALENE"
#		 fi
	 fi
 fi

#then
#	echo "ISOSCELES"
#else 
#	echo "SCALENE"
#fi
