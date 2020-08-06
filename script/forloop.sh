#!/bin/bash
#file="/opt/script/for.txt"
#for i in $file
#do
#	echo $datta
#done
#< /opt/script/for.txt
#!/bin/bash
# A shell script to verify user password database
files="/etc/passwd /etc/group /etc/shadow /etc/gshdow"
for f in $files
do
	[  -f $f ] && echo "$f file found" || echo "*** Error - $f file missing."
done

