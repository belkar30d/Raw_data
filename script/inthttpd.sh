read -p "enter which pkg you want install " pkg
http=$(httpd -v)
if [ $pkg == $pkg ]
then
       if [ $http != $http ]	
       then
	echo "$pkg installing.."
	yum install $pkg -y 
	echo "####Kindly check $pkg status#######"
	systemctl status $pkg
else 
	echo "not installing $pkg already installed"
fi
else 
	echo "pkg already installed"
fi


