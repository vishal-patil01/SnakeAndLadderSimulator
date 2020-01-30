#!/bin/bash -x
echo "Welcome to Snake And Ladder Simulator"

#!Initialize variables
playerPosition=0
dieValue=$((RANDOM % 6 + 1))

echo $dieValue
