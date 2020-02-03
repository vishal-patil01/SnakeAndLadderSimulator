#!/bin/bash 
echo "Welcome to Snake And Ladder Simulator"

#!Initialize Constants
NO_PLAY=0
LADDER=1
SNAKE=2
START_POSITION=0
WIN_POSITION=100

#!Initializing Variables
player=2
playerPosition=0
diceRoll=0
declare -A gameStatistics

#!Function To set playerPosition according to playing Options like NO_Play or Snake or Ladder
function setPlayerMoves() {
	#!setting players turn One bye one
	switchPlayer
	#!Storing dice values between 1 to 6 & set playing Options
	dieValue=$((RANDOM % 6 + 1))
	playingOptions=$((RANDOM % 3))
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
	gameStatistics[player:$player]="$playerPosition,$diceRoll"
}

function playUntilWin() {
	while [ $playerPosition -ne $WIN_POSITION  ]
	do
		setPlayerMoves
	done
	#!after game ends display who wins and required diceRoll for win
	echo "player:$player won in $diceRoll DiceRoll"
}

function resetWrongPosition {
	#! Ensures playerPosition is not below 0 and not greater than 100
	if [ $playerPosition -lt $START_POSITION ]
	then
		playerPosition=0
	elif [ $playerPosition -gt $WIN_POSITION ]
	then
		playerPosition=$((playerPosition - dieValue))
	fi
}

function switchPlayer() {
	if [ $player -eq 1  ]
	then
		player=2
	else
		player=1
	fi
}
#!Start game
playUntilWin

