returninshell(){
	mem=$(awk '/^Mem/ {print $3}' <(free -m))
	echo "$mem"
	return $mem
}
returninshell
if [ $? -ge 305 ]
then 
	echo "Mem is Okay"
else
	echo "Mem need to incaresed"
fi

