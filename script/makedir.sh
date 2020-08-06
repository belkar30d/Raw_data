dir=$1
if mkdir $dir
then
	echo ">&2 created"
else
	echo "not created"
fi
