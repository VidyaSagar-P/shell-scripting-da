#!/bin/bash

FRUITS=("APPLE" "MANGO" "GUAVA")

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

echo "Printing the fruit names with their colours"

echo -e "$R First fruit is:: ${FRUITS[0]} $N"
echo -e "$YSecond fruit is:: ${FRUITS[1]} $N"
echo -e "$GThird fruit is:: ${FRUITS[2]} $N"

echo "All fruits are:: ${FRUITS[@]}"