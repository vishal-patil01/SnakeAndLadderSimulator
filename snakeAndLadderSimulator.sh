#!/bin/bash 
echo "Welcome to Snake And Ladder Simulator"

#!Initialize Constants
NO_PLAY=0
LADDER=1
SNAKE=2

#!Initializing Variables
playerPosition=0
diceRoll=0
declare -A gameStatistics

#!Function To set playerPosition according to playing Options like NO_Play or Snake or Ladder
function setPlayerMoves() {

	#!Storing dice values between 1 to 6 & set playing Options
	dieValue=$((RANDOM % 6 + 1))
	playingOptions=$((RANDOM % 3))
	#!increment Dice Count
	((diceRoll++))

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

		#!Reset player Position if position is not between 0 to 100 
		resetWrongPosition
		#!storing diceCount and player positions in Dictionary
		gameStatistics[DiceRoll:$diceRoll]=$playerPosition
}

function playUntilWin() {
	while [ $playerPosition -ne 100  ]
	do
		setPlayerMoves
	done
}

function resetWrongPosition {
	#! Ensures playerPosition is not below 0
	if [ $playerPosition -lt 0 ]
	then
		playerPosition=0
	elif [ $playerPosition -gt 100 ]
	then
		playerPosition=$((playerPosition - dieValue))
	fi
}

#!Start game
playUntilWin

