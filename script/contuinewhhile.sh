i=1
while [ $i -le 10 ]
do
#	i=$(($i+1))
#	echo $i
	if [ $i -eq 5 ]
	then
#	echo $
	#i=$(($i+1))
	continue
	#break
fi
echo $i
i=$(($i+1))

done


