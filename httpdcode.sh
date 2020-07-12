count=$(awk '{print $1}' /var/log/httpd/access_log)
#while read -r line
while [ $count -le 10 ]

do 
echo $count  times come

((count++))
done < "$count" 
