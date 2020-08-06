drive=$(awk '{print $1}' <(df -h /backup/) | egrep -v Filesystem)
if [ $drive == /dev/xvdf1 ]
then
	echo "alredy mounted"
#mount /dev/xvdf1 /backup
else
	#echo "alredy mounted"
	mount /dev/xvdf1 /backup
fi

