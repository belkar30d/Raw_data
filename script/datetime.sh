me=$(date +"%d-%m-%y")
time=$(date +"%T")
set $(who)
p=$(pwd)
echo "Print the cureent date"
echo "$me"
echo "print the current time"
echo $time
echo "print the cureent user name"
echo $1
echo "print the cureent working  direcoty"
echo $p
