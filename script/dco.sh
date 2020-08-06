i=0
while  read -ep "Enter your name: " line
do
  # take action on $line #
  #echo "$line"
if [ $i -le 3 ]
then 
	 $line
else
	exit
fi
((i++))
done
#<<< $(ps aux)
