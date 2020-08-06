while IFS="	" read -r h1 h2 h3 h4 h5 h6 h7
do
	echo $h1
done < /opt/ifs.txt
