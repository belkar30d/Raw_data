read X
printf "%.3f" $(echo "scale=4;$X" | bc)
