extends CanvasLayer

# Notifies `Main` node that the button has been pressed
signal start_game

var score = 0;

func reset_score():
	score = 0;
	$ScoreLabel.text = str(score)

func update_score(points):
	score += points;
	$ScoreLabel.text = str(score)

func game_over(message):
	get_tree().call_group("bricks", "queue_free");
	get_tree().call_group("balls", "queue_free");
	$Message.text = "%s\nFinal Score: %d" % [message, score]
	$Message.show();
	
	await get_tree().create_timer(2.0).timeout
	$Message.hide();
	$StartButton.show();
	reset_score();

func _on_start_button_pressed():
	$StartButton.hide()
	start_game.emit()
