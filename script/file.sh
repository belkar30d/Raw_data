read -p "Enter file name : " file
if [ $file != abc ]
then
	set $(date)
	mkdir -p /opt/$6 && cd /opt/$6
	touch $file
else
	echo " $file already there"
fi

