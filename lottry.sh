read -p "Enter your Fname : " fname
read -p "Enter Ticket Number : " tid
if [ $fname == "datta" ] && [ $tid -eq 007 ]
then 
	echo "Mr. $fname your are won lottry Ticket ID is $tid"
else
	echo "Mr. $fname next time"
fi

