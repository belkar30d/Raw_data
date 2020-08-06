
dirdate=$(date +"%d-%m-%y")
while [ 1 ]
do
	echo "1. Creating file.."
       echo "2. Create new Dir one requred path"
	echo "3. Copy file/ Dir on required path"
 	echo "4. Delete file/Dir"
	echo "5. Checking is file created or not"
	echo "6. exit"
	
	read -p "Enter your file/Dir Name:-" name
	echo "$name"
	case $name in 
		1) echo "file creating...."
			touch $1_$dirdate;;
		2) echo "creating Dir"
			mkdir -p $1_$dirdate;;
		3) echo "copy file"
			cp -pr $1 $2;;
		4) echo "Deleting file and dir"
			if [ -d $1_$dirdate ] 
			then
				rm -rfi $1_$dirdate
			else
				rm -i $1_$dirdate
			fi;;
		5) echo "Checking is file created or not"
			if [ -d $1_$dirdate ]
			then
			ls -d $1_$dirdate
			echo "This is directory .."
			else
			ls  $1_$dirdate
			echo "This file created.."
		fi;;
		6) echo "bye..."
	
			exit;;
		esac
done	
