extends Node2D

var Ball = preload("res://scenes/ball.tscn")

var score = 0;

func new_game():
	var b = Ball.instantiate()
	b.start(Vector2(600, 500), -45);
	get_tree().root.add_child(b)
	
func _ready():
	pass;
