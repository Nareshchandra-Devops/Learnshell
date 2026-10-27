#!/bin/bash

var1=10
var2=20
var3=naresh

echo "$var1+$var2"
echo "$((var1+var2+var3))"

declare -i count=5
count=count+1

echo "count is: $count"

FRUITS=("Apple" "Banana" "Pappaya")
echo "All fruits: ${FRUITS[@]}"
echo "first fruits: ${FRUITS[0]}"