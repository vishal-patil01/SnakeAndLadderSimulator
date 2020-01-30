#!/bin/bash -x
echo "Welcome to Snake And Ladder Simulator"

#!Initialize variables & constants
playerPosition=0
NO_PLAY=0
LADDER=1
SNAKE=2

#!Function To set playerPosition according to playing Options like NO_Play or Snake or Ladder
function setPlayerMoves() {

	#!Storing dice values between 1 to 6 & set playing Options

	dieValue=$((RANDOM % 6 + 1))
	playingOptions=$((RANDOM % 3))

	#! Increment player Position according to $playingOptions
	
	case $playingOptions in
		$NO_PLAY)
			playerPosition=$playerPosition
			;;
		$LADDER)
			playerPosition=$((playerPosition + dieValue))
			;;
		$SNAKE)
			playerPosition=$((playerPosition - dieValue))
			;;
	esac
echo "Player Position : "$playerPosition
}

#!Start game
setPlayerMoves
