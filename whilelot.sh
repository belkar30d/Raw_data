#read -p "Enter your Fname : " fname
#read -p "Enter your Ticket ID : " tid
#while [ $fname == "datta" ] && [ $tid -eq 007 ]
var=1
while [ $var -le 5 ]
do 	
	read -p "Enter your Fname : " fname
	read -p "Enter your Ticket ID : " tid
	if [ $fname == "datta" ] && [ $tid -eq 007 ]
	then
	echo " Youe won"
	exit
else
	attamp=$((5 - $var))
	if [ $attamp -ne 0 ]
	then 
	#i=$((var+1))
	echo "you have $attamp"
	else
	#if [ $fname != "datta" ] && [ $tid -ne 007 ]
	#then 
#		echo " You need to try again"
echo " your attampts are over"
exit
fi
fi
var=$(( var + 1 ))
done
