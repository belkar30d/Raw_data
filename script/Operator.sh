read -p " Enter your number:-" a
echo "#######Arithmetic operator#######"
echo "((2+2)) This is use for addication:-- $((2+2))"
echo "((10*2)) this is use for multipaction :-- $((10*2))"
echo "((10-5)) this is use for substraction :-- $((10-5))"
echo "((10/5)) this is use for devesion :-- $((10/5))"
echo "is is showing how to use bc commnad :-"  $((100^2 | bc))
echo "$((a++))"
echo "#########Logical Operator########"
a=$1
b=$2

echo "\[ "$a" == datta ] && [ "$b" == belkar ] && (-a) This operator use for compare two string borth string shoud be true"

if [ "$a" == datta ] && [ "$b" == belkar ]
then 
	echo "This is True condication"
else
	echo " This is faluse"
fi
echo "\[ "$a" == datta ] || [ "$b" == belkar ] || (-o) This operator use for compare two string any one string shoud be true"
if [ $1 == datta ] || [ $2 == belkar  ]
then 
	
	echo " This is true condication of or operator"
else
	echo "This is false condication of or operator"
fi
	

