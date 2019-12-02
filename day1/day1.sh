#!/usr/bin/env bash

total=0
while IFS= read -r line
do 
  calculatedModule=$(((line / 3) - 2))
  total=$((total + calculatedModule))
done < input.txt
echo $total
