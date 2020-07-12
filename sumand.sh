read -p "Enter your number : " n1
read -p "Enter your 2nd number : " n2
if [[ $n1 -eq 44 && $n2 -eq 22 ]]
then
	echo " sum of two number :$((n1+$n2))"
else
echo dont done
fi
