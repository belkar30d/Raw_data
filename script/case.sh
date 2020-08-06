while [ 1 ]
do
	echo "#######Menu List#####"
	echo 1. Install httpd
	echo 2. start httpd
	echo 3. stop httpd
	echo 4. exit
	echo 5. httpd staus
	read -p " Enter the optction of your choice : " i
		case $i  in
			1) 
				echo "installing httpd..."
				yum install httpd -y
				echo "done";;
			2) 
				echo " starting httpd.."
				#/etc/init.d/httpd start
				systemctl start httpd
				echo "done " ;;
			3) 
				echo " stop httpd .."
				#/etc/init.d/httpd stop
				systemctl stop httpd
				echo "done";;
			4) 
				echo "bye..."
				exit;;
			5) 
				echo " check httpd status"
				systemctl status httpd;;
			*) 
				echo "wrong entry"
				esac
			done
