while [ 1 ]
do
	echo "#######Menu List#####"
	echo 1. Install httpd
	echo 2. start httpd
	echo 3. stop httpd
	read -p " Enter the optction of your choice : "
		case i  in
			1) 
				echo "installing httpd..."
				yum install httpd -y
				echo "done";;
			2) 
				echo " starting httpd.."
				/etc/init.d/httpd start
				echo "done " ;;
			3) 
				echo " stop httpd .."
				/etc/init.d/httpd stop
				echo "done";;
			*) 
				echo "wrong entry"
				esac
			done
