cat /opt/com.txt

while read line
do 
	 $line
done < /opt/com.txt
