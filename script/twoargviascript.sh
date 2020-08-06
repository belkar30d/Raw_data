if [ $# -eq 2 ]
then
	echo "Script Name:- $0"
	echo "Number of argument:- $#"
	#sleep 60
	echo " Process id:- $$"
	echo " Welcome to unix shell scripting Mr. $1 $2"
	#sleep 60
else
	echo "Give two argument while running script"
fi
