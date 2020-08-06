file=$1
if [ -b $file ]
then 
	echo "this is block special file"
else
	echo "This is not block special file"
fi

echo "##############Test charactor special file#######"

if [ -c $file ]
then
	echo " This is charactor special file :- $file"
else
	echo "This is not charactor special file :- $file"
fi
echo "##############test directory exists or not #####"
if [ -d $file ] || [ -c $file ]
then
	echo "This is directory exists $file"
else
	echo "this is not directory exists"
fi
echo "##############test file exists or not #####"
if [ -e $file ]
then 
	echo "This file exists $file"
else
	echo "This file not exits $file"
fi
echo "##############test write access  or not #####"
if [ -w $file ]
then 
	echo "This file have write access :- $file"
else
	echo "This file dont have write access :- $file"
fi
echo "##############Test given file is empty or not#######"\n
if [ -s $file ]
then
	echo "This file is empty $file"
else
	echo "#this file is not empty $file"
fi
echo "##############Test given file is having x permission or not#######"
if [ -x $file ]
then
	echo " This file having x permission; $file"
else
	echo "This file dont have x permission : $file"
fi

