while read name
do 
	mv /opt/files/* $(line.new).new1
done < /opt/files/new
