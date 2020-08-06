arry=($1 $2 $3 $4 $5 $6 $7 $8 $9 ${10} ${11} ${12} ${13} ${14} ${15} ${16})
echo "My array has this : ${arry[@]}"
echo "Sentence 1 : ${arry[@]:0:4}"
echo "Sentence 2 : ${arry[@]:5:16}"
