dirdate=$(date +"%m-%d-%Y")
while [ $1 == $1 ]
do
	echo " This is file $1"
	if [ -d /mnt/.$dirdate ]
	then
		cp -pr $1 /mnt/.$dirdate/
		echo "File/Dir copied $1"
	else 
		mkdir -p /mnt/.$dirdate/ && cp -pr $1 /mnt/.$dirdate/
		 echo "File/Dir copied $1 and dir created"
	fi
	rm -rfi $1
	exit
done
