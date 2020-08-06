##while read dd
#do 
#	${dd}| grep -i /
#	exit
#	
#done

#while read line;
#do 
#	rm -rf /opt/data/"$DATE"
##	DATE='date+%d%m%y'
#	DATE=`date +%Y%m%d`
#	mkdir -p /opt/data/"$DATE"
#	$line >> /opt/data/w_"$DATE".txt
#done < /opt/com.txt
while read line;
do
	$line | grep -i shell
while [ $line -nl 0 ]
do 
	$line++
done
done < /opt/wordcount.txt

