read -p "Enter your  Frist name  : " fname
read -p "Enter your Last Name : " lname
read -p "Etner your Address : " add
read -p " Enter your profession : " pro

os=$(uname -a)
proc=$(uname -p)
disk=$(df -h)

echo ###############onboarding started######
echo "Welcome Mr." $fname "$lname"
echo "Mr. $fname $lname your transport availabel $add"
echo "Mr. $fname $lname your prfession is $pr"
echo "You assgied below system configuracti############################n"
echo -e "$os \n$proc \n$disk"
