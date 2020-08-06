welcome(){
	read -p "Enter Your FName, LName:-" name
	echo $name
}
#welcome
course_Details(){
	welcome name
	echo "Sub:- Linux"
}
course_Details
