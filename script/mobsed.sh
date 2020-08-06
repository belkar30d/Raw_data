fil=/opt/mobile.txt
while read line
do
	sed -e 's/^[0-9]\{3\}/(&)/' -e 's/1[0-9]\{2\}/"&"/' $fil
	echo $line
done < /opt/mobile.txt
