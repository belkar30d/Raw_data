#commnd=/opt/script/com.txt
#if [ $command == $command ]
#then 
#       echo $(command) >> /opt/2.txt
#fi
while read -r line
do
	echo "#####$line####"
	$line
done</opt/script/com.txt
