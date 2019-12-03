#!/usr/bin/env bash

total=0
while IFS= read -r line
do 
  fuel=$(((line / 3) - 2))
  while [[ $fuel -gt 0 ]]
  do
    total=$((total + fuel))
    fuel=$(((fuel / 3) - 2))
  done
done < input.txt

echo $total
