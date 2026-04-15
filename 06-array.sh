#!/bin/bash

FRUITS=("APPLE" "MANGO" "GUAVA")

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

echo "Printing the fruit names with their colours"

echo -e "First fruit is::$R ${FRUITS[0]} $N"
echo -e "Second fruit is::$Y ${FRUITS[1]} $N"
echo -e "Third fruit is::$G ${FRUITS[2]} $N"

echo "All fruits are:: ${FRUITS[@]}"