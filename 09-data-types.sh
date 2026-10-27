#!/bin/bash

var1=10
var2=20
var3=30

echo "$var1+$var2"
echo "$(($var1+$var2+$var3))"

declare -i count=5
COUNT=COUNT+1

echo "count is: $COUNT"

FRUITS=("Apple" "Banana" "Pappaya")
echo "All fruits: ${fruits[@]}

