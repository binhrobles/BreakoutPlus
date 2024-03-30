extends Node2D

var score = 0;

func new_game():
	$Ball.start();
	
func _ready():
	new_game()
