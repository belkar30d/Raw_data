#str=datta
#str2=belkar
read -p " enter your fname : " str
read -p "enter you lname "  str2
if [[ $str == "dbatta" && $str2 == "belkar" ]]
then 
echo "your are $str $str2"
else
echo "your are not right person"
fi
