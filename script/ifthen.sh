i="df -h"
if [ "$1" == "$1" ]
then 
	echo "This files exist in this dir"
	echo "#############################"
	#df -h
	$1
echo "print value of \$0:--" $0
echo "print value of \$*:--$*"
echo "print value of \$@:--$@"
echo "print value of \$!:--$!"
echo "print value of \$?:--$?"
echo "print value of \$#:--$#"
echo "print value of \$$:--$$"
else
	echo " this file not exist in this dir"
fi

var=(10,"datta",4.0,"IT")
echo ${var[ 1 ]}
