extends Node2D

var Ball = preload("res://scenes/ball.tscn")
var Brick = preload("res://scenes/brick.tscn")

var score = 0;

func new_game():
	# instantiate rows
	for row in 3:
		for col in 8:
			var brick = Brick.instantiate();
			brick.init(row, col);
			brick.on_brick_hit.connect($HUD.update_score)
			get_tree().root.add_child(brick);
	
	# instantiate ball
	var ball = Ball.instantiate()
	ball.start(Vector2(600, 500), -45);
	get_tree().root.add_child(ball)
	
func _ready():
	pass;

func _on_victory_line_body_entered(body):
	print(body);
	$HUD.game_over("Victory!")

func _on_game_over_line_body_entered(body):
	$HUD.game_over("~Game over~")
