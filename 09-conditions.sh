#!/bin/bash

NUM=$1

if [ $NUM -gt 20 ]
then
    echo "Given number::$NUM is greater than 20"
else
    echo "Given number::$NUM is less than 20"
fi